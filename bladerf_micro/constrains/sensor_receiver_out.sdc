## Generated SDC file "D:/Salukat/Development/Software/Quartus/BladeRF/hdl/quartus/work/bladerf-micro-A4-hosted/constrains/sensor_receiver_out.sdc"

## Copyright (C) 2020  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

## DATE    "Mon Jan 04 10:04:27 2021"

##
## DEVICE  "5CEBA4F23C8"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 33.333 -waveform { 0.000 16.666 } [get_ports {altera_reserved_tck}]
create_clock -name {c5_clock2} -period 26.041 -waveform { 0.000 13.020 } [get_ports {c5_clock2}]
create_clock -name {adi_rx_clock} -period 4.000 -waveform { 0.000 2.000 } [get_ports {adi_rx_clock}]
#create_clock -name {v_rx_clk} -period 4.000 -waveform { 0.000 2.000 } 
#create_clock -name {fx3_virtual} -period 10.000 -waveform { 0.000 5.000 } 
#create_clock -name {fx3_pclk} -period 10.000 -waveform { 0.000 5.000 } [get_ports {fx3_pclk}]


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {U_system_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {U_system_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|refclkin}] -duty_cycle 50/1 -multiply_by 50 -divide_by 6 -master_clock {c5_clock2} [get_pins {U_system_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 4 -master_clock {U_system_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 
#create_generated_clock -name {U_fx3_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {U_fx3_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|refclkin}] -duty_cycle 50/1 -multiply_by 8 -divide_by 2 -master_clock {fx3_pclk} [get_pins {U_fx3_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]}] 
#create_generated_clock -name {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 4 -phase -445435200/3600000 -master_clock {U_fx3_pll|altera_pll_i|general[0].gpll~FRACTIONAL_PLL|vcoph[0]} [get_pins {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {adi_sclk_reg} -source [get_pins {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -divide_by 2 -master_clock {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} [get_registers {*rffe_spi|SCLK_reg}] 
create_generated_clock -name {adi_sclk_pin} -source [get_registers -no_duplicates {*rffe_spi|SCLK_reg}] -master_clock {adi_sclk_reg} [get_ports {adi_spi_sclk}] 
create_generated_clock -name {peri_sclk_reg} -source [get_pins {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -divide_by 10 -master_clock {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} [get_registers {*peripheral_spi|SCLK_reg}] 
create_generated_clock -name {adf_sclk_pin} -source [get_registers -no_duplicates {*peripheral_spi|SCLK_reg}] -phase 180/1 -master_clock {peri_sclk_reg} [get_ports {adf_sclk}] 
create_generated_clock -name {dac_sclk_pin} -source [get_registers -no_duplicates {*peripheral_spi|SCLK_reg}] -master_clock {peri_sclk_reg} [get_ports {dac_sclk}] 
create_generated_clock -name {i2c_scl_reg} -source [get_pins {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -divide_by 200 -master_clock {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk} [get_registers {*bit_controller|scl_oen}] 
create_generated_clock -name {pwr_scl_pin} -source [get_registers -no_duplicates {*bit_controller|scl_oen}] -master_clock {i2c_scl_reg} [get_ports {pwr_scl}] 
create_generated_clock -name {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~FRACTIONAL_PLL|vcoph[0]} -source [get_pins {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~FRACTIONAL_PLL|refclkin}] -duty_cycle 50/1 -multiply_by 4 -divide_by 2 -master_clock {adi_rx_clock} [get_pins {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~FRACTIONAL_PLL|vcoph[0]}] 
create_generated_clock -name {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -divide_by 4 -phase 315/1 -master_clock {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~FRACTIONAL_PLL|vcoph[0]} [get_pins {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_ena~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_ena~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 25/1 -multiply_by 1 -divide_by 4 -phase 180/1 -master_clock {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~FRACTIONAL_PLL|vcoph[0]} [get_pins {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_ena~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk} -source [get_pins {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|vco0ph[0]}] -duty_cycle 50/1 -multiply_by 1 -phase 180/1 -master_clock {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~FRACTIONAL_PLL|vcoph[0]} [get_pins {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] 


#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {pwr_scl_pin}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {pwr_scl_pin}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {pwr_scl_pin}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {pwr_scl_pin}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {pwr_scl_pin}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {pwr_scl_pin}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {pwr_scl_pin}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {pwr_scl_pin}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {i2c_scl_reg}] -rise_to [get_clocks {i2c_scl_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {i2c_scl_reg}] -rise_to [get_clocks {i2c_scl_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2c_scl_reg}] -fall_to [get_clocks {i2c_scl_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {i2c_scl_reg}] -fall_to [get_clocks {i2c_scl_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2c_scl_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {i2c_scl_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {i2c_scl_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {i2c_scl_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2c_scl_reg}] -rise_to [get_clocks {i2c_scl_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {i2c_scl_reg}] -rise_to [get_clocks {i2c_scl_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2c_scl_reg}] -fall_to [get_clocks {i2c_scl_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {i2c_scl_reg}] -fall_to [get_clocks {i2c_scl_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2c_scl_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {i2c_scl_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {i2c_scl_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {i2c_scl_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {peri_sclk_reg}] -rise_to [get_clocks {peri_sclk_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {peri_sclk_reg}] -rise_to [get_clocks {peri_sclk_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {peri_sclk_reg}] -fall_to [get_clocks {peri_sclk_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {peri_sclk_reg}] -fall_to [get_clocks {peri_sclk_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {peri_sclk_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {peri_sclk_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {peri_sclk_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {peri_sclk_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {peri_sclk_reg}] -rise_to [get_clocks {peri_sclk_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {peri_sclk_reg}] -rise_to [get_clocks {peri_sclk_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {peri_sclk_reg}] -fall_to [get_clocks {peri_sclk_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {peri_sclk_reg}] -fall_to [get_clocks {peri_sclk_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {peri_sclk_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {peri_sclk_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {peri_sclk_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {peri_sclk_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_pin}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_pin}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_pin}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_pin}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_pin}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_pin}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_pin}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_pin}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_reg}] -rise_to [get_clocks {adi_sclk_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_reg}] -rise_to [get_clocks {adi_sclk_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_reg}] -fall_to [get_clocks {adi_sclk_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_reg}] -fall_to [get_clocks {adi_sclk_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {adi_sclk_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_reg}] -rise_to [get_clocks {adi_sclk_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_reg}] -rise_to [get_clocks {adi_sclk_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_reg}] -fall_to [get_clocks {adi_sclk_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_reg}] -fall_to [get_clocks {adi_sclk_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_reg}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {adi_sclk_reg}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -rise_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.070  
set_clock_uncertainty -rise_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {fx3_virtual}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {fx3_virtual}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.080  
set_clock_uncertainty -fall_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.070  
set_clock_uncertainty -fall_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {fx3_virtual}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {fx3_virtual}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {pwr_scl_pin}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {pwr_scl_pin}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {pwr_scl_pin}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {pwr_scl_pin}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {i2c_scl_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {i2c_scl_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {i2c_scl_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {i2c_scl_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {dac_sclk_pin}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {dac_sclk_pin}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {dac_sclk_pin}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {dac_sclk_pin}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adf_sclk_pin}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adf_sclk_pin}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adf_sclk_pin}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adf_sclk_pin}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {peri_sclk_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {peri_sclk_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {peri_sclk_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {peri_sclk_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_sclk_pin}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_sclk_pin}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_sclk_pin}] -setup 0.200  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_sclk_pin}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_sclk_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_sclk_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_sclk_reg}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_sclk_reg}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_rx_clock}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_rx_clock}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {pwr_scl_pin}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {pwr_scl_pin}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {pwr_scl_pin}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {pwr_scl_pin}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {i2c_scl_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {i2c_scl_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {i2c_scl_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {i2c_scl_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {dac_sclk_pin}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {dac_sclk_pin}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {dac_sclk_pin}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {dac_sclk_pin}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adf_sclk_pin}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adf_sclk_pin}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adf_sclk_pin}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adf_sclk_pin}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {peri_sclk_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {peri_sclk_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {peri_sclk_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {peri_sclk_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_sclk_pin}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_sclk_pin}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_sclk_pin}] -setup 0.200  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_sclk_pin}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_sclk_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_sclk_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_sclk_reg}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_sclk_reg}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -setup 0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {adi_rx_clock}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {adi_rx_clock}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {fx3_pclk}] -rise_to [get_clocks {fx3_pclk}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {fx3_pclk}] -rise_to [get_clocks {fx3_pclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fx3_pclk}] -fall_to [get_clocks {fx3_pclk}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {fx3_pclk}] -fall_to [get_clocks {fx3_pclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fx3_pclk}] -rise_to [get_clocks {fx3_pclk}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {fx3_pclk}] -rise_to [get_clocks {fx3_pclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fx3_pclk}] -fall_to [get_clocks {fx3_pclk}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {fx3_pclk}] -fall_to [get_clocks {fx3_pclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fx3_virtual}] -rise_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {fx3_virtual}] -fall_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.060  
set_clock_uncertainty -rise_from [get_clocks {fx3_virtual}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.100  
set_clock_uncertainty -rise_from [get_clocks {fx3_virtual}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {fx3_virtual}] -rise_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {fx3_virtual}] -fall_to [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.060  
set_clock_uncertainty -fall_from [get_clocks {fx3_virtual}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {fx3_virtual}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.100  
set_clock_uncertainty -rise_from [get_clocks {c5_clock2}] -rise_to [get_clocks {c5_clock2}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {c5_clock2}] -rise_to [get_clocks {c5_clock2}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {c5_clock2}] -fall_to [get_clocks {c5_clock2}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {c5_clock2}] -fall_to [get_clocks {c5_clock2}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {c5_clock2}] -rise_to [get_clocks {c5_clock2}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {c5_clock2}] -rise_to [get_clocks {c5_clock2}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {c5_clock2}] -fall_to [get_clocks {c5_clock2}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {c5_clock2}] -fall_to [get_clocks {c5_clock2}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {adi_rx_clock}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {adi_rx_clock}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.150  
set_clock_uncertainty -rise_from [get_clocks {adi_rx_clock}] -rise_to [get_clocks {adi_rx_clock}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {adi_rx_clock}] -rise_to [get_clocks {adi_rx_clock}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {adi_rx_clock}] -fall_to [get_clocks {adi_rx_clock}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {adi_rx_clock}] -fall_to [get_clocks {adi_rx_clock}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {adi_rx_clock}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {adi_rx_clock}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.150  
set_clock_uncertainty -fall_from [get_clocks {adi_rx_clock}] -rise_to [get_clocks {adi_rx_clock}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {adi_rx_clock}] -rise_to [get_clocks {adi_rx_clock}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {adi_rx_clock}] -fall_to [get_clocks {adi_rx_clock}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {adi_rx_clock}] -fall_to [get_clocks {adi_rx_clock}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.280  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.280  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.280  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.280  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}]  0.070  
set_clock_uncertainty -fall_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_fclk~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}]  0.070  
set_clock_uncertainty -rise_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -setup 0.070  
set_clock_uncertainty -rise_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -setup 0.070  
set_clock_uncertainty -fall_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -rise_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -rise_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}]  0.160  
set_clock_uncertainty -fall_from [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] -fall_to [get_clocks {U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|pll_sclk~PLL_OUTPUT_COUNTER|divclk}]  0.160  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {adi_sclk_pin}]  8.246 [get_ports {adi_spi_sdo}]
set_input_delay -add_delay -min -clock [get_clocks {adi_sclk_pin}]  3.119 [get_ports {adi_spi_sdo}]
set_input_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  2.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  2.000 [get_ports {altera_reserved_tms}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[0]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[0]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[1]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[1]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[2]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[2]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[3]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[3]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[4]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[4]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[5]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[5]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[6]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[6]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[7]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[7]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[8]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[8]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[9]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[9]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[10]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[10]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[11]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[11]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_ctl[12]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_ctl[12]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[0]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[0]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[1]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[1]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[2]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[2]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[3]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[3]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[4]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[4]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[5]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[5]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[6]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[6]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[7]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[7]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[8]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[8]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[9]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[9]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[10]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[10]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[11]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[11]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[12]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[12]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[13]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[13]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[14]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[14]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[15]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[15]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[16]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[16]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[17]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[17]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[18]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[18]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[19]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[19]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[20]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[20]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[21]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[21]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[22]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[22]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[23]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[23]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[24]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[24]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[25]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[25]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[26]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[26]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[27]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[27]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[28]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[28]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[29]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[29]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[30]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[30]}]
set_input_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  9.034 [get_ports {fx3_gpif[31]}]
set_input_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  7.034 [get_ports {fx3_gpif[31]}]
set_input_delay -add_delay -max -clock [get_clocks {pwr_scl_pin}]  100.000 [get_ports {pwr_sda}]
set_input_delay -add_delay -min -clock [get_clocks {pwr_scl_pin}]  900.000 [get_ports {pwr_sda}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {adf_sclk_pin}]  10.694 [get_ports {adf_csn}]
set_output_delay -add_delay -min -clock [get_clocks {adf_sclk_pin}]  -9.306 [get_ports {adf_csn}]
set_output_delay -add_delay -max -clock [get_clocks {adf_sclk_pin}]  10.756 [get_ports {adf_sdi}]
set_output_delay -add_delay -min -clock [get_clocks {adf_sclk_pin}]  -9.244 [get_ports {adf_sdi}]
set_output_delay -add_delay -max -clock [get_clocks {adi_sclk_pin}]  1.264 [get_ports {adi_spi_csn}]
set_output_delay -add_delay -min -clock [get_clocks {adi_sclk_pin}]  0.264 [get_ports {adi_spi_csn}]
set_output_delay -add_delay -max -clock [get_clocks {adi_sclk_pin}]  2.295 [get_ports {adi_spi_sdi}]
set_output_delay -add_delay -min -clock [get_clocks {adi_sclk_pin}]  -0.705 [get_ports {adi_spi_sdi}]
set_output_delay -add_delay  -clock [get_clocks {altera_reserved_tck}]  2.000 [get_ports {altera_reserved_tdo}]
set_output_delay -add_delay -max -clock [get_clocks {dac_sclk_pin}]  10.357 [get_ports {dac_csn}]
set_output_delay -add_delay -min -clock [get_clocks {dac_sclk_pin}]  0.357 [get_ports {dac_csn}]
set_output_delay -add_delay -max -clock [get_clocks {dac_sclk_pin}]  5.345 [get_ports {dac_sdi}]
set_output_delay -add_delay -min -clock [get_clocks {dac_sclk_pin}]  -4.155 [get_ports {dac_sdi}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[0]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[0]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[1]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[1]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[2]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[2]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[3]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[3]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[4]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[4]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[5]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[5]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[6]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[6]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[7]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[7]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[8]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[8]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[9]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[9]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[10]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[10]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[11]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[11]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_ctl[12]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_ctl[12]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[0]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[0]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[1]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[1]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[2]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[2]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[3]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[3]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[4]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[4]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[5]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[5]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[6]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[6]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[7]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[7]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[8]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[8]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[9]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[9]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[10]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[10]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[11]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[11]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[12]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[12]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[13]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[13]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[14]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[14]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[15]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[15]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[16]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[16]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[17]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[17]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[18]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[18]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[19]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[19]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[20]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[20]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[21]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[21]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[22]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[22]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[23]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[23]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[24]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[24]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[25]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[25]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[26]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[26]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[27]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[27]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[28]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[28]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[29]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[29]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[30]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[30]}]
set_output_delay -add_delay -max -clock [get_clocks {fx3_virtual}]  2.260 [get_ports {fx3_gpif[31]}]
set_output_delay -add_delay -min -clock [get_clocks {fx3_virtual}]  -0.240 [get_ports {fx3_gpif[31]}]
set_output_delay -add_delay -max -clock [get_clocks {pwr_scl_pin}]  100.000 [get_ports {pwr_sda}]
set_output_delay -add_delay -min -clock [get_clocks {pwr_scl_pin}]  900.000 [get_ports {pwr_sda}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -exclusive -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -exclusive -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -exclusive -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_registers {*tdd_contr*_xfer_*}] 
set_false_path -to [get_registers {*index_finder*}]
set_false_path -from [get_registers {*index_finder*}] -to [get_registers {*sync_index*reg*}]
set_false_path -from [get_registers {*index_finder*}] -to [get_registers {*sync_index*sync*}]
set_false_path -from [get_registers {*Deserializer_contl*}] -to [get_registers {*serial2parallel*tapDelayComp*}]
set_false_path -from [get_registers {*alt_rst_sync*chain_out*}] -to [get_registers {*serial2parallel*Deserializer_out*}]
set_false_path -from [get_registers {*serial2parallel*Deserializer_contl*}] -to [get_registers {*serial2parallel*Deserializer_out*}]
set_false_path -from [get_registers {*axi_ad9361_tx*dac*}] -to [get_registers {*_tx*dac*}]
set_false_path -from [get_registers {*lvds_rx*auto*}] -to [get_registers {*i_dev_if*adc_data*}]
set_false_path -from [get_registers {*alt_rst_sync*chain_out*}] -to [get_registers {*FFT*TWDLMULT*}]
set_false_path -from [get_registers {*alt_rst_sync*chain_out*}] 
set_false_path -from [get_registers {*_tc*phase_0*}] 
set_false_path -from [get_registers {*i_dev_if*mode*}] -to [get_registers {*i_dev_if*adc_data*}]
set_false_path -from [get_registers {*u_MUL3_2*reg*}] 
set_false_path -from [get_registers {*up_adc_common*core*}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|jupdate}] -to [get_registers {*|alt_jtag_atlantic:*|jupdate1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rdata[*]}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read}] -to [get_registers {*|alt_jtag_atlantic:*|read1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|read_req}] 
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|rvalid}] -to [get_registers {*|alt_jtag_atlantic*|td_shift[*]}]
set_false_path -from [get_registers {*|t_dav}] -to [get_registers {*|alt_jtag_atlantic:*|tck_t_dav}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|user_saw_rvalid}] -to [get_registers {*|alt_jtag_atlantic:*|rvalid0*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|wdata[*]}] -to [get_registers *]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write}] -to [get_registers {*|alt_jtag_atlantic:*|write1*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_ena*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_stalled}] -to [get_registers {*|alt_jtag_atlantic:*|t_pause*}]
set_false_path -from [get_registers {*|alt_jtag_atlantic:*|write_valid}] 
set_false_path -to [get_keepers {*altera_std_synchronizer:*|din_s1}]
set_false_path -to [get_registers {*reset_synchronizer:*|*}]
set_false_path -to [get_registers {*synchronizer:*|reg0}]
set_false_path -to [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd13|dinfiforx[0]}]
set_false_path -to [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd11|dinfiforx[0]}]
set_false_path -to [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd9|dinfiforx[0]}]
set_false_path -to [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd7|dinfiforx[0]}]
set_false_path -to [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd5|dinfiforx[0]}]
set_false_path -to [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd3|dinfiforx[0]}]
set_false_path -to [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd1|dinfiforx[0]}]
set_false_path -to [get_ports {ps_sync_1p*}]
set_false_path -to [get_ports {rx_bias_en tx_bias_en}]
set_false_path -to [get_ports {exp_gpio[*] exp_clock_oe}]
set_false_path -to [get_ports {adf_ce}]
set_false_path -to [get_ports {led*}]
set_false_path -to [get_ports {adi_*x_spdt*_v*}]
set_false_path -to [get_ports {si_clock_sel}]
set_false_path -to [get_ports {ufl_clock_oe}]
set_false_path -from [get_keepers {adf_muxout}] 
set_false_path -from [get_keepers {exp_clock_req}] 
set_false_path -from [get_keepers {exp_present}] 
set_false_path -from [get_keepers {pwr_status}] 
set_false_path -from [get_ports {mini_exp*}] 
set_false_path -to [get_ports {mini_exp*}]
set_false_path -from [get_registers {*outSwitchMag_*}] -to [get_registers {*index_synchronizer*reg*}]
set_false_path -from [get_registers {*outSwitchMag_*}] -to [get_registers {*index_synchronizer*sync*}]
set_false_path -from [get_ports {fx3_uart_*}] 
set_false_path -to [get_ports {fx3_uart_*}]
set_false_path -to [get_ports {adi_ctrl_in[*]}]
set_false_path -to [get_ports {adi_sync_in}]
set_false_path -to [get_ports {adi_en_agc}]
set_false_path -to [get_ports {adi_enable}]
set_false_path -to [get_ports {adi_txnrx}]
set_false_path -to [get_ports {adi_reset_n}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_rst_sync_uq1|altera_reset_synchronizer_int_chain*|clrn}]
set_false_path -from [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_nios2_oci_break:the_nios_system_nios2_cpu_nios2_oci_break|break_readreg*}] -to [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_debug_slave_wrapper:the_nios_system_nios2_cpu_debug_slave_wrapper|nios_system_nios2_cpu_debug_slave_tck:the_nios_system_nios2_cpu_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_nios2_oci_debug:the_nios_system_nios2_cpu_nios2_oci_debug|*resetlatch}] -to [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_debug_slave_wrapper:the_nios_system_nios2_cpu_debug_slave_wrapper|nios_system_nios2_cpu_debug_slave_tck:the_nios_system_nios2_cpu_debug_slave_tck|*sr[33]}]
set_false_path -from [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_nios2_oci_debug:the_nios_system_nios2_cpu_nios2_oci_debug|monitor_ready}] -to [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_debug_slave_wrapper:the_nios_system_nios2_cpu_debug_slave_wrapper|nios_system_nios2_cpu_debug_slave_tck:the_nios_system_nios2_cpu_debug_slave_tck|*sr[0]}]
set_false_path -from [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_nios2_oci_debug:the_nios_system_nios2_cpu_nios2_oci_debug|monitor_error}] -to [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_debug_slave_wrapper:the_nios_system_nios2_cpu_debug_slave_wrapper|nios_system_nios2_cpu_debug_slave_tck:the_nios_system_nios2_cpu_debug_slave_tck|*sr[34]}]
set_false_path -from [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_nios2_ocimem:the_nios_system_nios2_cpu_nios2_ocimem|*MonDReg*}] -to [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_debug_slave_wrapper:the_nios_system_nios2_cpu_debug_slave_wrapper|nios_system_nios2_cpu_debug_slave_tck:the_nios_system_nios2_cpu_debug_slave_tck|*sr*}]
set_false_path -from [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_debug_slave_wrapper:the_nios_system_nios2_cpu_debug_slave_wrapper|nios_system_nios2_cpu_debug_slave_tck:the_nios_system_nios2_cpu_debug_slave_tck|*sr*}] -to [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_debug_slave_wrapper:the_nios_system_nios2_cpu_debug_slave_wrapper|nios_system_nios2_cpu_debug_slave_sysclk:the_nios_system_nios2_cpu_debug_slave_sysclk|*jdo*}]
set_false_path -from [get_keepers {sld_hub:*|irf_reg*}] -to [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_debug_slave_wrapper:the_nios_system_nios2_cpu_debug_slave_wrapper|nios_system_nios2_cpu_debug_slave_sysclk:the_nios_system_nios2_cpu_debug_slave_sysclk|ir*}]
set_false_path -from [get_keepers {sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1]}] -to [get_keepers {*nios_system_nios2_cpu:*|nios_system_nios2_cpu_nios2_oci:the_nios_system_nios2_cpu_nios2_oci|nios_system_nios2_cpu_nios2_oci_debug:the_nios_system_nios2_cpu_nios2_oci_debug|monitor_go}]
set_false_path -from [get_registers {*up_xfer_cntrl:i_xfer_cntrl|d_xfer_toggle*}] -to [get_registers {*up_xfer_cntrl:i_xfer_cntrl|up_xfer_state_m1*}]
set_false_path -from [get_registers {*up_xfer_cntrl:i_xfer_cntrl|up_xfer_toggle*}] -to [get_registers {*up_xfer_cntrl:i_xfer_cntrl|d_xfer_toggle_m1*}]
set_false_path -from [get_registers {*up_xfer_cntrl:i_xfer_cntrl|up_xfer_data*}] -to [get_registers {*up_xfer_cntrl:i_xfer_cntrl|d_data_cntrl*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -start -from  [get_clocks {fx3_pclk}]  -to  [get_clocks {fx3_virtual}] 1
set_multicycle_path -hold -start -from  [get_clocks {fx3_pclk}]  -to  [get_clocks {fx3_virtual}] 1
set_multicycle_path -setup -start -from  [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {fx3_virtual}] 2
set_multicycle_path -hold -start -from  [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {fx3_virtual}] 2
set_multicycle_path -setup -start -from  [get_clocks {fx3_virtual}]  -to  [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 2
set_multicycle_path -hold -start -from  [get_clocks {fx3_virtual}]  -to  [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 2
set_multicycle_path -setup -start -from  [get_clocks {adi_sclk_pin}]  -to  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 2
set_multicycle_path -hold -start -from  [get_clocks {adi_sclk_pin}]  -to  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 2
set_multicycle_path -setup -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {adf_sclk_pin}] 5
set_multicycle_path -hold -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {adf_sclk_pin}] 9
set_multicycle_path -setup -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {dac_sclk_pin}] 5
set_multicycle_path -hold -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {dac_sclk_pin}] 9
set_multicycle_path -setup -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {pwr_scl_pin}] 100
set_multicycle_path -hold -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {pwr_scl_pin}] 199
set_multicycle_path -setup -end -from  [get_clocks {pwr_scl_pin}]  -to  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 100
set_multicycle_path -hold -end -from  [get_clocks {pwr_scl_pin}]  -to  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 199
set_multicycle_path -setup -start -from  [get_clocks {fx3_pclk}]  -to  [get_clocks {fx3_virtual}] 1
set_multicycle_path -hold -start -from  [get_clocks {fx3_pclk}]  -to  [get_clocks {fx3_virtual}] 1
set_multicycle_path -setup -start -from  [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {fx3_virtual}] 2
set_multicycle_path -hold -start -from  [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {fx3_virtual}] 2
set_multicycle_path -setup -start -from  [get_clocks {fx3_virtual}]  -to  [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 2
set_multicycle_path -hold -start -from  [get_clocks {fx3_virtual}]  -to  [get_clocks {U_fx3_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 2
set_multicycle_path -setup -start -from  [get_clocks {adi_sclk_pin}]  -to  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 2
set_multicycle_path -hold -start -from  [get_clocks {adi_sclk_pin}]  -to  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 2
set_multicycle_path -setup -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {adf_sclk_pin}] 5
set_multicycle_path -hold -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {adf_sclk_pin}] 9
set_multicycle_path -setup -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {dac_sclk_pin}] 5
set_multicycle_path -hold -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {dac_sclk_pin}] 9
set_multicycle_path -setup -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {pwr_scl_pin}] 100
set_multicycle_path -hold -start -from  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}]  -to  [get_clocks {pwr_scl_pin}] 199
set_multicycle_path -setup -end -from  [get_clocks {pwr_scl_pin}]  -to  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 100
set_multicycle_path -hold -end -from  [get_clocks {pwr_scl_pin}]  -to  [get_clocks {U_system_pll|altera_pll_i|general[0].gpll~PLL_OUTPUT_COUNTER|divclk}] 199
set_multicycle_path -setup -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 32
set_multicycle_path -hold -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 31
set_multicycle_path -setup -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 32
set_multicycle_path -hold -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 31
set_multicycle_path -setup -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd14|writeclk}] 4
set_multicycle_path -hold -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd14|writeclk}] 3
set_multicycle_path -setup -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd12|writeclk}] 4
set_multicycle_path -hold -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd12|writeclk}] 3
set_multicycle_path -setup -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd10|writeclk}] 4
set_multicycle_path -hold -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd10|writeclk}] 3
set_multicycle_path -setup -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd8|writeclk}] 4
set_multicycle_path -hold -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd8|writeclk}] 3
set_multicycle_path -setup -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd6|writeclk}] 4
set_multicycle_path -hold -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd6|writeclk}] 3
set_multicycle_path -setup -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd4|writeclk}] 4
set_multicycle_path -hold -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd4|writeclk}] 3
set_multicycle_path -setup -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd2|writeclk}] 4
set_multicycle_path -hold -start -from [get_pins { U_nios_system|tranceiver|if_axi_ad9361|i_dev_if|i_axi_ad9361_lvds_if_c5|i_altlvds_rx|auto_generated|sd2|writeclk}] 3
set_multicycle_path -setup -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 32
set_multicycle_path -hold -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 31
set_multicycle_path -setup -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 32
set_multicycle_path -hold -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 31


