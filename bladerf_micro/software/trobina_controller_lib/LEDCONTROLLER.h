/*
 * LEDCONTROLLER.h
 *
 *  Created on: Jan 9, 2021
 *      Author: GMateusDP
 */

#ifndef LEDCONTROLLER_H_
#define LEDCONTROLLER_H_
#include "system.h"
#include "alt_types.h"
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include "altera_avalon_pio_regs.h"
#define LED_MODE_OFFSET 15
#define LEDS_OFFSET		12
class LED_CONTROLLER {
public:

private:
	uint32_t control_register;
	uint8_t led_position;
	bool led_state;
public:
	LED_CONTROLLER();
	virtual ~LED_CONTROLLER();
	bool set_leds(uint8_t number,bool st);
	bool Init(bool st);
	bool toogle_leds(uint8_t number);
};

#endif /* LEDCONTROLLER_H_ */
