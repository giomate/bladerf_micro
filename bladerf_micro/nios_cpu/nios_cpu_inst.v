	nios_cpu u0 (
		.clk_clk             (<connected-to-clk_clk>),             //      clk.clk
		.dac_MISO            (<connected-to-dac_MISO>),            //      dac.MISO
		.dac_MOSI            (<connected-to-dac_MOSI>),            //         .MOSI
		.dac_SCLK            (<connected-to-dac_SCLK>),            //         .SCLK
		.dac_SS_n            (<connected-to-dac_SS_n>),            //         .SS_n
		.gpio_in_port        (<connected-to-gpio_in_port>),        //     gpio.in_port
		.gpio_out_port       (<connected-to-gpio_out_port>),       //         .out_port
		.gpio_rf_in_port     (<connected-to-gpio_rf_in_port>),     //  gpio_rf.in_port
		.gpio_rf_out_port    (<connected-to-gpio_rf_out_port>),    //         .out_port
		.oc_i2c_scl_pad_o    (<connected-to-oc_i2c_scl_pad_o>),    //   oc_i2c.scl_pad_o
		.oc_i2c_scl_padoen_o (<connected-to-oc_i2c_scl_padoen_o>), //         .scl_padoen_o
		.oc_i2c_sda_pad_i    (<connected-to-oc_i2c_sda_pad_i>),    //         .sda_pad_i
		.oc_i2c_sda_pad_o    (<connected-to-oc_i2c_sda_pad_o>),    //         .sda_pad_o
		.oc_i2c_sda_padoen_o (<connected-to-oc_i2c_sda_padoen_o>), //         .sda_padoen_o
		.oc_i2c_arst_i       (<connected-to-oc_i2c_arst_i>),       //         .arst_i
		.oc_i2c_scl_pad_i    (<connected-to-oc_i2c_scl_pad_i>),    //         .scl_pad_i
		.pll_MISO            (<connected-to-pll_MISO>),            //      pll.MISO
		.pll_MOSI            (<connected-to-pll_MOSI>),            //         .MOSI
		.pll_SCLK            (<connected-to-pll_SCLK>),            //         .SCLK
		.pll_SS_n            (<connected-to-pll_SS_n>),            //         .SS_n
		.reset_reset_n       (<connected-to-reset_reset_n>),       //    reset.reset_n
		.xb_gpios_export     (<connected-to-xb_gpios_export>)      // xb_gpios.export
	);

