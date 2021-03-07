/*
 * LTC5548HANDLER.h
 *
 *  Created on: Feb 21, 2021
 *      Author: giova
 */

#ifndef LTC5548HANDLER_H_
#define LTC5548HANDLER_H_
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include "lmx2694Handler.h"

class LTC5548_HANDLER {
private:
	lmx2694_Handler  *lmx;
	bool  enable;
	uint8_t pio_register,max_index;
	uint16_t adc_value;
public:
	LTC5548_HANDLER();
	virtual ~LTC5548_HANDLER();
	bool Init();
	bool Set_Mixer(bool st);
	uint16_t Read_ADC_Value(void);
	uint8_t Read_Index(void);
	bool Set_Enable(bool st);
	bool Check_Mixer(void);

private:

	bool Stop_Mixer(void);
		bool Start_Mixer(void);

};

#endif /* LTC5548HANDLER_H_ */
