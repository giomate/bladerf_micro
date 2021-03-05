	component nios_cpu is
		port (
			clk_clk             : in  std_logic                     := 'X';             -- clk
			dac_MISO            : in  std_logic                     := 'X';             -- MISO
			dac_MOSI            : out std_logic;                                        -- MOSI
			dac_SCLK            : out std_logic;                                        -- SCLK
			dac_SS_n            : out std_logic_vector(1 downto 0);                     -- SS_n
			gpio_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			gpio_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			gpio_rf_in_port     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			gpio_rf_out_port    : out std_logic_vector(31 downto 0);                    -- out_port
			oc_i2c_scl_pad_o    : out std_logic;                                        -- scl_pad_o
			oc_i2c_scl_padoen_o : out std_logic;                                        -- scl_padoen_o
			oc_i2c_sda_pad_i    : in  std_logic                     := 'X';             -- sda_pad_i
			oc_i2c_sda_pad_o    : out std_logic;                                        -- sda_pad_o
			oc_i2c_sda_padoen_o : out std_logic;                                        -- sda_padoen_o
			oc_i2c_arst_i       : in  std_logic                     := 'X';             -- arst_i
			oc_i2c_scl_pad_i    : in  std_logic                     := 'X';             -- scl_pad_i
			pll_MISO            : in  std_logic                     := 'X';             -- MISO
			pll_MOSI            : out std_logic;                                        -- MOSI
			pll_SCLK            : out std_logic;                                        -- SCLK
			pll_SS_n            : out std_logic;                                        -- SS_n
			reset_reset_n       : in  std_logic                     := 'X';             -- reset_n
			xb_gpios_export     : in  std_logic_vector(7 downto 0)  := (others => 'X')  -- export
		);
	end component nios_cpu;

	u0 : component nios_cpu
		port map (
			clk_clk             => CONNECTED_TO_clk_clk,             --      clk.clk
			dac_MISO            => CONNECTED_TO_dac_MISO,            --      dac.MISO
			dac_MOSI            => CONNECTED_TO_dac_MOSI,            --         .MOSI
			dac_SCLK            => CONNECTED_TO_dac_SCLK,            --         .SCLK
			dac_SS_n            => CONNECTED_TO_dac_SS_n,            --         .SS_n
			gpio_in_port        => CONNECTED_TO_gpio_in_port,        --     gpio.in_port
			gpio_out_port       => CONNECTED_TO_gpio_out_port,       --         .out_port
			gpio_rf_in_port     => CONNECTED_TO_gpio_rf_in_port,     --  gpio_rf.in_port
			gpio_rf_out_port    => CONNECTED_TO_gpio_rf_out_port,    --         .out_port
			oc_i2c_scl_pad_o    => CONNECTED_TO_oc_i2c_scl_pad_o,    --   oc_i2c.scl_pad_o
			oc_i2c_scl_padoen_o => CONNECTED_TO_oc_i2c_scl_padoen_o, --         .scl_padoen_o
			oc_i2c_sda_pad_i    => CONNECTED_TO_oc_i2c_sda_pad_i,    --         .sda_pad_i
			oc_i2c_sda_pad_o    => CONNECTED_TO_oc_i2c_sda_pad_o,    --         .sda_pad_o
			oc_i2c_sda_padoen_o => CONNECTED_TO_oc_i2c_sda_padoen_o, --         .sda_padoen_o
			oc_i2c_arst_i       => CONNECTED_TO_oc_i2c_arst_i,       --         .arst_i
			oc_i2c_scl_pad_i    => CONNECTED_TO_oc_i2c_scl_pad_i,    --         .scl_pad_i
			pll_MISO            => CONNECTED_TO_pll_MISO,            --      pll.MISO
			pll_MOSI            => CONNECTED_TO_pll_MOSI,            --         .MOSI
			pll_SCLK            => CONNECTED_TO_pll_SCLK,            --         .SCLK
			pll_SS_n            => CONNECTED_TO_pll_SS_n,            --         .SS_n
			reset_reset_n       => CONNECTED_TO_reset_reset_n,       --    reset.reset_n
			xb_gpios_export     => CONNECTED_TO_xb_gpios_export      -- xb_gpios.export
		);

