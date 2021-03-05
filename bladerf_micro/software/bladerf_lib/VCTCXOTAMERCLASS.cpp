/*
 * VCTCXOTAMERCLASS.cpp
 *
 *  Created on: Jan 5, 2021
 *      Author: GMateusDP
 */

#include "VCTCXOTAMERCLASS.h"
#include "system.h"
#include "altera_avalon_spi.h"
#include "altera_avalon_spi_regs.h"
#include "sys/alt_irq.h"
#include "stdio.h"

 const uint16_t trimdac_min       = 0x28F5;
 const uint16_t trimdac_max       = 0xF5C3;
 VCTCXO_TAMER_CLASS	*ptr_v_tamer;
 static  vctcxo_tamer_pkt_buf vctcxo_tamer_pkt_local;
 static void vctcxo_tamer_isr(void *context)
 {
     struct vctcxo_tamer_pkt_buf *pkt = (struct vctcxo_tamer_pkt_buf *)context;
     // printf("!!!	v_tamer interrupt	!!!\n");
     uint8_t error_status             = 0x00;

     /* Disable interrupts */
     ptr_v_tamer->vctcxo_tamer_enable_isr(false);

     /* Reset (stop) the counters */
     ptr_v_tamer->vctcxo_tamer_reset_counters(true);

     /* Read the current count values */
     pkt->pps_1s_error   = ptr_v_tamer->vctcxo_tamer_read_count(VT_ERR_1S_ADDR);
     pkt->pps_10s_error  = ptr_v_tamer->vctcxo_tamer_read_count(VT_ERR_10S_ADDR);
     pkt->pps_100s_error = ptr_v_tamer->vctcxo_tamer_read_count(VT_ERR_100S_ADDR);

     /* Read the error status register */
     error_status = ptr_v_tamer->vctcxo_tamer_read(VT_STAT_ADDR);

     /* Set the appropriate flags in the packet buffer */
     pkt->pps_1s_error_flag   = (error_status & VT_STAT_ERR_1S) ? true : false;
     pkt->pps_10s_error_flag  = (error_status & VT_STAT_ERR_10S) ? true : false;
     pkt->pps_100s_error_flag = (error_status & VT_STAT_ERR_100S) ? true : false;

     /* Clear interrupt */
     ptr_v_tamer->vctcxo_tamer_clear_isr();

     /* Tell the main loop that there is a request pending */
     pkt->ready = true;


     return;
 }

VCTCXO_TAMER_CLASS::VCTCXO_TAMER_CLASS() {
	// TODO Auto-generated constructor stub
	ptr_v_tamer=this;
	pkt_buf=&vctcxo_tamer_pkt_local;
	 base  = NULL;
		/* Define a global variable containing the current VCTCXO DAC setting.
		 * This is a 'cached' value of what is written to the DAC and is used
		 * by the VCTCXO calibration algorithm to avoid constant read requests
		 * going out to the DAC. Initial power-up state of the DAC is mid-scale.
		 */
		vctcxo_trim_dac_value = 0x7FFF;

		/* Define a cached version of the VCTCXO tamer control register */
		vctcxo_tamer_ctrl_reg = 0x00;
}

VCTCXO_TAMER_CLASS::~VCTCXO_TAMER_CLASS() {
	// TODO Auto-generated destructor stub
}
void VCTCXO_TAMER_CLASS::Init(void){
	ptr_v_tamer=this;
	pkt_buf=&vctcxo_tamer_pkt_local;
	init_trimdac_cal();
  //  alt_ic_isr_register(VCTCXO_TAMER_IRQ_INTERRUPT_CONTROLLER_ID,
   //                     VCTCXO_TAMER_IRQ, vctcxo_tamer_isr, pkt_buf,
     //                   NULL);

    /* Default VCTCXO Tamer and its interrupts to be disabled. */
    vctcxo_tamer_set_tune_mode(BLADERF_VCTCXO_TAMER_DISABLED);
  //  alt_ic_irq_enable(VCTCXO_TAMER_IRQ_INTERRUPT_CONTROLLER_ID,
    //                     VCTCXO_TAMER_IRQ);
    pkt_buf->ready=true;
    for(int i =0;i<(int)FINE_TUNE;i++){
    	Calibration(true);
    }
}


void VCTCXO_TAMER_CLASS::vctcxo_tamer_enable_isr(bool enable)
{
    if (enable) {
        vctcxo_tamer_ctrl_reg |= VT_CTRL_IRQ_EN;
    } else {
        vctcxo_tamer_ctrl_reg &= ~VT_CTRL_IRQ_EN;
    }

    vctcxo_tamer_write(VT_CTRL_ADDR, vctcxo_tamer_ctrl_reg);
    return;
}

