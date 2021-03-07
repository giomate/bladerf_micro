/*
 * LTC5548HANDLER.cpp
 *
 *  Created on: Feb 21, 2021
 *      Author: giova
 */

#include "LTC5548HANDLER.h"
#include <stdio.h>
#include <unistd.h>
#include "system.h"
#include "sys/alt_irq.h"
#include "altera_avalon_pio_regs.h"


LTC5548_HANDLER::LTC5548_HANDLER() {
	// TODO Auto-generated constructor stub

}

LTC5548_HANDLER::~LTC5548_HANDLER() {
	// TODO Auto-generated destructor stub
}
bool LTC5548_HANDLER::Init(void *pll){
	adf=(ADF5610_Driver*)(pll);
	Set_Enable(false);

	return !enable;
}
bool LTC5548_HANDLER::Init(void){
	Set_Enable(false);
	//lmx=&local_lmx;
	//lmx->Init();
	//lmx->Set_Target_Frequency(3600.0);
	return !enable;
}
bool LTC5548_HANDLER::Set_Mixer(bool st){
	if(st){
		Start_Mixer();
	}else{
		Stop_Mixer();
	}
	return enable;
}
bool LTC5548_HANDLER::Start_Mixer(void){
	if(adf->IsLocked()){
		Set_Enable(true);
	}else{
		Set_Enable(false);
	}
	return enable;
}
bool LTC5548_HANDLER::Stop_Mixer(void){
		Set_Enable(false);
		return enable;
}
bool LTC5548_HANDLER::Set_Enable(bool st){
	pio_register=IORD_ALTERA_AVALON_PIO_DATA(PIO_MINI_BASE);
	if(st){
		pio_register|=0xff;
	}else{
		pio_register&=0x00;
	}
	IOWR_ALTERA_AVALON_PIO_DATA(PIO_MINI_BASE,pio_register);
	enable=st;
	return enable;
}
uint16_t LTC5548_HANDLER::Read_ADC_Value(void){

//	adc_value=IORD_16DIRECT(PIO_1_BASE,0);
	return adc_value;
}
uint8_t LTC5548_HANDLER::Read_Index(void){
//		max_index=IORD_ALTERA_AVALON_PIO_DATA(PIO_2_BASE);
	return max_index;
}
bool LTC5548_HANDLER::Check_Mixer(void){
	if(enable){
		if(adf->IsLocked()){

		}else{
			adf->Init();
			adf->SetFrequency(3600.0);
		}
	}else{
		Set_Enable(false);
	}
	return enable;
}