#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}] 100.000
set_max_delay -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}] 100.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}] -100.000
set_min_delay -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}] -100.000


#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Net Delay
#**************************************************************

set_net_delay -max 2.000 -from [get_registers {*altera_avalon_st_clock_crosser:*|in_data_buffer*}] -to [get_registers {*altera_avalon_st_clock_crosser:*|out_data_buffer*}]
set_net_delay -max 2.000 -from [get_registers *] -to [get_registers {*altera_avalon_st_clock_crosser:*|altera_std_synchronizer_nocut:*|din_s1}]


#**************************************************************
# Set Max Skew
#**************************************************************

set_max_skew -from [get_clocks {adi_sclk_pin}] -to [get_ports {adi_spi_sclk}] 0.200 
set_max_skew -from [get_clocks {adf_sclk_pin}] -to [get_ports {adf_sclk}] 0.200 
set_max_skew -from [get_clocks {dac_sclk_pin}] -to [get_ports {dac_sclk}] 0.200 
set_max_skew -from [get_clocks {pwr_scl_pin}] -to [get_ports {pwr_scl}] 0.200 
set_max_skew -from [get_clocks {adi_sclk_pin}] -to [get_ports {adi_spi_sclk}] 0.200 
set_max_skew -from [get_clocks {adf_sclk_pin}] -to [get_ports {adf_sclk}] 0.200 
set_max_skew -from [get_clocks {dac_sclk_pin}] -to [get_ports {dac_sclk}] 0.200 
set_max_skew -from [get_clocks {pwr_scl_pin}] -to [get_ports {pwr_scl}] 0.200 
