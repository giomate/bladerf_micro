library ieee ;
    use ieee.std_logic_1164.all ;
    use ieee.numeric_std.all ;
    use ieee.math_real.all ;
    use ieee.math_complex.all ;
	 
library work;
     use work.bladerf_p.all;
	   use work.fifo_readwrite_p.all;



entity trobina_controller is
  generic (
   
   -- ADDR_WIDTH      : positive  := 2;
    RX_DATA_WIDTH      : positive  := 6
);
  port (
    -- Main 38.4MHz system clock (3.3 V)
    c5_clock2           :   in      std_logic ;

    -- SI53304 clock controls (3.3 V)
    si_clock_sel        :   out     std_logic := '0';
    c5_clock2_oe        :   out     std_logic := '0';
    ufl_clock_oe        :   out     std_logic := '0';
    exp_clock_oe        :   out     std_logic := '0';

    -- VCTCXO DAC (3.3 V)
    dac_sclk            :   out     std_logic := '0' ;
    dac_sdi             :   out     std_logic := '0' ;
    dac_csn             :   out     std_logic := '1' ;

    -- LEDs (3.3 V)
    led                 :   buffer  std_logic_vector(3 downto 1) := (others =>'0') ;

    -- Power supply sync (2.5 V)
    ps_sync_1p1         :   out     std_logic := '0';
    ps_sync_1p8         :   out     std_logic := '0';

    -- INA219 power monitor (3.3 V)
    pwr_sda             :   inout   std_logic := 'Z';
    pwr_scl             :   out     std_logic := 'Z';

    -- TPS2115A power mux status
    pwr_status          :   in      std_logic;




    -- RX RF Switching (3.3 V)
    adi_rx_spdt1_v      :   out     std_logic_vector(2 downto 1) ;
    adi_rx_spdt2_v      :   out     std_logic_vector(2 downto 1) ;

    -- RX Bias-T Enable
    rx_bias_en          :   out     std_logic := '0';
	    -- AD9361 RX Interface (2.5 V, LVDS)
    adi_rx_clock       :   in      std_logic ;
    adi_rx_data        :   in      std_logic_vector(RX_DATA_WIDTH-1 downto 0) ;
    adi_rx_frame        :   in      std_logic ;



    -- TX RF Switching (3.3 V)
    adi_tx_spdt1_v      :   out     std_logic_vector(2 downto 1) ;
    adi_tx_spdt2_v      :   out     std_logic_vector(2 downto 1) ;

    -- TX Bias-T Enable
    tx_bias_en          :   out     std_logic := '0';
	 
	 -- AD9361 TX Interface (2.5 V, LVDS)
    adi_tx_clock        :   out     std_logic ;

	 -- AD9361 SPI Interface (2.5 V)
    adi_spi_sclk        :   buffer  std_logic := '0' ;
    adi_spi_csn         :   out     std_logic := '1' ;
    adi_spi_sdi         :   out     std_logic := '0' ;
    adi_spi_sdo         :   in      std_logic := '0' ;
	     -- AD9361 Control Interface (2.5 V)
    adi_reset_n         :   buffer  std_logic ;
    adi_enable          :   out     std_logic;
    adi_txnrx           :   out     std_logic := '0';
    adi_en_agc          :   out     std_logic := '0';
    adi_ctrl_in         :   out     std_logic_vector(3 downto 0) := (others => '0');
    adi_ctrl_out        :   in      std_logic_vector(7 downto 0);
    adi_sync_in         :   out     std_logic := '0';



    -- ADF4002 SPI Interface (3.3 V)
    adf_sclk            :   out     std_logic := '0' ;
    adf_csn             :   out     std_logic := '1' ;
    adf_sdi             :   out     std_logic := '0' ;
    adf_ce              :   out     std_logic := '0';
    adf_muxout          :   in      std_logic;
	
	  -- ADF5610 SPI Interface (3.3 V)
    adf5610_spi_sclk        :   buffer  std_logic := '1' ;
    adf5610_spi_csn         :   out     std_logic := '1' ;
    adf5610_spi_sdi         :   out     std_logic := '0' ;
    adf5610_spi_sdo         :   in      std_logic := '0' ;
	 -- Expansion Interface (3.3 V / 2.5 V / 1.8 V)
    exp_gpio            :   in   std_logic_vector(7 downto 0);

   
    -- Mini expansion interface (3.3 V / 2.5 V / 1.8 V)
    mini_exp           :   out   std_logic_vector( 1 downto 0) := (others => '0');
   -- mini_exp2           :   inout   std_logic := 'Z';

    -- Hardware revision resistors (3.3 V / 2.5 V / 1.8 V)
    hw_rev              :   in      std_logic_vector(1 downto 0)

  ) ;
