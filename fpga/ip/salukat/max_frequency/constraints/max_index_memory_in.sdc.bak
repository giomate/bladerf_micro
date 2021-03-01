## Generated SDC file "D:/Salukat/Development/Software/Quartus/BladeRF/hdl/fpga/ip/salukat/max_frequency/constraints/max_index_frequency_out.sdc"

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

## DATE    "Thu Dec 31 15:13:02 2020"

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

create_clock -name {clk} -period 16.270 -waveform { 0.000 8.000 } [get_ports {clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}] -hold 0.060  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_registers {*RADIX*din_*_reg*}] -to [get_registers {*RADIX*Mult*}]
set_false_path -from [get_registers {*RADIX*SDNF1_*twdl_*_reg*}] -to [get_registers {*RADIX*SDNF1_*Mult*}]
set_false_path -from [get_registers {*TWDLMULT_SDNF1_*din_*_reg*}] -to [get_registers {*TWDLMULT_SDNF1_*Mult*}]
set_false_path -from [get_registers {*_tc*phase_0*}] -to [get_registers {*Mult*ENA_DFF*}]
set_false_path -from [get_registers {*RADIX22*1_*Complex3Multiply_block*MUL3*din_*reg*}] -to [get_registers {*sum_pipe*}]
set_false_path -from [get_registers {*TWDLMULT_SDNF1_3_*twdl_*_reg*}] -to [get_registers {*TWDLMULT_SDNF1_3_*Mult*}]
set_false_path -from [get_registers {*TWDLMULT_SDNF1_3_*twdl_*_reg*}] -to [get_registers {*TWDLMULT_SDNF1_3_*twiddle_sum_pipe1*}]
set_false_path -from [get_registers {*Deserializer_contl_cnt*}] -to [get_registers {*Deserializer_out*}]
set_false_path -from [get_registers {*Deserializer_out*}] -to [get_registers {*Deserializer_out*}]
set_false_path -from [get_registers {*Deserializer_contl_cnt*}] -to [get_registers {*Deserializer_contl_cnt*}]
set_false_path -from [get_registers {*Deserializer_contl_cnt*}] -to [get_registers {*Deserializer_tapDelay*}]
set_false_path -from [get_registers {*Deserializer_tapDelayComp_reg_*}] -to [get_registers {*Deserializer_*}]
set_false_path -from [get_registers {*_tc*count32*}] -to [get_registers {*_tc*phase_0*}]
set_false_path -from [get_registers {*_tc*count32*}] -to [get_registers {*_tc*count32*}]
set_false_path -from [get_registers {*SDNF1_*Complex3Multiply*_pipe*}] -to [get_registers {*SDNF1_*rodOf*_pipe1*}]
set_false_path -from [get_registers {*_SDNF1_*MUL3_*}] -to [get_registers {*SDNF1_*rodOf*_pipe1*}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 32
set_multicycle_path -hold -end -to [get_fanouts -thru [get_pins -hierarchical {*|ena}] [get_registers {*u_max_index_frequency_tc|phase_0}]] 31


#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

