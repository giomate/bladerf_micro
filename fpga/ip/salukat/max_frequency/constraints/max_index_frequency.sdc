#set_false_path -from [get_keepers *ram_block*] -to [get_keepers *Mult2*]
set_false_path -from [get_registers *RADIX*din_*_reg*] -to [get_registers *RADIX*Mult*]
set_false_path -from [get_registers *RADIX*SDNF1_*twdl_*_reg*] -to [get_registers *RADIX*SDNF1_*Mult*]
set_false_path -from [get_registers *TWDLMULT_SDNF1_*din_*_reg*] -to [get_registers *TWDLMULT_SDNF1_*Mult*]
set_false_path -from [get_registers *_tc*phase_0*] -to [get_registers *Mult*ENA_DFF*]
set_false_path -from [get_registers *RADIX22*1_*Complex3Multiply_block*MUL3*din_*reg*] -to [get_registers *sum_pipe*]
set_false_path -from [get_registers *TWDLMULT_SDNF1_3_*twdl_*_reg*] -to [get_registers *TWDLMULT_SDNF1_3_*Mult*]
set_false_path -from [get_registers *TWDLMULT_SDNF1_3_*twdl_*_reg*] -to [get_registers *TWDLMULT_SDNF1_3_*twiddle_sum_pipe1*]

set_false_path -from [get_registers *Deserializer_contl_cnt*] -to [get_registers *Deserializer_out*]
set_false_path -from [get_registers *Deserializer_out*] -to [get_registers *Deserializer_out*]
set_false_path -from [get_registers *Deserializer_contl_cnt*] -to [get_registers *Deserializer_contl_cnt*]
set_false_path -from [get_registers *Deserializer_contl_cnt*] -to [get_registers *Deserializer_tapDelay*]
set_false_path -from [get_registers *Deserializer_tapDelayComp_reg_*] -to [get_registers *Deserializer_*]

set_false_path -from [get_registers *_tc*count32*] -to [get_registers *_tc*phase_0*]
set_false_path -from [get_registers *_tc*count32*] -to [get_registers *_tc*count32*]


set_false_path -from [get_registers *SDNF1_*Complex3Multiply*_pipe*] -to [get_registers *SDNF1_*rodOf*_pipe1*]

set_false_path -from [get_registers *_SDNF1_*MUL3_*] -to [get_registers *SDNF1_*rodOf*_pipe1*]

