/*
 * BLADERFDEVICES.cpp
 *
 *  Created on: Mar 3, 2021
 *      Author: giova
 */

#include "BLADERFDEVICES.h"

 #include "altera_avalon_pio_regs.h"
static VCTCXO_TAMER_CLASS	local_vctcxo_tamer;

BLADERF_DEVICES::BLADERF_DEVICES() {
	// TODO Auto-generated constructor stub
	vctcxo=&local_vctcxo_tamer;
}

BLADERF_DEVICES::~BLADERF_DEVICES() {
	// TODO Auto-generated destructor stub
}
bool BLADERF_DEVICES::Init(){
	Set_Clock_Prescaler();
	vctcxo->Init();
	isOK=byte_result>0;
	return isOK;
}

uint8_t BLADERF_DEVICES::Set_Clock_Prescaler(){
    /* Set the prescaler for 400kHz with an 80MHz clock:
     *      (prescaler = clock / (5*desired) - 1)
     */
    IOWR_16DIRECT(I2C, OC_I2C_PRESCALER, 39);
    IOWR_8DIRECT(I2C, OC_I2C_CTRL, OC_I2C_ENABLE);
    byte_result=  IORD_8DIRECT(I2C, OC_I2C_PRESCALER);
    return byte_result;
}
uint16_t BLADERF_DEVICES::ina219_read(uint8_t addr)
{
    uint16_t data;

    /* Set the address to the INA219 */
    IOWR_8DIRECT(I2C, OC_I2C_DATA, INA219_I2C);
    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_STA | OC_I2C_WR);
    i2c_complete_transfer(1);

    IOWR_8DIRECT(I2C, OC_I2C_DATA, addr);
    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_WR | OC_I2C_STO);
    i2c_complete_transfer(1);

    /* Next transfer is a read operation, so '1' in the read/write bit */
    IOWR_8DIRECT(I2C, OC_I2C_DATA, INA219_I2C | 1);
    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_STA | OC_I2C_WR);
    i2c_complete_transfer(1);

    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_RD);
    i2c_complete_transfer(1);
    data = IORD_8DIRECT(I2C, OC_I2C_DATA) << 8;

    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_RD | OC_I2C_NACK | OC_I2C_STO);
    i2c_complete_transfer(0);

    data |= IORD_8DIRECT(I2C, OC_I2C_DATA);
    return data;
}
//#endif  // BOARD_BLADERF_MICRO


void BLADERF_DEVICES::ina219_write(uint8_t addr, uint16_t data)
{
    /* Set the address to the INA219 */
    IOWR_8DIRECT(I2C, OC_I2C_DATA, INA219_I2C);
    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_STA | OC_I2C_WR);
    i2c_complete_transfer(1);

    IOWR_8DIRECT(I2C, OC_I2C_DATA, addr);
    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_CMD_STATUS | OC_I2C_WR);
    i2c_complete_transfer(1);

    IOWR_8DIRECT(I2C, OC_I2C_DATA, data >> 8);
    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_WR);
    i2c_complete_transfer(1);

    IOWR_8DIRECT(I2C, OC_I2C_DATA, data);
    IOWR_8DIRECT(I2C, OC_I2C_CMD_STATUS, OC_I2C_WR | OC_I2C_STO);
    i2c_complete_transfer(0);
}



void BLADERF_DEVICES::i2c_complete_transfer(uint8_t check_rxack)
{
    if ((IORD_8DIRECT(I2C, OC_I2C_CMD_STATUS) & OC_I2C_TIP) == 0) {
        while ((IORD_8DIRECT(I2C, OC_I2C_CMD_STATUS) & OC_I2C_TIP) == 0)
            ;
    }

    while (IORD_8DIRECT(I2C, OC_I2C_CMD_STATUS) & OC_I2C_TIP)
        ;

    while (check_rxack && (IORD_8DIRECT(I2C, OC_I2C_CMD_STATUS) & OC_I2C_RXACK))
        ;
}
