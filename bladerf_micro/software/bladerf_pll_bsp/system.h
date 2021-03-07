/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2' in SOPC Builder design 'nios_cpu'
 * SOPC Builder design path: C:/Users/GMateusDP/Documents/Trobina/Development/Software/BladeRF/bladerf_micro/nios_cpu.sopcinfo
 *
 * Generated: Sat Mar 06 12:48:26 CET 2021
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00040820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 80000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x13
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00020020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 80000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x13
#define ALT_CPU_NAME "nios2"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00020000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00040820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 80000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x13
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00020020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x13
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00020000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SPI
#define __ALTERA_NIOS2_GEN2
#define __BLADERF_OC_I2C_MASTER


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart"
#define ALT_STDERR_BASE 0x410b8
#define ALT_STDERR_DEV jtag_uart
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart"
#define ALT_STDIN_BASE 0x410b8
#define ALT_STDIN_DEV jtag_uart
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart"
#define ALT_STDOUT_BASE 0x410b8
#define ALT_STDOUT_DEV jtag_uart
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "nios_cpu"


/*
 * adf5610 configuration
 *
 */

#define ADF5610_BASE 0x41000
#define ADF5610_CLOCKMULT 1
#define ADF5610_CLOCKPHASE 1
#define ADF5610_CLOCKPOLARITY 1
#define ADF5610_CLOCKUNITS "Hz"
#define ADF5610_DATABITS 8
#define ADF5610_DATAWIDTH 16
#define ADF5610_DELAYMULT "1.0E-9"
#define ADF5610_DELAYUNITS "ns"
#define ADF5610_EXTRADELAY 1
#define ADF5610_INSERT_SYNC 0
#define ADF5610_IRQ 3
#define ADF5610_IRQ_INTERRUPT_CONTROLLER_ID 0
#define ADF5610_ISMASTER 1
#define ADF5610_LSBFIRST 0
#define ADF5610_NAME "/dev/adf5610"
#define ADF5610_NUMSLAVES 1
#define ADF5610_PREFIX "spi_"
#define ADF5610_SPAN 32
#define ADF5610_SYNC_REG_DEPTH 2
#define ADF5610_TARGETCLOCK 4000000u
#define ADF5610_TARGETSSDELAY "5.0"
#define ADF5610_TYPE "altera_avalon_spi"
#define ALT_MODULE_CLASS_adf5610 altera_avalon_spi


/*
 * control configuration
 *
 */

#define ALT_MODULE_CLASS_control altera_avalon_pio
#define CONTROL_BASE 0x41080
#define CONTROL_BIT_CLEARING_EDGE_REGISTER 0
#define CONTROL_BIT_MODIFYING_OUTPUT_REGISTER 1
#define CONTROL_CAPTURE 0
#define CONTROL_DATA_WIDTH 32
#define CONTROL_DO_TEST_BENCH_WIRING 0
#define CONTROL_DRIVEN_SIM_VALUE 0
#define CONTROL_EDGE_TYPE "NONE"
#define CONTROL_FREQ 80000000
#define CONTROL_HAS_IN 1
#define CONTROL_HAS_OUT 1
#define CONTROL_HAS_TRI 0
#define CONTROL_IRQ -1
#define CONTROL_IRQ_INTERRUPT_CONTROLLER_ID -1
#define CONTROL_IRQ_TYPE "NONE"
#define CONTROL_NAME "/dev/control"
#define CONTROL_RESET_VALUE 0
#define CONTROL_SPAN 32
#define CONTROL_TYPE "altera_avalon_pio"


/*
 * gpio_rffe configuration
 *
 */

#define ALT_MODULE_CLASS_gpio_rffe altera_avalon_pio
#define GPIO_RFFE_BASE 0x41060
#define GPIO_RFFE_BIT_CLEARING_EDGE_REGISTER 0
#define GPIO_RFFE_BIT_MODIFYING_OUTPUT_REGISTER 1
#define GPIO_RFFE_CAPTURE 0
#define GPIO_RFFE_DATA_WIDTH 32
#define GPIO_RFFE_DO_TEST_BENCH_WIRING 0
#define GPIO_RFFE_DRIVEN_SIM_VALUE 0
#define GPIO_RFFE_EDGE_TYPE "NONE"
#define GPIO_RFFE_FREQ 80000000
#define GPIO_RFFE_HAS_IN 1
#define GPIO_RFFE_HAS_OUT 1
#define GPIO_RFFE_HAS_TRI 0
#define GPIO_RFFE_IRQ -1
#define GPIO_RFFE_IRQ_INTERRUPT_CONTROLLER_ID -1
#define GPIO_RFFE_IRQ_TYPE "NONE"
#define GPIO_RFFE_NAME "/dev/gpio_rffe"
#define GPIO_RFFE_RESET_VALUE 0
#define GPIO_RFFE_SPAN 32
#define GPIO_RFFE_TYPE "altera_avalon_pio"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK none
#define ALT_TIMESTAMP_CLK none


/*
 * intern_pio configuration
 *
 */

#define ALT_MODULE_CLASS_intern_pio altera_avalon_pio
#define INTERN_PIO_BASE 0x410a0
#define INTERN_PIO_BIT_CLEARING_EDGE_REGISTER 0
#define INTERN_PIO_BIT_MODIFYING_OUTPUT_REGISTER 0
#define INTERN_PIO_CAPTURE 0
#define INTERN_PIO_DATA_WIDTH 8
#define INTERN_PIO_DO_TEST_BENCH_WIRING 0
#define INTERN_PIO_DRIVEN_SIM_VALUE 0
#define INTERN_PIO_EDGE_TYPE "NONE"
#define INTERN_PIO_FREQ 80000000
#define INTERN_PIO_HAS_IN 1
#define INTERN_PIO_HAS_OUT 0
#define INTERN_PIO_HAS_TRI 0
#define INTERN_PIO_IRQ -1
#define INTERN_PIO_IRQ_INTERRUPT_CONTROLLER_ID -1
#define INTERN_PIO_IRQ_TYPE "NONE"
#define INTERN_PIO_NAME "/dev/intern_pio"
#define INTERN_PIO_RESET_VALUE 0
#define INTERN_PIO_SPAN 16
#define INTERN_PIO_TYPE "altera_avalon_pio"


