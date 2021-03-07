	sensor_reader u0 (
		.reset_reset_n                              (<connected-to-reset_reset_n>),                              //                               reset.reset_n
		.clk_clk                                    (<connected-to-clk_clk>),                                    //                                 clk.clk
		.spin_sensor_receiver_0_iq_data_out_re_data (<connected-to-spin_sensor_receiver_0_iq_data_out_re_data>), //  spin_sensor_receiver_0_iq_data_out.re_data
		.spin_sensor_receiver_0_iq_data_out_im_data (<connected-to-spin_sensor_receiver_0_iq_data_out_im_data>), //                                    .im_data
		.spin_sensor_receiver_0_data_if_rx_clk_p    (<connected-to-spin_sensor_receiver_0_data_if_rx_clk_p>),    //      spin_sensor_receiver_0_data_if.rx_clk_p
		.spin_sensor_receiver_0_data_if_frame_p     (<connected-to-spin_sensor_receiver_0_data_if_frame_p>),     //                                    .frame_p
		.spin_sensor_receiver_0_data_if_data_p      (<connected-to-spin_sensor_receiver_0_data_if_data_p>),      //                                    .data_p
		.spin_sensor_receiver_0_data_if_data_n      (<connected-to-spin_sensor_receiver_0_data_if_data_n>),      //                                    .data_n
		.spin_sensor_receiver_0_data_if_frame_n     (<connected-to-spin_sensor_receiver_0_data_if_frame_n>),     //                                    .frame_n
		.spin_sensor_receiver_0_data_if_rx_clk_n    (<connected-to-spin_sensor_receiver_0_data_if_rx_clk_n>),    //                                    .rx_clk_n
		.spin_sensor_receiver_0_data_if_tc_clk      (<connected-to-spin_sensor_receiver_0_data_if_tc_clk>),      //                                    .tc_clk
		.spin_sensor_receiver_0_data_if_tx_clk      (<connected-to-spin_sensor_receiver_0_data_if_tx_clk>),      //                                    .tx_clk
		.spin_sensor_receiver_0_s_axi_awvalid       (<connected-to-spin_sensor_receiver_0_s_axi_awvalid>),       //        spin_sensor_receiver_0_s_axi.awvalid
		.spin_sensor_receiver_0_s_axi_awaddr        (<connected-to-spin_sensor_receiver_0_s_axi_awaddr>),        //                                    .awaddr
		.spin_sensor_receiver_0_s_axi_awprot        (<connected-to-spin_sensor_receiver_0_s_axi_awprot>),        //                                    .awprot
		.spin_sensor_receiver_0_s_axi_awready       (<connected-to-spin_sensor_receiver_0_s_axi_awready>),       //                                    .awready
		.spin_sensor_receiver_0_s_axi_wvalid        (<connected-to-spin_sensor_receiver_0_s_axi_wvalid>),        //                                    .wvalid
		.spin_sensor_receiver_0_s_axi_wdata         (<connected-to-spin_sensor_receiver_0_s_axi_wdata>),         //                                    .wdata
		.spin_sensor_receiver_0_s_axi_wstrb         (<connected-to-spin_sensor_receiver_0_s_axi_wstrb>),         //                                    .wstrb
		.spin_sensor_receiver_0_s_axi_wready        (<connected-to-spin_sensor_receiver_0_s_axi_wready>),        //                                    .wready
		.spin_sensor_receiver_0_s_axi_bvalid        (<connected-to-spin_sensor_receiver_0_s_axi_bvalid>),        //                                    .bvalid
		.spin_sensor_receiver_0_s_axi_bresp         (<connected-to-spin_sensor_receiver_0_s_axi_bresp>),         //                                    .bresp
		.spin_sensor_receiver_0_s_axi_bready        (<connected-to-spin_sensor_receiver_0_s_axi_bready>),        //                                    .bready
		.spin_sensor_receiver_0_s_axi_arvalid       (<connected-to-spin_sensor_receiver_0_s_axi_arvalid>),       //                                    .arvalid
		.spin_sensor_receiver_0_s_axi_araddr        (<connected-to-spin_sensor_receiver_0_s_axi_araddr>),        //                                    .araddr
		.spin_sensor_receiver_0_s_axi_arprot        (<connected-to-spin_sensor_receiver_0_s_axi_arprot>),        //                                    .arprot
		.spin_sensor_receiver_0_s_axi_arready       (<connected-to-spin_sensor_receiver_0_s_axi_arready>),       //                                    .arready
		.spin_sensor_receiver_0_s_axi_rvalid        (<connected-to-spin_sensor_receiver_0_s_axi_rvalid>),        //                                    .rvalid
		.spin_sensor_receiver_0_s_axi_rdata         (<connected-to-spin_sensor_receiver_0_s_axi_rdata>),         //                                    .rdata
		.spin_sensor_receiver_0_s_axi_rresp         (<connected-to-spin_sensor_receiver_0_s_axi_rresp>),         //                                    .rresp
		.spin_sensor_receiver_0_s_axi_rready        (<connected-to-spin_sensor_receiver_0_s_axi_rready>),        //                                    .rready
		.spin_sensor_receiver_0_reset_source_reset  (<connected-to-spin_sensor_receiver_0_reset_source_reset>)   // spin_sensor_receiver_0_reset_source.reset
	);

