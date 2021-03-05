/*
 * VCTCXOTAMERCLASS.h
 *
 *  Created on: Mar 3, 2021
 *      Author: giova
 */

#ifndef VCTCXOTAMERCLASS_H_
#define VCTCXOTAMERCLASS_H_
#include "vctcxo_init.h"

class VCTCXO_TAMER_CLASS {
private:
	line_t trimdac_cal_line;
	state_t tune_state = COARSE_TUNE_MIN;
	vctcxo_tamer_pkt_buf *pkt_buf;
	/* Define a global variable containing the current VCTCXO DAC setting.
	 * This is a 'cached' value of what is written to the DAC and is used
	 * by the VCTCXO calibration algorithm to avoid constant read requests
	 * going out to the DAC. Initial power-up state of the DAC is mid-scale.
	 */
	uint16_t vctcxo_trim_dac_value ;

	/* Define a cached version of the VCTCXO tamer control register */
	uint8_t vctcxo_tamer_ctrl_reg ;
	   uint32_t base  ;
	    uint8_t offset ;
	    int32_t value  = 0;


public:
	VCTCXO_TAMER_CLASS();
	virtual ~VCTCXO_TAMER_CLASS();
	void Init();
	void init_trimdac_cal(void);
	void Calibration(bool force=false);
	void vctcxo_tamer_enable_isr(bool enable);
	/**
	 * Reset the counters in the VCTCXO Tamer module. Setting is sticky,
	 * so counters must be explicitly taken out of reset.
	 *
	 * @param   reset   true or false
	 */
	void vctcxo_tamer_reset_counters( bool reset );
	/**
	 * Clear interrupts from the VCTCXO Tamer module
	 */
	void vctcxo_tamer_clear_isr();
	/**
	 * Read single VCTCXO tamer register (e.g. control/status)
	 *
	 * @param   addr    Address of register to read
	 * @return  data    Register contents
	 */
	uint8_t vctcxo_tamer_read(uint8_t addr);
	/**
	 * Read VCTCXO tamer count error registers
	 *
	 * @param   addr    Address of byte 0 of error count register
	 * @return  VCTCXO  count error
	 */
	int32_t vctcxo_tamer_read_count(uint8_t addr);

private:



	/**
	 * Sets the VCTCXO Tamer mode
	 *
	 * @param mode      One of the BLADERF_VCTCXO_TAMER_* values.
	 *
	 */
	void vctcxo_tamer_set_tune_mode(bladerf_vctcxo_tamer_mode mode);

	/**
	 * Gets the current VCTCXO Tamer mode
	 *
	 * @return Current mode or BLADERF_VCTCXO_TAMER_MODE_INVALID on failure.
	 */
	bladerf_vctcxo_tamer_mode vctcxo_tamer_get_tune_mode();





	/**
	 * Write single VCTCXO tamer register
	 *
	 * @param   addr    Address of register to write
	 * @param   data    Value to write at the specified address
	 */
	void vctcxo_tamer_write(uint8_t addr, uint8_t data);
	/**
	* Write a command to the VCTCXO trim DAC
	 *
	 * @param   cmd     DAC command
	 * @param   data    command data to write
	 */
	void vctcxo_trim_dac_write(uint8_t cmd, uint16_t val);

	/**
	 * Read from the VCTCXO trim DAC
	 *
	 * @param   cmd     DAC command
	 * @param   data    Read data
	 */
	void vctcxo_trim_dac_read(uint8_t cmd, uint16_t *val);
	/**
	 * Write a command to the AD56x1 VCTCXO trim DAC
	 *
	 * @param   data    command data to write
	 */
	void ad56x1_vctcxo_trim_dac_write(uint16_t val);

	/**
	 * Read from the AD56x1 VCTCXO trim DAC
	 *
	 * @param   data    Read data
	 */
	void ad56x1_vctcxo_trim_dac_read(uint16_t *val);

};



#endif /* VCTCXOTAMERCLASS_H_ */