
module nios_cpu (
	adi_stream_rx_clk_p,
	adi_stream_frame_p,
	adi_stream_data_p,
	adi_stream_data_n,
	adi_stream_frame_n,
	adi_stream_rx_clk_n,
	adi_stream_tx_clk_p,
	adi_stream_tx_clk_n,
	clk_clk,
	dac_MISO,
	dac_MOSI,
	dac_SCLK,
	dac_SS_n,
	gpio_in_port,
	gpio_out_port,
	gpio_mini_export,
	gpio_rf_in_port,
	gpio_rf_out_port,
	index_in_export,
	index_out_index_frequency,
	intern_gpio_export,
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
	spi_ad9361_MISO,
	spi_ad9361_MOSI,
	spi_ad9361_SCLK,
	spi_ad9361_SS_n,
	xb_gpios_export);	

	input		adi_stream_rx_clk_p;
	input		adi_stream_frame_p;
	input	[5:0]	adi_stream_data_p;
	input	[5:0]	adi_stream_data_n;
	input		adi_stream_frame_n;
	input		adi_stream_rx_clk_n;
	output		adi_stream_tx_clk_p;
	output		adi_stream_tx_clk_n;
	input		clk_clk;
	input		dac_MISO;
	output		dac_MOSI;
	output		dac_SCLK;
	output	[1:0]	dac_SS_n;
	input	[31:0]	gpio_in_port;
	output	[31:0]	gpio_out_port;
	output	[7:0]	gpio_mini_export;
	input	[31:0]	gpio_rf_in_port;
	output	[31:0]	gpio_rf_out_port;
	input	[7:0]	index_in_export;
	output	[7:0]	index_out_index_frequency;
	input	[7:0]	intern_gpio_export;
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
	input		spi_ad9361_MISO;
	output		spi_ad9361_MOSI;
	output		spi_ad9361_SCLK;
	output		spi_ad9361_SS_n;
	input	[7:0]	xb_gpios_export;
endmodule
