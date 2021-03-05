/*
 * SPIHandler.cpp
 *
 *  Created on: Dec 6, 2020
 *      Author: GMateusDP
 */

#include "SPIHandler.h"
#include "system.h"
#include "alt_types.h"
#include "altera_avalon_spi.h"
#include "altera_avalon_spi_regs.h"


SPI_Handler::SPI_Handler() {
	// TODO Auto-generated constructor stub
	base_address=0;
	int_result=0;
	slave=0;
}

SPI_Handler::~SPI_Handler() {
	// TODO Auto-generated destructor stub
}

bool SPI_Handler::Init(uint32_t add, uint32_t slv){
	slave=slv;
	base_address=add;
	return true;
}

void SPI_Handler::Open(void){
	 IOWR_ALTERA_AVALON_SPI_CONTROL(base_address, ALTERA_AVALON_SPI_CONTROL_SSO_MSK);
	//IOWR_ALTERA_AVALON_SPI_SLAVE_SEL(base_address, 0x00);
}

void SPI_Handler::Close(void){
	IOWR_ALTERA_AVALON_SPI_CONTROL(base_address, 0);
	//IOWR_ALTERA_AVALON_SPI_SLAVE_SEL(base_address, 0xff);
}
void SPI_Handler::SetCS(bool sen){
	if(sen){
		IOWR_ALTERA_AVALON_SPI_CONTROL(base_address, 0);
	}else{
		IOWR_ALTERA_AVALON_SPI_CONTROL(base_address, ALTERA_AVALON_SPI_CONTROL_SSO_MSK);
	}

	//IOWR_ALTERA_AVALON_SPI_SLAVE_SEL(base_address, 0xff);
}
int SPI_Handler::WriteData(uint8_t *write_data,uint32_t write_length){
//	int_result=alt_avalon_spi_command(base_address,slave,size,buffer,0,0,ALT_AVALON_SPI_COMMAND_MERGE);
//	int_result=alt_avalon_spi_command(base_address,slave,size,buffer,0,0,ALT_AVALON_SPI_COMMAND_MERGE);
//	int_result=alt_avalon_spi_command(base_address,slave,size,buffer,0,0,ALT_AVALON_SPI_COMMAND_TOGGLE_SS_N);
//	ALT_AVALON_SPI_COMMAND_TOGGLE_SS_N


	//return int_result;
	 const alt_u8 * write_end = write_data + write_length;
	  alt_u8 * read_end = rx_buffer;


	  alt_u32 read_ignore = write_length;
	  alt_u32 status;

	  /* We must not send more than two bytes to the target before it has
	   * returned any as otherwise it will overflow. */
	  /* Unfortunately the hardware does not seem to work with credits > 1,
	   * leave it at 1 for now. */
	  alt_32 credits = 1;

	  /* Warning: this function is not currently safe if called in a multi-threaded
	   * environment, something above must perform locking to make it safe if more
	   * than one thread intends to use it.
	   */

	  IOWR_ALTERA_AVALON_SPI_SLAVE_SEL(base_address, 1 << slave);

	  /* Set the SSO bit (force chipselect) only if the toggle flag is not set */


	  /*
	   * Discard any stale data present in the RXDATA register, in case
	   * previous communication was interrupted and stale data was left
	   * behind.
	   */
	  IORD_ALTERA_AVALON_SPI_RXDATA(base_address);

	  /* Keep clocking until all the data has been processed. */
	  for ( ; ; )
	  {

	    do
	    {
	      status = IORD_ALTERA_AVALON_SPI_STATUS(base_address);
	    }
	    while (((status & ALTERA_AVALON_SPI_STATUS_TRDY_MSK) == 0 || credits == 0) &&
	            (status & ALTERA_AVALON_SPI_STATUS_RRDY_MSK) == 0);

	    if ((status & ALTERA_AVALON_SPI_STATUS_TRDY_MSK) != 0 && credits > 0)
	    {
	      credits--;

	      if (write_data < write_end){
	    	  IOWR_ALTERA_AVALON_SPI_TXDATA(base_address, *write_data++);
	      }else{
	    	  credits = -1024;
	      }

	    };

	    if ((status & ALTERA_AVALON_SPI_STATUS_RRDY_MSK) != 0)
	    {
	     // alt_u32 rxdata = IORD_ALTERA_AVALON_SPI_RXDATA(base_address);

	      if (read_ignore > 0){
	    	  read_ignore--;
	      }else{

	    	  // *rx_buffer++ = (alt_u8)rxdata;
	      }

	      credits++;

	      if (read_ignore == 0 && rx_buffer == read_end)
	        break;
	    }

	  }

	  /* Wait until the interface has finished transmitting */
	  do
	  {
	    status = IORD_ALTERA_AVALON_SPI_STATUS(base_address);
	  }
	  while ((status & ALTERA_AVALON_SPI_STATUS_TMT_MSK) == 0);

	  /* Clear SSO (release chipselect) unless the caller is going to
	   * keep using this chip
	   */


	  return write_length;

}
int SPI_Handler::TransferData(uint8_t *buffer,uint32_t size){

	int_result=alt_avalon_spi_command(base_address,slave,size,buffer,size,rx_buffer,ALT_AVALON_SPI_COMMAND_MERGE);
	//int_result=alt_avalon_spi_command(base_address,slave,size,buffer,size,rx_buffer,0);
	return int_result;
}
int SPI_Handler::TransferData(uint8_t *buffer_tx,uint8_t *buffer_rx,uint32_t size){

	int_result=alt_avalon_spi_command(base_address,slave,size,buffer_tx,size,buffer_rx,ALT_AVALON_SPI_COMMAND_MERGE);
	//int_result=alt_avalon_spi_command(base_address,slave,size,buffer,size,rx_buffer,0);
	return int_result;
}
int SPI_Handler::TransferData(uint8_t *buffer_tx,uint32_t write_size,uint8_t *buffer_rx,uint32_t read_size){

	int_result=alt_avalon_spi_command(base_address,slave,write_size,buffer_tx,read_size,buffer_rx,ALT_AVALON_SPI_COMMAND_MERGE);
	//int_result=alt_avalon_spi_command(base_address,slave,size,buffer,size,rx_buffer,0);
	return int_result;
}
int SPI_Handler::ReadData(uint8_t *buffer_tx,uint8_t *buffer_rx,uint32_t size){

	int_result=alt_avalon_spi_command(base_address,slave,1,buffer_tx,size,buffer_rx,ALT_AVALON_SPI_COMMAND_MERGE);
	//int_result=alt_avalon_spi_command(base_address,slave,0,buffer_rx,size,rx_buffer,ALT_AVALON_SPI_COMMAND_TOGGLE_SS_N);
	return int_result;
}
int SPI_Handler::ReadData(uint8_t *read_data,uint32_t read_length){
//	int_result=alt_avalon_spi_command(base_address,slave,0,0,size,buffer,ALT_AVALON_SPI_COMMAND_MERGE);
//	int_result=alt_avalon_spi_command(base_address,slave,0,0,size,buffer,ALT_AVALON_SPI_COMMAND_TOGGLE_SS_N);
	//return int_result;

	  alt_u8 * read_end = read_data + read_length;

	  alt_u32 write_zeros = read_length;
	  alt_u32 read_ignore = 0;
	  alt_u32 status;

	  /* We must not send more than two bytes to the target before it has
	   * returned any as otherwise it will overflow. */
	  /* Unfortunately the hardware does not seem to work with credits > 1,
	   * leave it at 1 for now. */
	  alt_32 credits = 1;

	  /* Warning: this function is not currently safe if called in a multi-threaded
	   * environment, something above must perform locking to make it safe if more
	   * than one thread intends to use it.
	   */

	  IOWR_ALTERA_AVALON_SPI_SLAVE_SEL(base_address, 1 << slave);



	  /*
	   * Discard any stale data present in the RXDATA register, in case
	   * previous communication was interrupted and stale data was left
	   * behind.
	   */
	  IORD_ALTERA_AVALON_SPI_RXDATA(base_address);

	  /* Keep clocking until all the data has been processed. */
	  for ( ; ; )
	  {

	    do
	    {
	      status = IORD_ALTERA_AVALON_SPI_STATUS(base_address);
	    }
	    while (((status & ALTERA_AVALON_SPI_STATUS_TRDY_MSK) == 0 || credits == 0) &&
	            (status & ALTERA_AVALON_SPI_STATUS_RRDY_MSK) == 0);

	    if ((status & ALTERA_AVALON_SPI_STATUS_TRDY_MSK) != 0 && credits > 0)
	    {
	      credits--;

	      if (write_zeros > 0)
	      {
	        write_zeros--;
	        IOWR_ALTERA_AVALON_SPI_TXDATA(base_address, 0);
	      }else{
	    	  credits = -1024;
	      }

	    };

	    if ((status & ALTERA_AVALON_SPI_STATUS_RRDY_MSK) != 0)
	    {
	      alt_u32 rxdata = IORD_ALTERA_AVALON_SPI_RXDATA(base_address);

	      if (read_ignore > 0)
	        read_ignore--;
	      else
	        *read_data++ = (alt_u8)rxdata;
	      credits++;

	      if (read_ignore == 0 && read_data == read_end)
	        break;
	    }

	  }

	  /* Wait until the interface has finished transmitting */
	  do
	  {
	    status = IORD_ALTERA_AVALON_SPI_STATUS(base_address);
	  }
	  while ((status & ALTERA_AVALON_SPI_STATUS_TMT_MSK) == 0);

	  /* Clear SSO (release chipselect) unless the caller is going to
	   * keep using this chip
	   */

	  return read_length;
}