void VCTCXO_TAMER_CLASS::vctcxo_tamer_clear_isr()
{
    vctcxo_tamer_write(VT_CTRL_ADDR, vctcxo_tamer_ctrl_reg | VT_CTRL_IRQ_CLR);
    return;
}

void VCTCXO_TAMER_CLASS::vctcxo_tamer_reset_counters(bool reset)
{
    if (reset) {
        vctcxo_tamer_ctrl_reg |= VT_CTRL_RESET;
    } else {
        vctcxo_tamer_ctrl_reg &= ~VT_CTRL_RESET;
    }

    vctcxo_tamer_write(VT_CTRL_ADDR, vctcxo_tamer_ctrl_reg);
    return;
}

void VCTCXO_TAMER_CLASS::vctcxo_tamer_set_tune_mode(bladerf_vctcxo_tamer_mode mode)
{
    switch (mode) {
        case BLADERF_VCTCXO_TAMER_DISABLED:
        case BLADERF_VCTCXO_TAMER_1_PPS:
        case BLADERF_VCTCXO_TAMER_10_MHZ:
            vctcxo_tamer_enable_isr(false);
            break;

        default:
            /* Erroneous value */
            return;
    }

    /* Set tuning mode */
    vctcxo_tamer_ctrl_reg &= ~VT_CTRL_TUNE_MODE;
    vctcxo_tamer_ctrl_reg |= (((uint8_t)mode) << 6);
    vctcxo_tamer_write(VT_CTRL_ADDR, vctcxo_tamer_ctrl_reg);

    /* Reset the counters */
    vctcxo_tamer_reset_counters(true);

    /* Take counters out of reset if tuning mode is not DISABLED */
    if (mode != 0x00) {
        vctcxo_tamer_reset_counters(false);
    }

    switch (mode) {
        case BLADERF_VCTCXO_TAMER_1_PPS:
        case BLADERF_VCTCXO_TAMER_10_MHZ:
            vctcxo_tamer_enable_isr(true);
            break;

        default:
            /* Leave ISR disabled otherwise */
            break;
    }

    return;
}

bladerf_vctcxo_tamer_mode VCTCXO_TAMER_CLASS::vctcxo_tamer_get_tune_mode()
{
    uint8_t tmp = vctcxo_tamer_read(VT_CTRL_ADDR);
    tmp         = (tmp & VT_CTRL_TUNE_MODE) >> 6;

    switch (tmp) {
        case BLADERF_VCTCXO_TAMER_DISABLED:
        case BLADERF_VCTCXO_TAMER_1_PPS:
        case BLADERF_VCTCXO_TAMER_10_MHZ:
            return (bladerf_vctcxo_tamer_mode)tmp;

        default:
            return BLADERF_VCTCXO_TAMER_INVALID;
    }
}

int32_t VCTCXO_TAMER_CLASS::vctcxo_tamer_read_count(uint8_t addr)
{

    offset = addr;
    value  = 0;

    value = IORD_8DIRECT(base, offset++);
    value |= ((int32_t)IORD_8DIRECT(base, offset++)) << 8;
    value |= ((int32_t)IORD_8DIRECT(base, offset++)) << 16;
    value |= ((int32_t)IORD_8DIRECT(base, offset++)) << 24;

    return value;
}

uint8_t VCTCXO_TAMER_CLASS::vctcxo_tamer_read(uint8_t addr)
{
   // return (uint8_t)IORD_8DIRECT(base, addr);
	return 0;
}

void VCTCXO_TAMER_CLASS::vctcxo_tamer_write(uint8_t addr, uint8_t data)
{
   // IOWR_8DIRECT(base, addr, data);
}



void VCTCXO_TAMER_CLASS::init_trimdac_cal(void){



trimdac_cal_line.point[0].x  = 0;
trimdac_cal_line.point[0].y  = trimdac_min;
trimdac_cal_line.point[1].x  = 0;
trimdac_cal_line.point[1].y  = trimdac_max;
trimdac_cal_line.slope       = 0;
trimdac_cal_line.y_intercept = 0;
}

