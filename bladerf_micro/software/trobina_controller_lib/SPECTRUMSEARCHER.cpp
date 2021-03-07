/*
 * SPECTRUMSEARCHER.cpp
 *
 *  Created on: Jan 9, 2021
 *      Author: GMateusDP
 */

#include "SPECTRUMSEARCHER.h"
#include <unistd.h>
#include "string.h"
#include <inttypes.h>
#include "stdio.h"


static LED_CONTROLLER	local_leds;
static ADF5610_Driver local_tx_pll;
static SENSOR_READER_CLASS		local_rx_pll;
static LTC5548_HANDLER		local_ltc;
static float incomming_frequency=OVER_FLOW_FREQUENCY;

SPECTRUM_SEARCHER::SPECTRUM_SEARCHER() {
	// TODO Auto-generated constructor stub
	leds=&local_leds;
	memory_address=0;
	direction=true;
	rx_locked=false;
	bool_result=false;
	tx_pll_error_counter=0;
	tx_pll_reset_counter=0;
	window_counter=0;
	step=(MAX_RX_BANDWIDTH)/(1.0*1000.0*1000.0);
	got_index=false;

}

SPECTRUM_SEARCHER::~SPECTRUM_SEARCHER() {
	// TODO Auto-generated destructor stub
}

bool SPECTRUM_SEARCHER::Init(float sf){
	start_frequency=sf;
	current_frequency=start_frequency;
	//printf("!!!	Checking	!!!\n");
	//punch_frequency=current_frequency;
	leds=&local_leds;
	tx=&local_tx_pll;
	rx=&local_rx_pll;
	ltc=&local_ltc;

	leds->Init(true);
	printf("!!!	Checking	LEDS!!!\n");
	while(!tx->Init()){
		usleep(10000);
			leds->toogle_leds(1);
			printf("tx pll not initialize");
	}


	tx->SetFrequency((double)current_frequency);

	leds->set_leds(1,false);
	while(!tx_pll_locked()){
		usleep(10000);
		leds->toogle_leds(1);
	}
	leds->set_leds(1,false);
	printf("init spectrum tx Locked at: %f\n",tx->current_frequency);
	next_frequency=current_frequency;
	while(!rx->Init(current_frequency)){
		usleep(100);
		leds->toogle_leds(1);
		printf("sensor not initialize");
	}
	leds->set_leds(1,false);
	rx->Init(current_frequency);
	rx->set_frequency(current_frequency);
	while(!rx_is_locked()){
		usleep(100);
		leds->toogle_leds(1);
		printf("rx not Locked at: %" PRId64 "\n",rx_frequency);
	}
	leds->set_leds(1,false);
	while(!ltc->Init(tx)){
		usleep(10000);
		leds->toogle_leds(1);
		printf("ltc not Locked started");
	}
	leds->set_leds(1,false);
	ltc->Start_Mixer();
	isOK=true;
	return isOK;

}
float SPECTRUM_SEARCHER::start_searching(bool *token){
	got_index=false;
	got_inline=true;
	if(incomming_frequency<OVER_FLOW_FREQUENCY){
		current_frequency=incomming_frequency;
		configurate_reentry_step();
	}else{
		printf("init frequency: %f\n",current_frequency);
	}


	window_counter=0;
	while((*token)&(window_counter<MAXIMUM_INDEX_REPETITIONS)){
		//leds->set_leds(2,false);
		if(search_reliable_index()){
			window_counter++;
		}else{
			window_counter=0;
			leds->set_leds(2,false);
			configurate_next_step();
		}



	}
	if(window_counter>=MAXIMUM_INDEX_REPETITIONS-1){
		incomming_frequency=next_tx_frequency();
		printf("punch: %lf\n",incomming_frequency);
	}

	return current_frequency;


}

bool SPECTRUM_SEARCHER::search_reliable_index(void){
	tries_counter=0;
	bool_result=false;
	got_sequence=true;
	if(tx_pll_locked()){
		if(rx_is_locked()){
			while((tries_counter<MINIMUM_VALID_INDEXES)&(got_sequence)){
				if(got_max_index()){
					if(tries_counter<1){
						got_sequence=true;
					}else{
						for(uint8_t i=0; i<tries_counter;i++){
							if(index[i+1]==index[i]){
								bool_result=true;
								leds->set_leds(2,true);
							}else{
								bool_result=false;
								got_sequence=false;
								break;
							}

						}
					}
				}else{
					got_sequence=false;
					bool_result=false;
				}
				tries_counter++;
			}
		}
	}
	if(got_sequence){
		printf("reliable_max_index:  %d\t",index[0]);
		printf("tx Locked at: %lf\n",tx->current_frequency);
	}else{
		for(uint8_t i=0; i<MINIMUM_VALID_INDEXES;i++){
			index[i]=0xff;
		}
		leds->set_leds(2,false);
	}
	return bool_result;



}

