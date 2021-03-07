
module sensor_reader (
	reset_reset_n,
	clk_clk,
	spin_sensor_receiver_0_iq_data_out_re_data,
	spin_sensor_receiver_0_iq_data_out_im_data,
	spin_sensor_receiver_0_data_if_rx_clk_p,
	spin_sensor_receiver_0_data_if_frame_p,
	spin_sensor_receiver_0_data_if_data_p,
	spin_sensor_receiver_0_data_if_data_n,
	spin_sensor_receiver_0_data_if_frame_n,
	spin_sensor_receiver_0_data_if_rx_clk_n,
	spin_sensor_receiver_0_data_if_tc_clk,
	spin_sensor_receiver_0_data_if_tx_clk,
	spin_sensor_receiver_0_s_axi_awvalid,
	spin_sensor_receiver_0_s_axi_awaddr,
	spin_sensor_receiver_0_s_axi_awprot,
	spin_sensor_receiver_0_s_axi_awready,
	spin_sensor_receiver_0_s_axi_wvalid,
	spin_sensor_receiver_0_s_axi_wdata,
	spin_sensor_receiver_0_s_axi_wstrb,
	spin_sensor_receiver_0_s_axi_wready,
	spin_sensor_receiver_0_s_axi_bvalid,
	spin_sensor_receiver_0_s_axi_bresp,
	spin_sensor_receiver_0_s_axi_bready,
	spin_sensor_receiver_0_s_axi_arvalid,
	spin_sensor_receiver_0_s_axi_araddr,
	spin_sensor_receiver_0_s_axi_arprot,
	spin_sensor_receiver_0_s_axi_arready,
	spin_sensor_receiver_0_s_axi_rvalid,
	spin_sensor_receiver_0_s_axi_rdata,
	spin_sensor_receiver_0_s_axi_rresp,
	spin_sensor_receiver_0_s_axi_rready,
	spin_sensor_receiver_0_reset_source_reset);	

	input		reset_reset_n;
	input		clk_clk;
	output	[11:0]	spin_sensor_receiver_0_iq_data_out_re_data;
	output	[11:0]	spin_sensor_receiver_0_iq_data_out_im_data;
	input		spin_sensor_receiver_0_data_if_rx_clk_p;
	input		spin_sensor_receiver_0_data_if_frame_p;
	input	[5:0]	spin_sensor_receiver_0_data_if_data_p;
	input	[5:0]	spin_sensor_receiver_0_data_if_data_n;
	input		spin_sensor_receiver_0_data_if_frame_n;
	input		spin_sensor_receiver_0_data_if_rx_clk_n;
	output		spin_sensor_receiver_0_data_if_tc_clk;
	output		spin_sensor_receiver_0_data_if_tx_clk;
	input		spin_sensor_receiver_0_s_axi_awvalid;
	input	[15:0]	spin_sensor_receiver_0_s_axi_awaddr;
	input	[2:0]	spin_sensor_receiver_0_s_axi_awprot;
	output		spin_sensor_receiver_0_s_axi_awready;
	input		spin_sensor_receiver_0_s_axi_wvalid;
	input	[31:0]	spin_sensor_receiver_0_s_axi_wdata;
	input	[3:0]	spin_sensor_receiver_0_s_axi_wstrb;
	output		spin_sensor_receiver_0_s_axi_wready;
	output		spin_sensor_receiver_0_s_axi_bvalid;
	output	[1:0]	spin_sensor_receiver_0_s_axi_bresp;
	input		spin_sensor_receiver_0_s_axi_bready;
	input		spin_sensor_receiver_0_s_axi_arvalid;
	input	[15:0]	spin_sensor_receiver_0_s_axi_araddr;
	input	[2:0]	spin_sensor_receiver_0_s_axi_arprot;
	output		spin_sensor_receiver_0_s_axi_arready;
	output		spin_sensor_receiver_0_s_axi_rvalid;
	output	[31:0]	spin_sensor_receiver_0_s_axi_rdata;
	output	[1:0]	spin_sensor_receiver_0_s_axi_rresp;
	input		spin_sensor_receiver_0_s_axi_rready;
	output		spin_sensor_receiver_0_reset_source_reset;
endmodule