/*
 * jtag_uart configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart altera_avalon_jtag_uart
#define JTAG_UART_BASE 0x410b8
#define JTAG_UART_IRQ 0
#define JTAG_UART_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_NAME "/dev/jtag_uart"
#define JTAG_UART_READ_DEPTH 64
#define JTAG_UART_READ_THRESHOLD 8
#define JTAG_UART_SPAN 8
#define JTAG_UART_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_WRITE_DEPTH 64
#define JTAG_UART_WRITE_THRESHOLD 8


/*
 * opencores_i2c configuration
 *
 */

#define ALT_MODULE_CLASS_opencores_i2c bladerf_oc_i2c_master
#define OPENCORES_I2C_BASE 0x410b0
#define OPENCORES_I2C_IRQ 1
#define OPENCORES_I2C_IRQ_INTERRUPT_CONTROLLER_ID 0
#define OPENCORES_I2C_NAME "/dev/opencores_i2c"
#define OPENCORES_I2C_SPAN 8
#define OPENCORES_I2C_TYPE "bladerf_oc_i2c_master"


/*
 * peripheral_spi configuration
 *
 */

#define ALT_MODULE_CLASS_peripheral_spi altera_avalon_spi
#define PERIPHERAL_SPI_BASE 0x41020
#define PERIPHERAL_SPI_CLOCKMULT 1
#define PERIPHERAL_SPI_CLOCKPHASE 1
#define PERIPHERAL_SPI_CLOCKPOLARITY 1
#define PERIPHERAL_SPI_CLOCKUNITS "Hz"
#define PERIPHERAL_SPI_DATABITS 8
#define PERIPHERAL_SPI_DATAWIDTH 16
#define PERIPHERAL_SPI_DELAYMULT "1.0E-9"
#define PERIPHERAL_SPI_DELAYUNITS "ns"
#define PERIPHERAL_SPI_EXTRADELAY 0
#define PERIPHERAL_SPI_INSERT_SYNC 0
#define PERIPHERAL_SPI_IRQ 2
#define PERIPHERAL_SPI_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PERIPHERAL_SPI_ISMASTER 1
#define PERIPHERAL_SPI_LSBFIRST 0
#define PERIPHERAL_SPI_NAME "/dev/peripheral_spi"
#define PERIPHERAL_SPI_NUMSLAVES 2
#define PERIPHERAL_SPI_PREFIX "spi_"
#define PERIPHERAL_SPI_SPAN 32
#define PERIPHERAL_SPI_SYNC_REG_DEPTH 2
#define PERIPHERAL_SPI_TARGETCLOCK 960000u
#define PERIPHERAL_SPI_TARGETSSDELAY "0.0"
#define PERIPHERAL_SPI_TYPE "altera_avalon_spi"


/*
 * ram configuration
 *
 */

#define ALT_MODULE_CLASS_ram altera_avalon_onchip_memory2
#define RAM_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define RAM_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define RAM_BASE 0x20000
#define RAM_CONTENTS_INFO ""
#define RAM_DUAL_PORT 0
#define RAM_GUI_RAM_BLOCK_TYPE "AUTO"
#define RAM_INIT_CONTENTS_FILE "nios_cpu_ram"
#define RAM_INIT_MEM_CONTENT 0
#define RAM_INSTANCE_ID "NONE"
#define RAM_IRQ -1
#define RAM_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RAM_NAME "/dev/ram"
#define RAM_NON_DEFAULT_INIT_FILE_ENABLED 0
#define RAM_RAM_BLOCK_TYPE "AUTO"
#define RAM_READ_DURING_WRITE_MODE "DONT_CARE"
#define RAM_SINGLE_CLOCK_OP 0
#define RAM_SIZE_MULTIPLE 1
#define RAM_SIZE_VALUE 131072
#define RAM_SPAN 131072
#define RAM_TYPE "altera_avalon_onchip_memory2"
#define RAM_WRITABLE 1


/*
 * xb_gpio configuration
 *
 */

#define ALT_MODULE_CLASS_xb_gpio altera_avalon_pio
#define XB_GPIO_BASE 0x41040
#define XB_GPIO_BIT_CLEARING_EDGE_REGISTER 0
#define XB_GPIO_BIT_MODIFYING_OUTPUT_REGISTER 1
#define XB_GPIO_CAPTURE 0
#define XB_GPIO_DATA_WIDTH 8
#define XB_GPIO_DO_TEST_BENCH_WIRING 0
#define XB_GPIO_DRIVEN_SIM_VALUE 0
#define XB_GPIO_EDGE_TYPE "NONE"
#define XB_GPIO_FREQ 80000000
#define XB_GPIO_HAS_IN 1
#define XB_GPIO_HAS_OUT 0
#define XB_GPIO_HAS_TRI 0
#define XB_GPIO_IRQ -1
#define XB_GPIO_IRQ_INTERRUPT_CONTROLLER_ID -1
#define XB_GPIO_IRQ_TYPE "NONE"
#define XB_GPIO_NAME "/dev/xb_gpio"
#define XB_GPIO_RESET_VALUE 0
#define XB_GPIO_SPAN 32
#define XB_GPIO_TYPE "altera_avalon_pio"

#endif /* __SYSTEM_H_ */
