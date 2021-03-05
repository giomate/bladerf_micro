	component i2c_sys is
		port (
			bladerf_oc_i2c_master_0_clock_sink_clk                      : in  std_logic                    := 'X';             -- clk
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_o               : out std_logic;                                       -- scl_pad_o
			bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o            : out std_logic;                                       -- scl_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_i               : in  std_logic                    := 'X';             -- sda_pad_i
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_o               : out std_logic;                                       -- sda_pad_o
			bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o            : out std_logic;                                       -- sda_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_arst_i                  : in  std_logic                    := 'X';             -- arst_i
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_i               : in  std_logic                    := 'X';             -- scl_pad_i
			bladerf_oc_i2c_master_0_interrupt_sender_irq                : out std_logic;                                       -- irq
			bladerf_oc_i2c_master_0_reset_sink_reset                    : in  std_logic                    := 'X';             -- reset
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_writedata     : in  std_logic_vector(7 downto 0) := (others => 'X'); -- writedata
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_readdata      : out std_logic_vector(7 downto 0);                    -- readdata
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_write         : in  std_logic                    := 'X';             -- write
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_byteenable    : in  std_logic                    := 'X';             -- byteenable
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_chipselect    : in  std_logic                    := 'X';             -- chipselect
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_waitrequest_n : out std_logic;                                       -- waitrequest_n
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_address       : in  std_logic_vector(2 downto 0) := (others => 'X')  -- address
		);
	end component i2c_sys;

	u0 : component i2c_sys
		port map (
			bladerf_oc_i2c_master_0_clock_sink_clk                      => CONNECTED_TO_bladerf_oc_i2c_master_0_clock_sink_clk,                      --            bladerf_oc_i2c_master_0_clock_sink.clk
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_o               => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_pad_o,               --           bladerf_oc_i2c_master_0_conduit_end.scl_pad_o
			bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o            => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o,            --                                              .scl_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_i               => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_pad_i,               --                                              .sda_pad_i
			bladerf_oc_i2c_master_0_conduit_end_sda_pad_o               => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_pad_o,               --                                              .sda_pad_o
			bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o            => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o,            --                                              .sda_padoen_o
			bladerf_oc_i2c_master_0_conduit_end_arst_i                  => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_arst_i,                  --                                              .arst_i
			bladerf_oc_i2c_master_0_conduit_end_scl_pad_i               => CONNECTED_TO_bladerf_oc_i2c_master_0_conduit_end_scl_pad_i,               --                                              .scl_pad_i
			bladerf_oc_i2c_master_0_interrupt_sender_irq                => CONNECTED_TO_bladerf_oc_i2c_master_0_interrupt_sender_irq,                --      bladerf_oc_i2c_master_0_interrupt_sender.irq
			bladerf_oc_i2c_master_0_reset_sink_reset                    => CONNECTED_TO_bladerf_oc_i2c_master_0_reset_sink_reset,                    --            bladerf_oc_i2c_master_0_reset_sink.reset
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_writedata     => CONNECTED_TO_bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_writedata,     -- bladerf_oc_i2c_master_0_bladerf_oc_i2c_master.writedata
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_readdata      => CONNECTED_TO_bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_readdata,      --                                              .readdata
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_write         => CONNECTED_TO_bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_write,         --                                              .write
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_byteenable    => CONNECTED_TO_bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_byteenable,    --                                              .byteenable
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_chipselect    => CONNECTED_TO_bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_chipselect,    --                                              .chipselect
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_waitrequest_n => CONNECTED_TO_bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_waitrequest_n, --                                              .waitrequest_n
			bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_address       => CONNECTED_TO_bladerf_oc_i2c_master_0_bladerf_oc_i2c_master_address        --                                              .address
		);