bool SPECTRUM_SEARCHER::got_max_index(void){
	bool_result=false;

	max_index=IORD_8DIRECT(INDEX_INPUT_BASE,0);
	if ((max_index>0)){
		for(uint8_t i=0; i<MINIMUM_VALID_INDEXES-1;i++){
			index[i+1]=index[i];
		}

		index[0]=(max_index);
	//	printf("got_max_index:  %d\t",index[0]);
	//	printf("tx Locked at: %lf\n",tx->current_frequency);
		leds->set_leds(2,true);
		//punch_frequency=current_frequency;
		bool_result=true;
	}
	return bool_result;
}

bool SPECTRUM_SEARCHER::tx_pll_locked(void){
	bool_result=false;

	if(tx->IsLocked()){
		tx_pll_error_counter=0;
		tx_pll_reset_counter=0;
		current_frequency=tx->current_frequency;
		bool_result=true;
	}else{
		tx_pll_error_counter++;
		if(tx_pll_error_counter==0){
			tx_pll_reset_counter++;
			if(tx_pll_reset_counter==0){
				 tx->Init();
				 tx->SetFrequency(current_frequency);
				 printf("restart tx_pll!   %lf\n",current_frequency );
			}else{
				tx->SetFrequency(current_frequency);
				//printf("reconfigured tx_pll!\n" );
			}

		}
	}
	return bool_result;
}
bool SPECTRUM_SEARCHER::rx_is_locked(void){
	rx_pll_error_counter=0;
	if (rx_locked){
		rx_locked=rx->is_locked();
		rx->force_ENSM_RX_mode();
	}else{
		rx_frequency=(uint64_t)(next_frequency*1000*1000);
		//printf("Current frequence: %lf\n",current_frequency);
		rx->set_frequency(rx_frequency);

		rx_pll_error_counter=0;
		while((rx_pll_error_counter<0xff)&(!rx_locked)){
			if(rx->is_locked()){
				rx_locked=true;
				rx_pll_error_counter=0;
				//printf("rx Locked at: %" PRId64 "\n",rx->current_frequency);


			}else{
				rx_locked=false;
				rx_pll_error_counter++;
				if(rx_pll_error_counter%32==0){
					rx_frequency=(uint64_t)(next_frequency*1000*1000);
					printf("rx not Locked at: %" PRId64 "\n",rx_frequency);
					//printf("Current frequence: %lf\n",current_frequency);
					rx->set_frequency(rx_frequency);
				}
			}
		}
	}
	return rx_locked;
}

float SPECTRUM_SEARCHER::next_tx_frequency(void){


	return _next_tx_frequency(current_frequency);
}
float SPECTRUM_SEARCHER::next_tx_frequency(float cf){

	return _next_tx_frequency(cf);
}
float SPECTRUM_SEARCHER::_next_tx_frequency(float cf){
	//printf("current frequency: %lf\n",current_frequency);
	next_frequency=(cf)+step*(direction?1:-1);

	if(direction){
		if(next_frequency>(UPPER_RX_FREQUENCY-step)){
			direction=false;
			leds->set_leds(3,true);
			if(next_frequency>UPPER_RX_FREQUENCY){
				next_frequency=UPPER_RX_FREQUENCY;
			}else{
				next_frequency=cf-1/1000.0;
			}

		}
	}else{
		if(next_frequency<(LOWER_RX_FREQUENCY+step)){
			direction=true;
			leds->set_leds(3,true);
			if(next_frequency<LOWER_RX_FREQUENCY){
				next_frequency=LOWER_RX_FREQUENCY;
			}else{
				next_frequency=cf-1/1000.0;
			}

		}
	}
	leds->set_leds(3,false);
//	printf("next frequency: %lf\n",next_frequency);
	return next_frequency;
}

void SPECTRUM_SEARCHER::configurate_next_step(void){

	tx->SetFrequency((double)next_tx_frequency());
	isOK=false;
	//leds->set_leds(3,true);
	rx_locked=false;
	leds->set_leds(1,false);
	while(!rx_is_locked()){
		usleep(10);
		leds->toogle_leds(1);
		printf("rx not Locked at: %" PRId64 "\n",rx_frequency);
	}
	leds->set_leds(1,false);
//	leds->set_leds(3,false);
	while(!tx_pll_locked()){
		usleep(10);
		leds->toogle_leds(1);
		// printf(" tx_pll not locked at:   %lf\n",next_frequency );
	}
	//printf("tx Locked at: %lf\n",tx->current_frequency);
	leds->set_leds(1,false);


	isOK=true;
}
void SPECTRUM_SEARCHER::configurate_reentry_step(void){
	next_frequency=current_frequency;
	tx->SetFrequency((double)next_frequency);
	isOK=false;
	//leds->set_leds(3,true);
	rx_locked=false;
	leds->set_leds(1,false);
	while(!rx_is_locked()){
		usleep(10);
		leds->toogle_leds(1);
		printf("rx not Locked at: %" PRId64 "\n",rx_frequency);
	}
	leds->set_leds(1,false);
	//leds->set_leds(3,false);
	while(!tx_pll_locked()){
		usleep(10);
		leds->toogle_leds(1);
		// printf(" tx not locked at:   %lf\n",next_frequency );
	}
	//printf("tx Locked at: %lf\n",tx->current_frequency);
	leds->set_leds(1,false);


	isOK=true;
}