end entity ; -- bladerf

architecture arch of trobina_controller is

    attribute noprune          : boolean;
    attribute keep             : boolean;

   
    signal sys_reset_pclk      : std_logic;
    signal sys_reset           : std_logic;

    signal sys_clock           : std_logic;
    signal sys_pll_locked      : std_logic;
    signal sys_pll_reset       : std_logic;



    signal rx_mux_sel             : unsigned(2 downto 0);

    signal nios_xb_gpio_in        : std_logic_vector(31 downto 0) := (others => '0');
    signal nios_xb_gpio_out       : std_logic_vector(31 downto 0) := (others => '0');
    signal nios_xb_gpio_oe        : std_logic_vector(31 downto 0) := (others => '0');

   -- signal rx_iq_buffer        : rx_buffers_t(0 to 1);
    
    signal nios_gpio              : nios_gpio_t;
    signal nios_gpo_slv           : std_logic_vector(31 downto 0);
	 signal intern_gpio_in        : std_logic_vector(7 downto 0) := (others => '0');
	 signal intern_index_max        : std_logic_vector(7 downto 0) := (others => '0');
    signal intern_gpio_out        : std_logic_vector(7 downto 0) := (others => '0');
	 signal i2c_scl_in             : std_logic;
    signal i2c_scl_out            : std_logic;
    signal i2c_scl_oen            : std_logic;

    signal i2c_sda_in             : std_logic;
    signal i2c_sda_out            : std_logic;
    signal i2c_sda_oen            : std_logic;




    signal tx_underflow_led       : std_logic := '1';
    signal rx_overflow_led        : std_logic := '1';

    signal led1_blink             : std_logic;
	 signal led2_blink             : std_logic;
	 signal led3_blink             : std_logic;

    signal nios_sdo               : std_logic;
    signal nios_sdio              : std_logic;
    signal nios_sclk              : std_logic;
    signal nios_ss_n              : std_logic_vector(1 downto 0);

    signal command_serial_in      : std_logic;
    signal command_serial_out     : std_logic;

    signal rffe_gpio              : rffe_gpio_t := (
        i => RFFE_GPI_DEFAULT,
        o => pack(RFFE_GPO_DEFAULT)
    );

    signal ad9361                 : mimo_2r2t_t := MIMO_2R2T_T_DEFAULT;
    alias tx_clock  is ad9361.clock;
    alias rx_clock  is ad9361.clock;

    signal mimo_rx_enables        : std_logic_vector(RFFE_GPO_DEFAULT.mimo_rx_en'range) := RFFE_GPO_DEFAULT.mimo_rx_en;
    signal mimo_tx_enables        : std_logic_vector(RFFE_GPO_DEFAULT.mimo_tx_en'range) := RFFE_GPO_DEFAULT.mimo_tx_en;

    signal dac_controls           : sample_controls_t(ad9361.ch'range)    := (others => SAMPLE_CONTROL_DISABLE);
    signal dac_streams            : sample_streams_t(dac_controls'range)  := (others => ZERO_SAMPLE);
    signal adc_controls           : sample_controls_t(ad9361.ch'range)    := (others => SAMPLE_CONTROL_DISABLE);
    signal adc_streams            : sample_streams_t(adc_controls'range)  := (others => ZERO_SAMPLE);
    signal adc_streams_last_v     : std_logic_vector(adc_controls'range)  := (others => '0');

    signal   ps_sync              : std_logic_vector(0 downto 0)          := (others => '0');
	 
	 component nios_cpu is
		port (
		adi_stream_rx_clk_p       : in  std_logic                     := '0';             --  adi_stream.rx_clk_p
		adi_stream_frame_p        : in  std_logic                     := '0';             --            .frame_p
		adi_stream_data_p         : in  std_logic_vector(5 downto 0)  := (others => '0'); --            .data_p
		adi_stream_data_n         : in  std_logic_vector(5 downto 0)  := (others => '0'); --            .data_n
		adi_stream_frame_n        : in  std_logic                     := '0';             --            .frame_n
		adi_stream_rx_clk_n       : in  std_logic                     := '0';             --            .rx_clk_n
		adi_stream_tx_clk_p       : out std_logic;                                        --            .tx_clk_p
		adi_stream_tx_clk_n       : out std_logic;                                        --            .tx_clk_n
		clk_clk                   : in  std_logic                     := '0';             --         clk.clk
		dac_MISO                  : in  std_logic                     := '0';             --         dac.MISO
		dac_MOSI                  : out std_logic;                                        --            .MOSI
		dac_SCLK                  : out std_logic;                                        --            .SCLK
		dac_SS_n                  : out std_logic_vector(1 downto 0);                     --            .SS_n
		gpio_in_port              : in  std_logic_vector(31 downto 0) := (others => '0'); --        gpio.in_port
		gpio_out_port             : out std_logic_vector(31 downto 0);                    --            .out_port
		gpio_rf_in_port           : in  std_logic_vector(31 downto 0) := (others => '0'); --     gpio_rf.in_port
		gpio_rf_out_port          : out std_logic_vector(31 downto 0);                    --            .out_port
		gpio_mini_export          : out std_logic_vector(7 downto 0);
		index_in_export           : in  std_logic_vector(7 downto 0)  := (others => '0'); --    index_in.export
		index_out_index_frequency : out std_logic_vector(7 downto 0);                     --   index_out.index_frequency
		intern_gpio_export        : in  std_logic_vector(7 downto 0)  := (others => '0'); -- intern_gpio.export
		oc_i2c_scl_pad_o          : out std_logic;                                        --      oc_i2c.scl_pad_o
		oc_i2c_scl_padoen_o       : out std_logic;                                        --            .scl_padoen_o
		oc_i2c_sda_pad_i          : in  std_logic                     := '0';             --            .sda_pad_i
		oc_i2c_sda_pad_o          : out std_logic;                                        --            .sda_pad_o
		oc_i2c_sda_padoen_o       : out std_logic;                                        --            .sda_padoen_o
		oc_i2c_arst_i             : in  std_logic                     := '0';             --            .arst_i
		oc_i2c_scl_pad_i          : in  std_logic                     := '0';             --            .scl_pad_i
		pll_MISO                  : in  std_logic                     := '0';             --         pll.MISO
		pll_MOSI                  : out std_logic;                                        --            .MOSI
		pll_SCLK                  : out std_logic;                                        --            .SCLK
		pll_SS_n                  : out std_logic;                                        --            .SS_n
		reset_reset_n             : in  std_logic                     := '0';             --       reset.reset_n
		spi_ad9361_MISO           : in  std_logic                     := '0';             --  spi_ad9361.MISO
		spi_ad9361_MOSI           : out std_logic;                                        --            .MOSI
		spi_ad9361_SCLK           : out std_logic;                                        --            .SCLK
		spi_ad9361_SS_n           : out std_logic;                                        --            .SS_n
		xb_gpios_export           : in  std_logic_vector(7 downto 0)  := (others => '0')  --    xb_gpios.export
	);
		end component;
		component system_pll is
	port (
		refclk   : in  std_logic := '0'; --  refclk.clk
		rst      : in  std_logic := '0'; --   reset.reset
		outclk_0 : out std_logic;        -- outclk0.clk
		locked   : out std_logic         --  locked.export
	);
	end component;

begin

    -- ========================================================================
    -- PLLs
    -- ========================================================================

    -- Create 80 MHz system clock from 38.4 MHz
    U_system_pll : component system_pll
        port map (
            refclk   => c5_clock2,
            rst      => sys_pll_reset,
            outclk_0 => sys_clock,
            locked   => sys_pll_locked
        );

    U_pll_reset_pll : entity work.pll_reset
        generic map (
            SYS_CLOCK_FREQ_HZ   => 38_400_000,
            DEVICE_FAMILY       => "Cyclone V"
        )
        port map (
            sys_clock      => c5_clock2,
            pll_locked     => sys_pll_locked,
            pll_reset      => sys_pll_reset
        );





    -- ========================================================================
    -- POWER SUPPLY SYNCHRONIZATION
    -- ========================================================================

    U_ps_sync : entity work.ps_sync
        generic map (
            OUTPUTS  => 1,
            USE_LFSR => true,
            HOP_LIST => adp2384_sync_divisors( REFCLK_HZ  => 38.4e6,
                                               n_divisors => 7 ),
            HOP_RATE => 100
        )
        port map (
            refclk   => c5_clock2,
            sync     => ps_sync
        );

    ps_sync_1p1 <= ps_sync(0);
    ps_sync_1p8 <= ps_sync(0);

    -- ========================================================================
    -- FX3 GPIF
    -- ========================================================================

   


   


    -- ========================================================================
    -- NIOS SYSTEM
    -- ========================================================================

    U_nios_system : component nios_cpu
			port map(
				clk_clk              => sys_clock,             --     clk.clk
				dac_MISO                        => nios_sdo,
            dac_MOSI                        => nios_sdio,
            dac_SCLK                        => nios_sclk,
            dac_SS_n                        => nios_ss_n,                     --        .SS_n
				gpio_in_port                    => pack(nios_gpio.i),
            gpio_out_port                   => nios_gpo_slv,
            gpio_rf_in_port             => pack(rffe_gpio),
            gpio_rf_out_port            => rffe_gpio.o,                    --        .out_port
			   intern_gpio_export		=>		intern_gpio_in,
				gpio_mini_export		=>		intern_gpio_out,
				index_in_export                =>  intern_index_max,    --                       index_in.export
				index_out_index_frequency           =>intern_index_max,
				oc_i2c_arst_i                   => '0',
            oc_i2c_scl_pad_i                => i2c_scl_in,
            oc_i2c_scl_pad_o                => i2c_scl_out,
            oc_i2c_scl_padoen_o             => i2c_scl_oen,
            oc_i2c_sda_pad_i                => i2c_sda_in,
            oc_i2c_sda_pad_o                => i2c_sda_out,
            oc_i2c_sda_padoen_o             => i2c_sda_oen,             --        .scl_pad_i
				pll_MISO             				=> adf5610_spi_sdo,            --     pll.MISO
				pll_MOSI       				    => adf5610_spi_sdi,                                        --        .MOSI
				pll_SCLK           				 => adf5610_spi_sclk,                                       --        .SCLK
				pll_SS_n          				  => adf5610_spi_csn,  				--        .SS_n
				spi_ad9361_MISO                  => adi_spi_sdo,             --                            spi_ad9361.MISO
				spi_ad9361_MOSI                  => adi_spi_sdi,                                        --                                      .MOSI
				spi_ad9361_SCLK                  => adi_spi_sclk,                                     --                                      .SCLK
				spi_ad9361_SS_n                  => adi_spi_csn,                                       --                                      .SS_n
				adi_stream_rx_clk_p              => adi_rx_clock,          --        spin_sensor_receiver_0_data_if.rx_clk_p
				adi_stream_frame_p                => adi_rx_frame,             --                                      .frame_p
				adi_stream_data_p                 => adi_rx_data,                      --               .data_p
				adi_stream_data_n                  => (others=>'0'), --                                      .data_n
				adi_stream_frame_n                 => '0',             --                                      .frame_n
				adi_stream_rx_clk_n                => '0',             --                                      .rx_clk_n
				adi_stream_tx_clk_p                => adi_tx_clock,            --                                      .frame_n
				adi_stream_tx_clk_n                => open, 
				reset_reset_n       => '1' ,            --   reset.reset_n
				xb_gpios_export     => exp_gpio				-- xb_gpios.in_port
				                     --         .out_port
		);
       
		  
	 toggle_led1 : process(all)
	  variable count : natural range 0 to 80_000_000 := 80_000_000;
		 begin
			  if( rising_edge(sys_clock) ) then
					count := count - 1;
					if( count = 0 ) then
						 count := 80_000_000;
						 led1_blink <= not led1_blink;
					end if;
			  end if;
		 end process;
	 toggle_led2 : process(all)
	  variable count : natural range 0 to 80_000_000 := 80_000_000;
		 begin
			  if( rising_edge(adi_rx_clock) ) then
					count := count - 1;
					if( count = 0 ) then
						 count := 80_000_000;
						 led2_blink <= not led2_blink;
					end if;
			  end if;
		 end process;
	toggle_led3 : process(all)
	  variable count : natural range 0 to 8_000_000 := 8_000_000;
		 begin
			  if( rising_edge(adi_spi_sclk) ) then
					count := count - 1;
					if( count = 0 ) then
						 count := 8_000_000;
						 led3_blink <= not led3_blink;
					end if;
			  end if;
		 end process;

  

    -- Unpack the Nios general-purpose outputs into a record
    nios_gpio.o <= unpack(nios_gpo_slv);

    -- Readback of Nios general-purpose outputs
    nios_gpio.i.gpo_readback <= nios_gpio.o;

    -- RFFE GPIO outputs
    adi_ctrl_in    <= unpack(rffe_gpio.o).ctrl_in;
    adi_tx_spdt2_v <= unpack(rffe_gpio.o).tx_spdt2;
    adi_tx_spdt1_v <= unpack(rffe_gpio.o).tx_spdt1;
    tx_bias_en     <= unpack(rffe_gpio.o).tx_bias_en;
    adi_rx_spdt2_v <= unpack(rffe_gpio.o).rx_spdt2;
    adi_rx_spdt1_v <= unpack(rffe_gpio.o).rx_spdt1;
    rx_bias_en     <= unpack(rffe_gpio.o).rx_bias_en;
    --adi_sync_in    <= unpack(rffe_gpio.o).sync_in;
    adi_en_agc     <= unpack(rffe_gpio.o).en_agc;
    adi_txnrx      <= unpack(rffe_gpio.o).txnrx;
   adi_enable     <= unpack(rffe_gpio.o).enable;
    adi_reset_n    <= unpack(rffe_gpio.o).reset_n;

    -- Unpack trigger GPIO bits into records
   -- rx_trigger_ctl <= unpack(rx_trigger_ctl_i, rx_trigger_line);
   -- tx_trigger_ctl <= unpack(tx_trigger_ctl_i, tx_trigger_line);

    -- LEDs
    led(1) <= led1_blink        when nios_gpio.o.led_mode = '0' else not nios_gpio.o.leds(1);
    led(2) <= led2_blink 		 when nios_gpio.o.led_mode = '0' else not nios_gpio.o.leds(2);
    led(3) <= led3_blink  		 when nios_gpio.o.led_mode = '0' else not nios_gpio.o.leds(3);

	 
--	 led(2) <= tx_underflow_led  when nios_gpio.o.led_mode = '0' else not nios_gpio.o.leds(2);
 --   led(3) <= rx_overflow_led   when nios_gpio.o.led_mode = '0' else not nios_gpio.o.leds(3);

    -- DAC SPI (data latched on falling edge)
    dac_sclk <= not nios_sclk when nios_gpio.o.adf_chip_enable = '0' else '0';
    dac_sdi  <= nios_sdio     when nios_gpio.o.adf_chip_enable = '0' else '0';
    dac_csn  <= nios_ss_n(0)  when nios_gpio.o.adf_chip_enable = '0' else '1';

    -- ADF SPI (data latched on rising edge)
    adf_sclk <= nios_sclk    when nios_gpio.o.adf_chip_enable = '1' else '0';
    adf_sdi  <= nios_sdio    when nios_gpio.o.adf_chip_enable = '1' else '0';
    adf_csn  <= nios_ss_n(1) when nios_gpio.o.adf_chip_enable = '1' else '1';
    adf_ce   <= nios_gpio.o.adf_chip_enable;

    nios_sdo <= adf_muxout when ((nios_ss_n(1) = '0') and (nios_gpio.o.adf_chip_enable = '1'))
                else '0';
	intern_gpio_in(0)<=adf5610_spi_sdo;

    -- Power monitor I2C
    pwr_scl     <= i2c_scl_out when i2c_scl_oen = '0' else 'Z';
    pwr_sda     <= i2c_sda_out when i2c_sda_oen = '0' else 'Z';

    i2c_scl_in  <= pwr_scl;
    i2c_sda_in  <= pwr_sda;

    -- TPS2115A status
    nios_gpio.i.pwr_status <= pwr_status;

    -- SI53304 controls / clock output enables
    si_clock_sel <= nios_gpio.o.si_clock_sel;
    c5_clock2_oe <= '1';
   -- exp_clock_oe <= exp_present and exp_clock_req;
    ufl_clock_oe <= nios_gpio.o.ufl_clock_oe;
	 mini_exp(1 downto 0)<=intern_gpio_out(1 downto 0);

	  
  


  

   

    -- ========================================================================
    -- RESET SYNCHRONIZERS
    -- ========================================================================




    -- ========================================================================
    -- SYNCHRONIZERS
    -- ========================================================================



    -- ========================================================================
    -- HANDSHAKES
    -- ========================================================================


end architecture;
