/*
 * SPIHandler.h
 *
 *  Created on: Dec 6, 2020
 *      Author: GMateusDP
 */




#ifndef SPIHANDLER_H_
#define SPIHANDLER_H_
#include "system.h"
#include "alt_types.h"
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include "altera_avalon_spi.h"
#include "altera_avalon_spi_regs.h"

class SPI_Handler {

private:
	uint32_t base_address;
	uint32_t slave;
	int int_result;
	uint8_t rx_buffer[32];
	uint8_t tx_buffer[32];
public:
	SPI_Handler();
	virtual ~SPI_Handler();
	bool Init(uint32_t add, uint32_t slv);
	int WriteData(uint8_t *data,uint32_t size);
	int Write(uint8_t *data,uint32_t size){return WriteData(data,size);};
	int TransferData(uint8_t *data,uint32_t size);
	int TransferData(uint8_t *buffer_tx,uint8_t *buffer_rx,uint32_t size);
	int TransferData(uint8_t *buffer_tx,uint32_t write_size,uint8_t *buffer_rx,uint32_t read_size);
	int ReadData(uint8_t *buffer_tx,uint8_t *buffer_rx,uint32_t size);
	int ReadData(uint8_t *data,uint32_t size);
	int Read(uint8_t *data,uint32_t size){return ReadData(data,size);};
	void Open(void);
	void Close(void);
	void SetCS(bool sen);




};

#endif /* SPIHANDLER_H_ */