void VCTCXO_TAMER_CLASS::Calibration(bool force){


	if( pkt_buf->ready|force) {

	                pkt_buf->ready = false;

	                switch(tune_state) {

	                case COARSE_TUNE_MIN:

	                    /* Tune to the minimum DAC value */
	                    vctcxo_trim_dac_write( 0x08, trimdac_min );

	                    /* State to enter upon the next interrupt */
	                    tune_state = COARSE_TUNE_MAX;

	                    break;

	                case COARSE_TUNE_MAX:

	                    /* We have the error from the minimum DAC setting, store it
	                     * as the 'x' coordinate for the first point */
	                    trimdac_cal_line.point[0].x = pkt_buf->pps_1s_error;

	                    /* Tune to the maximum DAC value */
	                    vctcxo_trim_dac_write( 0x08, trimdac_max );

	                    /* State to enter upon the next interrupt */
	                    tune_state = COARSE_TUNE_DONE;

	                    break;

	                case COARSE_TUNE_DONE:

	                    /* We have the error from the maximum DAC setting, store it
	                     * as the 'x' coordinate for the second point */
	                    trimdac_cal_line.point[1].x = pkt_buf->pps_1s_error;

	                    /* We now have two points, so we can calculate the equation
	                     * for a line plotted with DAC counts on the Y axis and
	                     * error on the X axis. We want a PPM of zero, which ideally
	                     * corresponds to the y-intercept of the line. */
	                    trimdac_cal_line.slope = ( (trimdac_cal_line.point[1].y - trimdac_cal_line.point[0].y) /
	                                               (trimdac_cal_line.point[1].x - trimdac_cal_line.point[0].x) );
	                    trimdac_cal_line.y_intercept = ( trimdac_cal_line.point[0].y -
	                                                     (trimdac_cal_line.slope * trimdac_cal_line.point[0].x) );

	                    /* Set the trim DAC count to the y-intercept */
	                    vctcxo_trim_dac_write( 0x08, trimdac_cal_line.y_intercept );

	                    /* State to enter upon the next interrupt */
	                    tune_state = FINE_TUNE;

	                    break;

	                case FINE_TUNE:

	                    /* We should be extremely close to a perfectly tuned
	                     * VCTCXO, but some minor adjustments need to be made */

	                    /* Check the magnitude of the errors starting with the
	                     * one second count. If an error is greater than the maxium
	                     * tolerated error, adjust the trim DAC by the error (Hz)
	                     * multiplied by the slope (in counts/Hz) and scale the
	                     * result by the precision interval (e.g. 1s, 10s, 100s). */
	                    if( pkt_buf->pps_1s_error_flag ) {
	                        vctcxo_trim_dac_write( 0x08, (vctcxo_trim_dac_value -
	                            ((pkt_buf->pps_1s_error * trimdac_cal_line.slope)/1)) );
	                    } else if( pkt_buf->pps_10s_error_flag ) {
	                        vctcxo_trim_dac_write( 0x08, (vctcxo_trim_dac_value -
	                            ((pkt_buf->pps_10s_error * trimdac_cal_line.slope)/10)) );
	                    } else if( pkt_buf->pps_100s_error_flag ) {
	                        vctcxo_trim_dac_write( 0x08, (vctcxo_trim_dac_value -
	                            ((pkt_buf->pps_100s_error * trimdac_cal_line.slope)/100)) );
	                    }

	                    break;

	                default:
	                    break;

	                } /* switch */

	                /* Take PPS counters out of reset */
	                vctcxo_tamer_reset_counters( false );

	                /* Enable interrupts */
	                vctcxo_tamer_enable_isr( true );

	            } /* VCTCXO Tamer interrupt */
}
void VCTCXO_TAMER_CLASS::vctcxo_trim_dac_write(uint8_t cmd, uint16_t val)
{
    uint8_t data[3] = {
        cmd,
        (val >> 8) & 0xff,
        val & 0xff,
    };

    /* Update cached value of trim DAC setting */
    vctcxo_trim_dac_value = val;

    alt_avalon_spi_command(PERIPHERAL_SPI_BASE, 0, 3, data, 0, 0, 0);
}
void VCTCXO_TAMER_CLASS::vctcxo_trim_dac_read(uint8_t cmd, uint16_t *val)
{
    alt_u8 data[2];

    alt_avalon_spi_command(PERIPHERAL_SPI_BASE, 0, 1, &cmd, 0, 0,
                           ALT_AVALON_SPI_COMMAND_MERGE);
    alt_avalon_spi_command(PERIPHERAL_SPI_BASE, 0, 0, 0, 2, &data[0], 0);

    *val = ((uint8_t)data[0] << 8) | (uint8_t)data[1];
}

void VCTCXO_TAMER_CLASS::ad56x1_vctcxo_trim_dac_write(uint16_t val)
{
    uint8_t data[2] = {
        (val >> 8) & 0xff,
        val & 0xff,
    };

    /* Update cached value of trim DAC setting */
    vctcxo_trim_dac_value = val;

    alt_avalon_spi_command(PERIPHERAL_SPI_BASE, 0, 2, data, 0, 0, 0);
}



void VCTCXO_TAMER_CLASS::ad56x1_vctcxo_trim_dac_read(uint16_t *val)
{
    /* The AD56x1 DAC does not have readback functionality.
     * Return the cached DAC value */
    *val = vctcxo_trim_dac_value;
}


