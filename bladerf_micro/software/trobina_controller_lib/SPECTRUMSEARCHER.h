/*
 * SPECTRUMSEARCHER.h
 *
 *  Created on: Jan 9, 2021
 *      Author: GMateusDP
 */

#ifndef SPECTRUMSEARCHER_H_
#define SPECTRUMSEARCHER_H_
#include "LEDCONTROLLER.h"
#include "SENSORREADERCLASS.h"
#include "ADF5610Driver.h"
#include "LTC5548HANDLER.h"
#define OVER_FLOW_FREQUENCY	16000.0
#define UPPER_RX_FREQUENCY	6000.0
#define LOWER_RX_FREQUENCY	103.0
#define MINIMUM_VALID_INDEXES	2
#define MAXIMUM_INDEX_REPETITIONS	4


class SPECTRUM_SEARCHER {
public:
	bool isOK;
private:
	LED_CONTROLLER *leds;
	ADF5610_Driver *tx;
	SENSOR_READER_CLASS		*rx;
	LTC5548_HANDLER         *ltc;
	uint8_t		memory_address;
	 bool direction,got_index,got_sequence,got_inline;
	 bool rx_locked;
	 bool bool_result;
	 float	start_frequency;
	 float  step;
	 uint8_t index[MINIMUM_VALID_INDEXES];
	 uint8_t		max_index;
	 uint8_t		tx_pll_error_counter;
	 uint8_t		tx_pll_reset_counter;
	 uint8_t		tries_counter;
	 uint8_t 		window_counter;
	float current_frequency;
	uint64_t rx_frequency;
	uint8_t		rx_pll_error_counter;
	float next_frequency;
public:
	SPECTRUM_SEARCHER();
	virtual ~SPECTRUM_SEARCHER();
	bool	Init(float sf);
	float start_searching(bool *token);
private:
	bool search_reliable_index(void);
	bool got_max_index(void);
	bool tx_pll_locked(void);
	bool rx_is_locked(void);
	float	next_tx_frequency(void);
	void	configurate_next_step(void);
	float _next_tx_frequency(float cf);
	float	next_tx_frequency(float cf);
	void configurate_reentry_step(void);
};

#endif /* SPECTRUMSEARCHER_H_ */
