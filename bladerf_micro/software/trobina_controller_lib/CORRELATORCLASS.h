/*
 * CORRELATORCLASS.h
 *
 *  Created on: Jan 10, 2021
 *      Author: GMateusDP
 */

#ifndef CORRELATORCLASS_H_
#define CORRELATORCLASS_H_
#include "system.h"
#include "alt_types.h"
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

#include "SPECTRUMSEARCHER.h"
#include "COEFFICIENTSHANDLER.h"
#include "SENSORREADERCLASS.h"

#define RECEIVER_BANDWIDTH MAX_RX_BANDWIDTH/(1000.0*1000.0)
#define FFT_COEFFICIENTS	32



class CORRELATOR_CLASS:  private COEFFICIENTS_HANDLER
{
public:
	bool isOK;
private:
	float noise_band,spectrum_line,resonance_line;
	uint8_t *noise_index;
	uint8_t *accumulator;
	bool	available_seat,is_noise,do_search;
	uint8_t last_index;
	SPECTRUM_SEARCHER	*woobler;

public:
	CORRELATOR_CLASS();
	virtual ~CORRELATOR_CLASS();
	bool Init(void);
	void	sort_spectrum_line(float sl);
	bool fill_initial_profile(void);
private:
	bool in_rx_bandwidth(float sl,float ref);
	void	handle_noise(uint8_t var);
	void overtake_array(uint8_t var,float value);
	bool in_fft_bandwidth(float sl,float ref);
	float error_deviation(float value,float ref);
	void  update_profile(void);

};

#endif /* CORRELATORCLASS_H_ */
