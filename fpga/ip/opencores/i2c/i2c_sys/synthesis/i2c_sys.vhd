-- i2c_sys.vhd

-- Generated using ACDS version 20.1 711

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity i2c_sys is
	port (
		bladerf_oc_i2c_master_0_conduit_end_scl_pad_o    : out std_logic;        --      bladerf_oc_i2c_master_0_conduit_end.scl_pad_o
		bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o : out std_logic;        --                                         .scl_padoen_o
		bladerf_oc_i2c_master_0_conduit_end_sda_pad_i    : in  std_logic := '0'; --                                         .sda_pad_i
		bladerf_oc_i2c_master_0_conduit_end_sda_pad_o    : out std_logic;        --                                         .sda_pad_o
		bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o : out std_logic;        --                                         .sda_padoen_o
		bladerf_oc_i2c_master_0_conduit_end_arst_i       : in  std_logic := '0'; --                                         .arst_i
		bladerf_oc_i2c_master_0_conduit_end_scl_pad_i    : in  std_logic := '0'; --                                         .scl_pad_i
		bladerf_oc_i2c_master_0_interrupt_sender_irq     : out std_logic;        -- bladerf_oc_i2c_master_0_interrupt_sender.irq
		clk_clk                                          : in  std_logic := '0'; --                                      clk.clk
		reset_reset_n                                    : in  std_logic := '0'  --                                    reset.reset_n
	);
end entity i2c_sys;

