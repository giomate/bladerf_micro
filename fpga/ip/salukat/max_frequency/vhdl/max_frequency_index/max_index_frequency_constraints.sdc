# Multicycle constraints for clock enable: max_index_frequency_tc.u1_d32_o0
set enbreg [get_registers *u_max_index_frequency_tc|phase_0]
set_multicycle_path 32 -to [get_fanouts $enbreg -through [get_pins -hier *|ena]] -end -setup
set_multicycle_path 31 -to [get_fanouts $enbreg -through [get_pins -hier *|ena]] -end -hold

