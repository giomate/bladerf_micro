/*
 * vctcxo_init.h
 *
 *  Created on: Dec 20, 2020
 *      Author: root
 */

#ifndef VCTCXO_INIT_H_
#define VCTCXO_INIT_H_


#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <unistd.h>
#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */

/* VCTCXO tamer register offsets */
#   define VT_CTRL_ADDR      (0x00)
#   define VT_STAT_ADDR      (0x01)
#   define VT_ERR_1S_ADDR    (0x04)
#   define VT_ERR_10S_ADDR   (0x0C)
#   define VT_ERR_100S_ADDR  (0x14)

/* VCTCXO tamer control/status bits */
#   define VT_CTRL_RESET     (0x01)
#   define VT_CTRL_IRQ_EN    (1<<4)
#   define VT_CTRL_IRQ_CLR   (1<<5)
#   define VT_CTRL_TUNE_MODE (0xC0)

#   define VT_STAT_ERR_1S    (0x01)
#   define VT_STAT_ERR_10S   (1<<1)
#   define VT_STAT_ERR_100S  (1<<2)


typedef struct point {
    int32_t  x; // Error counts
    uint16_t y; // DAC count
} point_t;

typedef struct line {
    point_t  point[2];
    int32_t  slope;
    uint16_t y_intercept; // in DAC counts
} line_t;

/* State machine for VCTCXO tuning */
typedef enum state {
    COARSE_TUNE_MIN,
    COARSE_TUNE_MAX,
    COARSE_TUNE_DONE,
    FINE_TUNE,
    DO_NOTHING
} state_t;
struct vctcxo_tamer_pkt_buf {
    volatile bool    ready;
    volatile int32_t pps_1s_error;
    volatile bool    pps_1s_error_flag;
    volatile int32_t pps_10s_error;
    volatile bool    pps_10s_error_flag;
    volatile int32_t pps_100s_error;
    volatile bool    pps_100s_error_flag;
};
/* Define a global variable containing the current VCTCXO DAC setting.
 * This is a 'cached' value of what is written to the DAC and is used
 * for the calibration algorithm to avoid unnecessary read requests
 * going out to the DAC.
 */
extern uint16_t vctcxo_trim_dac_value;

/* Define a cached version of the VCTCXO tamer control register */
extern uint8_t vctcxo_tamer_ctrl_reg;

// Trim DAC constants
void check_adi_spi(void);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* VCTCXO_INIT_H_ */