architecture rtl of i2c_sys is
	component i2c_master_top is
		generic (
			ARST_LVL : integer := 0
		);
		port (
			wb_clk_i     : in  std_logic                    := 'X';             -- clk
			wb_rst_i     : in  std_logic                    := 'X';             -- reset
			scl_pad_o    : out std_logic;                                       -- scl_pad_o
			scl_padoen_o : out std_logic;                                       -- scl_padoen_o
			sda_pad_i    : in  std_logic                    := 'X';             -- sda_pad_i
			sda_pad_o    : out std_logic;                                       -- sda_pad_o
			sda_padoen_o : out std_logic;                                       -- sda_padoen_o
			arst_i       : in  std_logic                    := 'X';             -- arst_i
			scl_pad_i    : in  std_logic                    := 'X';             -- scl_pad_i
			wb_inta_o    : out std_logic;                                       -- irq
			wb_dat_i     : in  std_logic_vector(7 downto 0) := (others => 'X'); -- writedata
			wb_dat_o     : out std_logic_vector(7 downto 0);                    -- readdata
			wb_we_i      : in  std_logic                    := 'X';             -- write
			wb_stb_i     : in  std_logic                    := 'X';             -- byteenable
			wb_cyc_i     : in  std_logic                    := 'X';             -- chipselect
			wb_ack_o     : out std_logic;                                       -- waitrequest_n
			wb_adr_i     : in  std_logic_vector(2 downto 0) := (others => 'X')  -- address
		);
	end component i2c_master_top;

	component altera_reset_controller is
		generic (
			NUM_RESET_INPUTS          : integer := 6;
			OUTPUT_RESET_SYNC_EDGES   : string  := "deassert";
			SYNC_DEPTH                : integer := 2;
			RESET_REQUEST_PRESENT     : integer := 0;
			RESET_REQ_WAIT_TIME       : integer := 1;
			MIN_RST_ASSERTION_TIME    : integer := 3;
			RESET_REQ_EARLY_DSRT_TIME : integer := 1;
			USE_RESET_REQUEST_IN0     : integer := 0;
			USE_RESET_REQUEST_IN1     : integer := 0;
			USE_RESET_REQUEST_IN2     : integer := 0;
			USE_RESET_REQUEST_IN3     : integer := 0;
			USE_RESET_REQUEST_IN4     : integer := 0;
			USE_RESET_REQUEST_IN5     : integer := 0;
			USE_RESET_REQUEST_IN6     : integer := 0;
			USE_RESET_REQUEST_IN7     : integer := 0;
			USE_RESET_REQUEST_IN8     : integer := 0;
			USE_RESET_REQUEST_IN9     : integer := 0;
			USE_RESET_REQUEST_IN10    : integer := 0;
			USE_RESET_REQUEST_IN11    : integer := 0;
			USE_RESET_REQUEST_IN12    : integer := 0;
			USE_RESET_REQUEST_IN13    : integer := 0;
			USE_RESET_REQUEST_IN14    : integer := 0;
			USE_RESET_REQUEST_IN15    : integer := 0;
			ADAPT_RESET_REQUEST       : integer := 0
		);
		port (
			reset_in0      : in  std_logic := 'X'; -- reset
			clk            : in  std_logic := 'X'; -- clk
			reset_out      : out std_logic;        -- reset
			reset_req      : out std_logic;        -- reset_req
			reset_req_in0  : in  std_logic := 'X'; -- reset_req
			reset_in1      : in  std_logic := 'X'; -- reset
			reset_req_in1  : in  std_logic := 'X'; -- reset_req
			reset_in2      : in  std_logic := 'X'; -- reset
			reset_req_in2  : in  std_logic := 'X'; -- reset_req
			reset_in3      : in  std_logic := 'X'; -- reset
			reset_req_in3  : in  std_logic := 'X'; -- reset_req
			reset_in4      : in  std_logic := 'X'; -- reset
			reset_req_in4  : in  std_logic := 'X'; -- reset_req
			reset_in5      : in  std_logic := 'X'; -- reset
			reset_req_in5  : in  std_logic := 'X'; -- reset_req
			reset_in6      : in  std_logic := 'X'; -- reset
			reset_req_in6  : in  std_logic := 'X'; -- reset_req
			reset_in7      : in  std_logic := 'X'; -- reset
			reset_req_in7  : in  std_logic := 'X'; -- reset_req
			reset_in8      : in  std_logic := 'X'; -- reset
			reset_req_in8  : in  std_logic := 'X'; -- reset_req
			reset_in9      : in  std_logic := 'X'; -- reset
			reset_req_in9  : in  std_logic := 'X'; -- reset_req
			reset_in10     : in  std_logic := 'X'; -- reset
			reset_req_in10 : in  std_logic := 'X'; -- reset_req
			reset_in11     : in  std_logic := 'X'; -- reset
			reset_req_in11 : in  std_logic := 'X'; -- reset_req
			reset_in12     : in  std_logic := 'X'; -- reset
			reset_req_in12 : in  std_logic := 'X'; -- reset_req
			reset_in13     : in  std_logic := 'X'; -- reset
			reset_req_in13 : in  std_logic := 'X'; -- reset_req
			reset_in14     : in  std_logic := 'X'; -- reset
			reset_req_in14 : in  std_logic := 'X'; -- reset_req
			reset_in15     : in  std_logic := 'X'; -- reset
			reset_req_in15 : in  std_logic := 'X'  -- reset_req
		);
	end component altera_reset_controller;

	signal rst_controller_reset_out_reset : std_logic; -- rst_controller:reset_out -> bladerf_oc_i2c_master_0:wb_rst_i
	signal reset_reset_n_ports_inv        : std_logic; -- reset_reset_n:inv -> rst_controller:reset_in0

