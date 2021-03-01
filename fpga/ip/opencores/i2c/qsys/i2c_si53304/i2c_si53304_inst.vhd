	component i2c_si53304 is
		port (
			bladerf_oc_i2c_master_0_clock_sink_clk           : in  std_logic := 'X'; -- clk
			bladerf_oc_i2c_master_0_reset_sink_reset         : in  std_logic := 'X'; -- reset
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_o    : out std_logic;        -- scl_pad_o
			bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o : out std_logic;        -- scl_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_i    : in  std_logic := 'X'; -- sda_pad_i
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_o    : out std_logic;        -- sda_pad_o
			bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o : out std_logic;        -- sda_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_arst_i       : in  std_logic := 'X'; -- arst_i
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_i    : in  std_logic := 'X'  -- scl_pad_i
		);
	end component i2c_si53304;

	u0 : component i2c_si53304
		port map (
			bladerf_oc_i2c_master_0_clock_sink_clk           => CONNECTED_TO_bladerf_oc_i2c_master_0_clock_sink_clk,           --  bladerf_oc_i2c_master_0_clock_sink.clk
			bladerf_oc_i2c_master_0_reset_sink_reset         => CONNECTED_TO_bladerf_oc_i2c_master_0_reset_sink_reset,         --  bladerf_oc_i2c_master_0_reset_sink.reset
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_o    => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_pad_o,    -- bladerf_oc_i2c_master_0_conduit_end.scl_pad_o
			bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o, --                                    .scl_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_i    => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_pad_i,    --                                    .sda_pad_i
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_o    => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_pad_o,    --                                    .sda_pad_o
			bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o, --                                    .sda_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_arst_i       => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_arst_i,       --                                    .arst_i
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_i    => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_pad_i     --                                    .scl_pad_i
		);

