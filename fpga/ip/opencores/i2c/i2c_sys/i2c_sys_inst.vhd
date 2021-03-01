	component i2c_sys is
		port (
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_o    : out std_logic;        -- scl_pad_o
			bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o : out std_logic;        -- scl_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_i    : in  std_logic := 'X'; -- sda_pad_i
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_o    : out std_logic;        -- sda_pad_o
			bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o : out std_logic;        -- sda_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_arst_i       : in  std_logic := 'X'; -- arst_i
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_i    : in  std_logic := 'X'; -- scl_pad_i
			clk_clk                                          : in  std_logic := 'X'; -- clk
			reset_reset_n                                    : in  std_logic := 'X'; -- reset_n
			bladerf_oc_i2c_master_0_interrupt_sender_irq     : out std_logic         -- irq
		);
	end component i2c_sys;

	u0 : component i2c_sys
		port map (
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_o    => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_pad_o,    --      bladerf_oc_i2c_master_0_conduit_end.scl_pad_o
			bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o, --                                         .scl_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_i    => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_pad_i,    --                                         .sda_pad_i
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_o    => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_pad_o,    --                                         .sda_pad_o
			bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o, --                                         .sda_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_arst_i       => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_arst_i,       --                                         .arst_i
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_i    => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_pad_i,    --                                         .scl_pad_i
			clk_clk                                          => CONNECTED_TO_clk_clk,                                          --                                      clk.clk
			reset_reset_n                                    => CONNECTED_TO_reset_reset_n,                                    --                                    reset.reset_n
			bladerf_oc_i2c_master_0_interrupt_sender_irq     => CONNECTED_TO_bladerf_oc_i2c_master_0_interrupt_sender_irq      -- bladerf_oc_i2c_master_0_interrupt_sender.irq
		);

