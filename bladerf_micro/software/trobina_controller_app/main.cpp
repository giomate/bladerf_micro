/*
 * main.cpp
 *
 *  Created on: Mar 6, 2021
 *      Author: GMateusDP
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
#include "SPECTRUMSEARCHER.h"

static BLADERF_DEVICES	bladerf;
static SPECTRUM_SEARCHER	woobler;
static bool token=true;

int main(void){
	uint32_t counter=0;
	bladerf.Init();
	woobler.Init(3600.0);
	while(1){
		woobler.start_searching(&token);
			//adf.SelfTest(1);
			usleep(1000);
			if (counter==0){
				//leds1.toogle_leds(1);
				printf("!!!	running		!!!\n");
			}
			counter++;
	}
}
