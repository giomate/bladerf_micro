/*
 * LEDCONTROLLER.cpp
 *
 *  Created on: Jan 9, 2021
 *      Author: GMateusDP
 */

#include "LEDCONTROLLER.h"
#include <unistd.h>
#include "stdio.h"
#include "string.h"
#include <inttypes.h>


LED_CONTROLLER::LED_CONTROLLER() {
	// TODO Auto-generated constructor stub

}

LED_CONTROLLER::~LED_CONTROLLER() {
	// TODO Auto-generated destructor stub
}

bool LED_CONTROLLER::Init(bool st){
	control_register=IORD_ALTERA_AVALON_PIO_DATA(CONTROL_BASE);
	// printf("control_register  0x%08" PRIx32 "\n",control_register);
	if(st){
		control_register|=(0x01<<LED_MODE_OFFSET);
	}else{
		control_register&=~(0x01<<LED_MODE_OFFSET);
	}

	IOWR_ALTERA_AVALON_PIO_DATA(CONTROL_BASE, control_register);
	//printf("control_register  0x%08" PRIx32 "\n",control_register);
	control_register=IORD_ALTERA_AVALON_PIO_DATA(CONTROL_BASE);
//	 printf("control_register  0x%08" PRIx32 "\n",control_register);
	return (control_register>>LED_MODE_OFFSET)&0x01;
}



bool LED_CONTROLLER::set_leds(uint8_t number,bool st){
	led_position=number+LEDS_OFFSET-1;
	control_register=IORD_ALTERA_AVALON_PIO_DATA(CONTROL_BASE);
	if(st){
		control_register|=(0x01<<led_position);
	}else{
		control_register&=~(0x01<<led_position);
	}

	IOWR_ALTERA_AVALON_PIO_DATA(CONTROL_BASE, control_register);
	control_register=IORD_ALTERA_AVALON_PIO_DATA(CONTROL_BASE);
	return (control_register>>led_position)&0x01;
}
bool LED_CONTROLLER::toogle_leds(uint8_t number){
	led_position=number+LEDS_OFFSET-1;
	control_register=IORD_ALTERA_AVALON_PIO_DATA(CONTROL_BASE);
	led_state=(control_register>>led_position)&0x01;
	if(led_state){
		control_register&=~(0x01<<led_position);

	}else{
		control_register|=(0x01<<led_position);
	}

	IOWR_ALTERA_AVALON_PIO_DATA(CONTROL_BASE, control_register);
	control_register=IORD_ALTERA_AVALON_PIO_DATA(CONTROL_BASE);
	return (control_register>>led_position)&0x01;
}


