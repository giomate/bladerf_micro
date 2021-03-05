/*
 * main.cpp
 *
 *  Created on: Mar 4, 2021
 *      Author: giova
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>

#include "string.h"
#include <inttypes.h>
#include "system.h"


#include "BLADERFDEVICES.h"
#include "ADF5610Driver.h"

static BLADERF_DEVICES blade;
static ADF5610_Driver adf;

int main(void){

	uint32_t counter=0;






	blade.Init();

	 printf("!!!	Initiating		!!!\n");
	// spectrum.Init();
	// woobler.Init(1500.0);
	// leds1.Init(true);
	 adf.Init();
	// printf("!!!	Initiated		!!!\n");

	// blade.Get_VCTCXO(vctcxo);
	while (1)
	{
		//blade.vctcxo->Calibration();
	//	spectrum.fill_initial_profile();
	//	woobler.start_searching(&token);
		adf.SelfTest(1);
		usleep(1000);
		if (counter==0){
			//leds1.toogle_leds(1);
			printf("!!!	running		!!!\n");
		}
		counter++;
		if (counter%1000==0){
			blade.vctcxo->Calibration(true);
		}else{
			blade.vctcxo->Calibration(false);
		}



	}
}