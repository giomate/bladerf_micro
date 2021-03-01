set enable_memory_reg [get_registers *u_max_index_memory_tc|phase_0]
set_multicycle_path 32 -to [get_fanouts $enable_memory_reg -through [get_pins -hier *|ena]] -end -setup
set_multicycle_path 31 -to [get_fanouts $enable_memory_reg -through [get_pins -hier *|ena]] -end -hold