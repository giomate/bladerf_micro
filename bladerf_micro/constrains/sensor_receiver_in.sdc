set_false_path -from [get_registers *tdd_contr*_xfer_*] -to *
set_false_path -from * -to [get_registers *index_finder*]
set_false_path -from [get_registers *index_finder*] -to [get_registers *sync_index*reg*]
set_false_path -from [get_registers *index_finder*] -to [get_registers *sync_index*sync*]
set_false_path -from [get_registers *Deserializer_contl*] -to [get_registers *serial2parallel*tapDelayComp*]
set_false_path -from [get_registers *alt_rst_sync*chain_out*] -to [get_registers *serial2parallel*Deserializer_out*]
set_false_path -from [get_registers *serial2parallel*Deserializer_contl*] -to [get_registers *serial2parallel*Deserializer_out*]
set_false_path -from [get_registers *axi_ad9361_tx*dac*] -to [get_registers *_tx*dac*]
set_false_path -from [get_registers *lvds_rx*auto*] -to [get_registers *i_dev_if*adc_data*]
set_false_path -from [get_registers *alt_rst_sync*chain_out*] -to [get_registers *FFT*TWDLMULT*]

set_false_path -from [get_registers *alt_rst_sync*chain_out*] -to *

set_false_path -from [get_registers *_tc*phase_0*] -to *

set_false_path -from [get_registers *i_dev_if*mode*] -to [get_registers *i_dev_if*adc_data*]

set_false_path -from [get_registers *u_MUL3_2*reg*] -to *
set_false_path -from [get_registers *up_adc_common*core*] -to *