`timescale 1 ps/1 ps

module i2c_qip_test(
	input clk,
	input rst,
	input sclk,
	inout sda);

i2c_sys  i2c(
	.bladerf_oc_i2c_master_0_clock_sink_clk(clk), .bladerf_oc_i2c_master_0_reset_sink_reset(rst),
	.bladerf_oc_i2c_master_0_conduit_end_scl_pad_i(sclk),
	.bladerf_oc_i2c_master_0_conduit_end_scl_pad_o(sda) );

	
         
endmodule