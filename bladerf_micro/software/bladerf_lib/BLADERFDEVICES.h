/*
 * BLADERFDEVICES.h
 *
 *  Created on: Mar 3, 2021
 *      Author: giova
 */

#ifndef BLADERFDEVICES_H_
#define BLADERFDEVICES_H_
#include "system.h"
#include "VCTCXOTAMERCLASS.h"

#   define I2C                        OPENCORES_I2C_BASE
/* Time tamer register offsets from the base */
#   define OC_I2C_PRESCALER    0
#   define OC_I2C_CTRL         2
#   define OC_I2C_DATA         3
#   define OC_I2C_CMD_STATUS   4
/* I2C interface */
#   define SI5338_I2C          (0xE0)
#   define INA219_I2C          (0x88)
#   define OC_I2C_ENABLE       (1<<7)
#   define OC_I2C_STA          (1<<7)
#   define OC_I2C_STO          (1<<6)
#   define OC_I2C_WR           (1<<4)
#   define OC_I2C_RD           (1<<5)
#   define OC_I2C_TIP          (1<<1)
#   define OC_I2C_RXACK        (1<<7)
#   define OC_I2C_NACK         (1<<3)

class BLADERF_DEVICES {
public:
	bool isOK;
	VCTCXO_TAMER_CLASS	*vctcxo;
private:

	 uint8_t  byte_result;
public:
	BLADERF_DEVICES();
	virtual ~BLADERF_DEVICES();
	bool Init();
	void Get_VCTCXO(VCTCXO_TAMER_CLASS *ptr){ ptr=vctcxo;}
	uint16_t ina219_read(uint8_t addr);
	void ina219_write(uint8_t addr, uint16_t data);
	void i2c_complete_transfer(uint8_t check_rxack);

private:
	uint8_t Set_Clock_Prescaler();
};

#endif /* BLADERFDEVICES_H_ */