begin

	bladerf_oc_i2c_master_0 : component i2c_master_top
		generic map (
			ARST_LVL => 1
		)
		port map (
			wb_clk_i     => clk_clk,                                          --            clock_sink.clk
			wb_rst_i     => rst_controller_reset_out_reset,                   --            reset_sink.reset
			scl_pad_o    => bladerf_oc_i2c_master_0_conduit_end_scl_pad_o,    --           conduit_end.scl_pad_o
			scl_padoen_o => bladerf_oc_i2c_master_0_conduit_end_scl_padoen_o, --                      .scl_padoen_o
			sda_pad_i    => bladerf_oc_i2c_master_0_conduit_end_sda_pad_i,    --                      .sda_pad_i
			sda_pad_o    => bladerf_oc_i2c_master_0_conduit_end_sda_pad_o,    --                      .sda_pad_o
			sda_padoen_o => bladerf_oc_i2c_master_0_conduit_end_sda_padoen_o, --                      .sda_padoen_o
			arst_i       => bladerf_oc_i2c_master_0_conduit_end_arst_i,       --                      .arst_i
			scl_pad_i    => bladerf_oc_i2c_master_0_conduit_end_scl_pad_i,    --                      .scl_pad_i
			wb_inta_o    => bladerf_oc_i2c_master_0_interrupt_sender_irq,     --      interrupt_sender.irq
			wb_dat_i     => open,                                             -- bladerf_oc_i2c_master.writedata
			wb_dat_o     => open,                                             --                      .readdata
			wb_we_i      => open,                                             --                      .write
			wb_stb_i     => open,                                             --                      .byteenable
			wb_cyc_i     => open,                                             --                      .chipselect
			wb_ack_o     => open,                                             --                      .waitrequest_n
			wb_adr_i     => open                                              --                      .address
		);

	rst_controller : component altera_reset_controller
		generic map (
			NUM_RESET_INPUTS          => 1,
			OUTPUT_RESET_SYNC_EDGES   => "deassert",
			SYNC_DEPTH                => 2,
			RESET_REQUEST_PRESENT     => 0,
			RESET_REQ_WAIT_TIME       => 1,
			MIN_RST_ASSERTION_TIME    => 3,
			RESET_REQ_EARLY_DSRT_TIME => 1,
			USE_RESET_REQUEST_IN0     => 0,
			USE_RESET_REQUEST_IN1     => 0,
			USE_RESET_REQUEST_IN2     => 0,
			USE_RESET_REQUEST_IN3     => 0,
			USE_RESET_REQUEST_IN4     => 0,
			USE_RESET_REQUEST_IN5     => 0,
			USE_RESET_REQUEST_IN6     => 0,
			USE_RESET_REQUEST_IN7     => 0,
			USE_RESET_REQUEST_IN8     => 0,
			USE_RESET_REQUEST_IN9     => 0,
			USE_RESET_REQUEST_IN10    => 0,
			USE_RESET_REQUEST_IN11    => 0,
			USE_RESET_REQUEST_IN12    => 0,
			USE_RESET_REQUEST_IN13    => 0,
			USE_RESET_REQUEST_IN14    => 0,
			USE_RESET_REQUEST_IN15    => 0,
			ADAPT_RESET_REQUEST       => 0
		)
		port map (
			reset_in0      => reset_reset_n_ports_inv,        -- reset_in0.reset
			clk            => clk_clk,                        --       clk.clk
			reset_out      => rst_controller_reset_out_reset, -- reset_out.reset
			reset_req      => open,                           -- (terminated)
			reset_req_in0  => '0',                            -- (terminated)
			reset_in1      => '0',                            -- (terminated)
			reset_req_in1  => '0',                            -- (terminated)
			reset_in2      => '0',                            -- (terminated)
			reset_req_in2  => '0',                            -- (terminated)
			reset_in3      => '0',                            -- (terminated)
			reset_req_in3  => '0',                            -- (terminated)
			reset_in4      => '0',                            -- (terminated)
			reset_req_in4  => '0',                            -- (terminated)
			reset_in5      => '0',                            -- (terminated)
			reset_req_in5  => '0',                            -- (terminated)
			reset_in6      => '0',                            -- (terminated)
			reset_req_in6  => '0',                            -- (terminated)
			reset_in7      => '0',                            -- (terminated)
			reset_req_in7  => '0',                            -- (terminated)
			reset_in8      => '0',                            -- (terminated)
			reset_req_in8  => '0',                            -- (terminated)
			reset_in9      => '0',                            -- (terminated)
			reset_req_in9  => '0',                            -- (terminated)
			reset_in10     => '0',                            -- (terminated)
			reset_req_in10 => '0',                            -- (terminated)
			reset_in11     => '0',                            -- (terminated)
			reset_req_in11 => '0',                            -- (terminated)
			reset_in12     => '0',                            -- (terminated)
			reset_req_in12 => '0',                            -- (terminated)
			reset_in13     => '0',                            -- (terminated)
			reset_req_in13 => '0',                            -- (terminated)
			reset_in14     => '0',                            -- (terminated)
			reset_req_in14 => '0',                            -- (terminated)
			reset_in15     => '0',                            -- (terminated)
			reset_req_in15 => '0'                             -- (terminated)
		);

	reset_reset_n_ports_inv <= not reset_reset_n;

end architecture rtl; -- of i2c_sys