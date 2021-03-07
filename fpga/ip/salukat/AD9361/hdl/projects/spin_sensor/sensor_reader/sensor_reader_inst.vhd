	component sensor_reader is
		port (
			reset_reset_n                              : in  std_logic                     := 'X';             -- reset_n
			clk_clk                                    : in  std_logic                     := 'X';             -- clk
			spin_sensor_receiver_0_iq_data_out_re_data : out std_logic_vector(11 downto 0);                    -- re_data
			spin_sensor_receiver_0_iq_data_out_im_data : out std_logic_vector(11 downto 0);                    -- im_data
			spin_sensor_receiver_0_data_if_rx_clk_p    : in  std_logic                     := 'X';             -- rx_clk_p
			spin_sensor_receiver_0_data_if_frame_p     : in  std_logic                     := 'X';             -- frame_p
			spin_sensor_receiver_0_data_if_data_p      : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- data_p
			spin_sensor_receiver_0_data_if_data_n      : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- data_n
			spin_sensor_receiver_0_data_if_frame_n     : in  std_logic                     := 'X';             -- frame_n
			spin_sensor_receiver_0_data_if_rx_clk_n    : in  std_logic                     := 'X';             -- rx_clk_n
			spin_sensor_receiver_0_data_if_tc_clk      : out std_logic;                                        -- tc_clk
			spin_sensor_receiver_0_data_if_tx_clk      : out std_logic;                                        -- tx_clk
			spin_sensor_receiver_0_s_axi_awvalid       : in  std_logic                     := 'X';             -- awvalid
			spin_sensor_receiver_0_s_axi_awaddr        : in  std_logic_vector(15 downto 0) := (others => 'X'); -- awaddr
			spin_sensor_receiver_0_s_axi_awprot        : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- awprot
			spin_sensor_receiver_0_s_axi_awready       : out std_logic;                                        -- awready
			spin_sensor_receiver_0_s_axi_wvalid        : in  std_logic                     := 'X';             -- wvalid
			spin_sensor_receiver_0_s_axi_wdata         : in  std_logic_vector(31 downto 0) := (others => 'X'); -- wdata
			spin_sensor_receiver_0_s_axi_wstrb         : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- wstrb
			spin_sensor_receiver_0_s_axi_wready        : out std_logic;                                        -- wready
			spin_sensor_receiver_0_s_axi_bvalid        : out std_logic;                                        -- bvalid
			spin_sensor_receiver_0_s_axi_bresp         : out std_logic_vector(1 downto 0);                     -- bresp
			spin_sensor_receiver_0_s_axi_bready        : in  std_logic                     := 'X';             -- bready
			spin_sensor_receiver_0_s_axi_arvalid       : in  std_logic                     := 'X';             -- arvalid
			spin_sensor_receiver_0_s_axi_araddr        : in  std_logic_vector(15 downto 0) := (others => 'X'); -- araddr
			spin_sensor_receiver_0_s_axi_arprot        : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- arprot
			spin_sensor_receiver_0_s_axi_arready       : out std_logic;                                        -- arready
			spin_sensor_receiver_0_s_axi_rvalid        : out std_logic;                                        -- rvalid
			spin_sensor_receiver_0_s_axi_rdata         : out std_logic_vector(31 downto 0);                    -- rdata
			spin_sensor_receiver_0_s_axi_rresp         : out std_logic_vector(1 downto 0);                     -- rresp
			spin_sensor_receiver_0_s_axi_rready        : in  std_logic                     := 'X';             -- rready
			spin_sensor_receiver_0_reset_source_reset  : out std_logic                                         -- reset
		);
	end component sensor_reader;

	u0 : component sensor_reader
		port map (
			reset_reset_n                              => CONNECTED_TO_reset_reset_n,                              --                               reset.reset_n
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --                                 clk.clk
			spin_sensor_receiver_0_iq_data_out_re_data => CONNECTED_TO_spin_sensor_receiver_0_iq_data_out_re_data, --  spin_sensor_receiver_0_iq_data_out.re_data
			spin_sensor_receiver_0_iq_data_out_im_data => CONNECTED_TO_spin_sensor_receiver_0_iq_data_out_im_data, --                                    .im_data
			spin_sensor_receiver_0_data_if_rx_clk_p    => CONNECTED_TO_spin_sensor_receiver_0_data_if_rx_clk_p,    --      spin_sensor_receiver_0_data_if.rx_clk_p
			spin_sensor_receiver_0_data_if_frame_p     => CONNECTED_TO_spin_sensor_receiver_0_data_if_frame_p,     --                                    .frame_p
			spin_sensor_receiver_0_data_if_data_p      => CONNECTED_TO_spin_sensor_receiver_0_data_if_data_p,      --                                    .data_p
			spin_sensor_receiver_0_data_if_data_n      => CONNECTED_TO_spin_sensor_receiver_0_data_if_data_n,      --                                    .data_n
			spin_sensor_receiver_0_data_if_frame_n     => CONNECTED_TO_spin_sensor_receiver_0_data_if_frame_n,     --                                    .frame_n
			spin_sensor_receiver_0_data_if_rx_clk_n    => CONNECTED_TO_spin_sensor_receiver_0_data_if_rx_clk_n,    --                                    .rx_clk_n
			spin_sensor_receiver_0_data_if_tc_clk      => CONNECTED_TO_spin_sensor_receiver_0_data_if_tc_clk,      --                                    .tc_clk
			spin_sensor_receiver_0_data_if_tx_clk      => CONNECTED_TO_spin_sensor_receiver_0_data_if_tx_clk,      --                                    .tx_clk
			spin_sensor_receiver_0_s_axi_awvalid       => CONNECTED_TO_spin_sensor_receiver_0_s_axi_awvalid,       --        spin_sensor_receiver_0_s_axi.awvalid
			spin_sensor_receiver_0_s_axi_awaddr        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_awaddr,        --                                    .awaddr
			spin_sensor_receiver_0_s_axi_awprot        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_awprot,        --                                    .awprot
			spin_sensor_receiver_0_s_axi_awready       => CONNECTED_TO_spin_sensor_receiver_0_s_axi_awready,       --                                    .awready
			spin_sensor_receiver_0_s_axi_wvalid        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_wvalid,        --                                    .wvalid
			spin_sensor_receiver_0_s_axi_wdata         => CONNECTED_TO_spin_sensor_receiver_0_s_axi_wdata,         --                                    .wdata
			spin_sensor_receiver_0_s_axi_wstrb         => CONNECTED_TO_spin_sensor_receiver_0_s_axi_wstrb,         --                                    .wstrb
			spin_sensor_receiver_0_s_axi_wready        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_wready,        --                                    .wready
			spin_sensor_receiver_0_s_axi_bvalid        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_bvalid,        --                                    .bvalid
			spin_sensor_receiver_0_s_axi_bresp         => CONNECTED_TO_spin_sensor_receiver_0_s_axi_bresp,         --                                    .bresp
			spin_sensor_receiver_0_s_axi_bready        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_bready,        --                                    .bready
			spin_sensor_receiver_0_s_axi_arvalid       => CONNECTED_TO_spin_sensor_receiver_0_s_axi_arvalid,       --                                    .arvalid
			spin_sensor_receiver_0_s_axi_araddr        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_araddr,        --                                    .araddr
			spin_sensor_receiver_0_s_axi_arprot        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_arprot,        --                                    .arprot
			spin_sensor_receiver_0_s_axi_arready       => CONNECTED_TO_spin_sensor_receiver_0_s_axi_arready,       --                                    .arready
			spin_sensor_receiver_0_s_axi_rvalid        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_rvalid,        --                                    .rvalid
			spin_sensor_receiver_0_s_axi_rdata         => CONNECTED_TO_spin_sensor_receiver_0_s_axi_rdata,         --                                    .rdata
			spin_sensor_receiver_0_s_axi_rresp         => CONNECTED_TO_spin_sensor_receiver_0_s_axi_rresp,         --                                    .rresp
			spin_sensor_receiver_0_s_axi_rready        => CONNECTED_TO_spin_sensor_receiver_0_s_axi_rready,        --                                    .rready
			spin_sensor_receiver_0_reset_source_reset  => CONNECTED_TO_spin_sensor_receiver_0_reset_source_reset   -- spin_sensor_receiver_0_reset_source.reset
		);

