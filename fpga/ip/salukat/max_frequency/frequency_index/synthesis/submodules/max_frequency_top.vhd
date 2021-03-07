LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.ALL;
USE IEEE.math_complex.ALL;
USE work.max_index_frequency_pkg.ALL;

ENTITY max_frequency_top IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic:='0';
        
        rx_in_re                          :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_in_im                          :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
		  index_max                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- single
      
        );
END max_frequency_top;

architecture arch of max_frequency_top is
signal  fft_data_re_signal                     :      vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
signal  fft_data_im_signal                       :      vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
 signal   ce_out_signal                          :     std_logic;
 signal valid												:std_logic;

   --  signal   f_max_signal                           :     std_logic_vector(31 DOWNTO 0);
signal index_max_buffer                        :      std_logic_vector(7 DOWNTO 0);  -- single
COMPONENT max_index_frequency
     PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        rx_in_re                          :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_in_im                          :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        ce_out                            :   OUT   std_logic;
        valid_out                             :   OUT   std_logic;
		   fft_data_re                       :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
       fft_data_im                       :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        index_max                         :   OUT   std_logic_vector(7 DOWNTO 0) -- single
      ---  f_max                             :   OUT   std_logic_vector(31 DOWNTO 0)  -- single
        );
  END COMPONENT;
  begin
	 u_Max_Frequency : max_index_frequency
    PORT MAP( clk => clk,
              reset   => reset,       --                   :   IN    std_logic;
        clk_enable   => '1',         --         :   IN    std_logic;
        rx_in_re     =>rx_in_re,      --               :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_in_im     => rx_in_im,	  --                  :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        ce_out       =>	ce_out_signal, 	--                     :   OUT   std_logic;
        valid_out         => valid,	--                  :   OUT   std_logic;
       fft_data_re  =>  fft_data_re_signal,--                   :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
       fft_data_im  =>   fft_data_im_signal,--                  :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        index_max      =>index_max_buffer  --                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- single
       -- f_max 	=>f_max_signal--
              );
				  
		index_out_sync : process(clk) begin
			if(valid='1') then
				index_max<=index_max_buffer;
			end if;
		end process;
	end arch;