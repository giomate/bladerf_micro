
module nios_cpu (
	clk_clk,
	dac_MISO,
	dac_MOSI,
	dac_SCLK,
	dac_SS_n,
	gpio_in_port,
	gpio_out_port,
	gpio_rf_in_port,
	gpio_rf_out_port,
	oc_i2c_scl_pad_o,
	oc_i2c_scl_padoen_o,
	oc_i2c_sda_pad_i,
	oc_i2c_sda_pad_o,
	oc_i2c_sda_padoen_o,
	oc_i2c_arst_i,
	oc_i2c_scl_pad_i,
	pll_MISO,
	pll_MOSI,
	pll_SCLK,
	pll_SS_n,
	reset_reset_n,
	xb_gpios_export);	

	input		clk_clk;
	input		dac_MISO;
	output		dac_MOSI;
	output		dac_SCLK;
	output	[1:0]	dac_SS_n;
	input	[31:0]	gpio_in_port;
	output	[31:0]	gpio_out_port;
	input	[31:0]	gpio_rf_in_port;
	output	[31:0]	gpio_rf_out_port;
	output		oc_i2c_scl_pad_o;
	output		oc_i2c_scl_padoen_o;
	input		oc_i2c_sda_pad_i;
	output		oc_i2c_sda_pad_o;
	output		oc_i2c_sda_padoen_o;
	input		oc_i2c_arst_i;
	input		oc_i2c_scl_pad_i;
	input		pll_MISO;
	output		pll_MOSI;
	output		pll_SCLK;
	output		pll_SS_n;
	input		reset_reset_n;
	input	[7:0]	xb_gpios_export;
endmodule
