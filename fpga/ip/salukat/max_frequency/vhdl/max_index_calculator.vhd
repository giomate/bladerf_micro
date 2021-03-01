LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.math_real.ALL;
USE IEEE.math_complex.ALL;
USE work.Max_Frequency_pkg.ALL;

entity max_index_calculator is
	port( clk                               :   in    std_logic;
        reset                             :   in    std_logic;
       valid                             :   in   std_logic;
        fft_data_re                       :   in   vector_of_std_logic_vector12(0 TO 15);  -- sfix12 [16]
        fft_data_im                       :   in   vector_of_std_logic_vector12(0 TO 15);  -- sfix12 [16]
		  index_max                         :   OUT   std_logic_vector(7 DOWNTO 0)  -- single
        );
	end max_index_calculator;
	
	architecture calculator of max_index_calculator is
	begin
	end calculator;