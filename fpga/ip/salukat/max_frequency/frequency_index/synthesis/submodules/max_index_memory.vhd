LIBRARY IEEE;
	USE IEEE.std_logic_1164.ALL;
	USE IEEE.numeric_std.ALL;


library work;
	USE work.max_index_frequency_pkg.ALL;


entity max_index_memory is
	    generic (
        NUM_REGISTERS    : positive  := 32;
        ADDR_WIDTH      : positive  := 5;
        DATA_WIDTH      : positive  := 24;
		  INDEX_WIDTH      : positive  := 8
    );
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic:='0';
        rx_in_re                          :   IN    std_logic_vector(DATA_WIDTH/2-1 DOWNTO 0);  -- sfix12
        rx_in_im                          :   IN    std_logic_vector(DATA_WIDTH/2-1 DOWNTO 0);  -- sfix12
			
         index_max                         :   OUT   std_logic_vector(INDEX_WIDTH-1 DOWNTO 0);  -- single
			 -- Memory mapped interface
        mem_clk			: in 	std_logic;
		  addr            : in    std_logic_vector(ADDR_WIDTH-1 downto 0);
        din             : in    std_logic_vector((DATA_WIDTH+INDEX_WIDTH)-1 downto 0);
        dout            : out   std_logic_vector((DATA_WIDTH+INDEX_WIDTH)-1 downto 0);
        write           : in    std_logic;
        read            : in    std_logic;
        waitreq         : out   std_logic;
        readack         : out   std_logic
      
        );
end max_index_memory;

architecture arch of max_index_memory is
	type vector_of_std_logic_vector24 is array (natural range <>) of std_logic_vector(DATA_WIDTH-1 DOWNTO 0);

	signal  fft_data_re_signal                     :      vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
	signal  fft_data_im_signal                       :      vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
	signal  fft_data_memory                     :      vector_of_std_logic_vector24(0 TO 31);  -- sfix12 [32]

	signal   ce_out_signal                          :     std_logic;
  -- signal   f_max_signal                           :     std_logic_vector(31 DOWNTO 0);
	signal ack : std_logic ;
	signal uaddr        : natural range 0 to 2**addr'high;
	signal clk_enable_signal                       :       std_logic:='1';
	signal	valid_signal                           :      std_logic:='0';
	signal index_max_async                        :     std_logic_vector(7 DOWNTO 0);
	signal index_max_sync                        :     std_logic_vector(7 DOWNTO 0):=(others=>'1');
	SIGNAL enb_1_32_0                       : std_logic;
	SIGNAL enb                              : std_logic;
	SIGNAL enb_1_32_1                       : std_logic;
	signal counter32		:  STD_LOGIC_VECTOR ( ADDR_WIDTH-1 DOWNTO 0):=(others=>'0');

COMPONENT max_index_frequency
     PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        rx_in_re                          :   IN    std_logic_vector(DATA_WIDTH/2-1 DOWNTO 0);  -- sfix12
        rx_in_im                          :   IN    std_logic_vector(DATA_WIDTH/2-1 DOWNTO 0);  -- sfix12
        ce_out                            :   OUT   std_logic;
        valid_out                             :   OUT   std_logic;
		   fft_data_re                       :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
       fft_data_im                       :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        index_max                         :   OUT   std_logic_vector(7 DOWNTO 0) -- single
       -- f_max                             :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
  END COMPONENT;
  
 --  FOR ALL : max_index_frequency_tc
 --   USE ENTITY work.max_index_frequency_tc(rtl);
  
  begin
  	
	 
	 u_Max_Frequency : max_index_frequency
	     PORT MAP( clk => clk,
              reset   => reset,       --                   :   IN    std_logic;
        clk_enable   => clk_enable_signal,         --         :   IN    std_logic;
        rx_in_re     =>rx_in_re,      --               :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_in_im     => rx_in_im,	  --                  :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        ce_out       =>	ce_out_signal, 	--                     :   OUT   std_logic;
        valid_out         => valid_signal,	--                  :   OUT   std_logic;
       fft_data_re  =>  fft_data_re_signal,--                   :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
       fft_data_im  =>   fft_data_im_signal,--                  :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        index_max      =>index_max_async  --                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
     --   f_max 	=>f_max_signal--
              );
				  
	  mm_read : process(mem_clk)
		 begin
			 -- if (reset = '1') then
					--readack <= '0';
				--	dout    <= (others => '0');

			--  els
			  if (rising_edge(mem_clk)) then
					-- hold off ack until there's no ops pending (race condition)
					--readack <= to_sl(read = '1' and not current.op_pending);
					ack <= read ;

					if (read = '1') then
						
							dout(7 downto 0) <=index_max_sync;
							dout(31 downto 8) <=	std_logic_vector(fft_data_memory(uaddr));
					
						 
				
			
					end if;
			  end if;
		 end process mm_read;
		mm_write : process(mem_clk)
		 begin
			--  if (reset = '1') then
				--	future_regs <= (others => (others => '0'));
				--	pend_ctrl   <= false;

			 -- els
			  if (rising_edge(mem_clk)) then
			

					if (write = '1' and uaddr < NUM_REGISTERS) then
						-- future_regs(uaddr) <= to_reg(din);

						-- if (uaddr = 0) then
							  -- send a pend_ctrl signal for the state machine to pick up
						--	  pend_ctrl <= true;
						-- end if;
					end if;
			  end if;
		 end process mm_write;
	
	-- =============================================
	--	generate_fft_data_memory : for i in fft_data_memory'range generate
				
			  U_sync_fft_data_memory : entity work.complex_memory_synchronizer
				 generic map (
					UNVALID_LEVEL         =>  '0',
					DATA_WIDTH         =>  DATA_WIDTH
				 ) port map (
					valid               =>  valid_signal,
					clock               =>  clk,
					--enable			=> ce_out_signal,
					enable			=> '1',
					async_re               =>  std_logic_vector(fft_data_re_signal(to_integer(unsigned(counter32)))),
					async_im               =>  std_logic_vector(fft_data_im_signal(to_integer(unsigned(counter32)))),
					sync                =>  fft_data_memory(to_integer(unsigned(counter32)))
				 );
	
  --  end generate;
	   U_sync_index_memory : entity work.index_synchronizer
				 generic map (
					UNVALID_LEVEL         =>  '0',
					DATA_WIDTH         =>  INDEX_WIDTH
				 ) port map (
					valid               =>  valid_signal,
					clock               =>  clk,
					--enable			=> ce_out_signal,
					enable			=> '1',
					async              =>  index_max_async,
					
					sync                =>  index_max_sync
				 );
				 
		u_counter_32: entity work.counter_adddress_32
				PORT MAP (
					clock => clk,
					--clk_en=>ce_out_signal,
					q => counter32
				);
				 
				 
		 readack <= ack ;
		 waitreq <= not(ack or write) ;
		 uaddr <= to_integer(unsigned(addr));
		 clk_enable_signal<=not(reset);
		 index_max<=index_max_sync;
		 
		 
	end arch;