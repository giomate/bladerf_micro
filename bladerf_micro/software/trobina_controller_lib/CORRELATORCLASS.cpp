/*
 * CORRELATORCLASS.cpp
 *
 *  Created on: Jan 10, 2021
 *      Author: GMateusDP
 */

#include "CORRELATORCLASS.h"
#include "math.h"
#include "stdio.h"


static uint8_t local_noise_index[BLACK_LIST_SIZE];
static uint8_t local_index[WHITE_LIST_SIZE];
static	SPECTRUM_SEARCHER	local_woobler;

CORRELATOR_CLASS::CORRELATOR_CLASS() {
	// TODO Auto-generated constructor stub
	last_index=0;
	available_seat=true;
	woobler=&local_woobler;
}

CORRELATOR_CLASS::~CORRELATOR_CLASS() {
	// TODO Auto-generated destructor stub
}

bool CORRELATOR_CLASS::Init(void){
	printf("!!init correlator!! \n");
	woobler=&local_woobler;
	for (uint8_t var = 0; var < BLACK_LIST_SIZE; ++var){
		local_noise_index[var]=0;
	}
	for (uint8_t var = 0; var < WHITE_LIST_SIZE; ++var){
			local_index[var]=0;
		}

	noise_index=local_noise_index;
	accumulator=local_index;
	if( Init_lists()){
		printf("init_list at 1: %f\n",resonances[1]);
		isOK=woobler->Init(resonances[0]);
		do_search=true;
		available_seat=true;
	}
	return isOK;
}

bool CORRELATOR_CLASS::fill_initial_profile(void){
	while(available_seat){
		printf("start Filling up: \n");
		spectrum_line=(float)(woobler->start_searching(&do_search));
		printf("spectrum_line: %f\n",spectrum_line);
		sort_spectrum_line(spectrum_line);
	}
	return spectrum_line>0;
}

void	CORRELATOR_CLASS::sort_spectrum_line(float sl){
	spectrum_line=sl;
	is_noise=false;
	for (uint8_t var = 0; var < BLACK_LIST_SIZE; ++var) {
		if(in_rx_bandwidth(sl,noises[var])){
			handle_noise(var);
			is_noise=true;
			break;

		}else{


		}
	}
	if(!is_noise){
		update_profile();
	}
}

void  CORRELATOR_CLASS::update_profile(void){
	if(last_index)
	for (uint8_t i = last_index+1; i < WHITE_LIST_SIZE; i++){
		if(available_seat){
			resonances[i]=spectrum_line;
			accumulator[i]++;
			available_seat=(i+1)<WHITE_LIST_SIZE;
			last_index=i;;
			break;
		}else{
			if(in_fft_bandwidth(spectrum_line,resonances[i])){
				resonance_line=resonances[i];
				accumulator[i]++;
				if(i>0){
					if(accumulator[i]>accumulator[i-1]){
						overtake_array(i,spectrum_line);
					}else{
						resonances[i]=(spectrum_line+resonance_line)/2;
					}
				}else{
					resonances[i]=(spectrum_line+resonance_line)/2;
				}



			}else{
				if(i==WHITE_LIST_SIZE-1){
					resonances[i]=(spectrum_line+resonances[i])/2;
					accumulator[i]=0;
				}
			}

		}


	}

}

void CORRELATOR_CLASS::overtake_array(uint8_t var,float value){
	resonance_line=resonances[var];
	resonances[var]=resonances[var-1];
	accumulator[var]--;
	accumulator[var-1]++;
	resonances[var-1]=(resonance_line+value)/2;
}
void	CORRELATOR_CLASS::handle_noise(uint8_t var){
	noise_index[var]++;
	if(var==0){
		noises[var]=(spectrum_line+noise_band)/2;
	}else{
		noise_band=noises[var];
		if(noise_index[var]>noise_index[var-1]){
			noises[var]=noises[var-1];
			noise_index[var]--;
			noise_index[var-1]++;
			noises[var-1]=(spectrum_line+noise_band)/2;
		}else{
			noises[var]=(spectrum_line+noise_band)/2;
		}


	}
}
float CORRELATOR_CLASS::error_deviation(float value,float ref){
	return (pow((value-ref),2)/ref);
}
bool CORRELATOR_CLASS::in_rx_bandwidth(float sl,float ref){
	return (abs(sl-ref)<RECEIVER_BANDWIDTH);
}
bool CORRELATOR_CLASS::in_fft_bandwidth(float sl,float ref){
	return (abs(sl-ref)<(RECEIVER_BANDWIDTH*FFT_COEFFICIENTS));
}


