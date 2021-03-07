	component frequency_index is
		port (
			clk_clk                                               : in  std_logic                     := 'X';             -- clk
			reset_reset_n                                         : in  std_logic                     := 'X';             -- reset_n
			max_frequency_index_0_iq_complex_samples_re_data      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- re_data
			max_frequency_index_0_iq_complex_samples_im_data      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- im_data
			max_frequency_index_0_index_frequency_index_frequency : out std_logic_vector(7 downto 0)                      -- index_frequency
		);
	end component frequency_index;

	u0 : component frequency_index
		port map (
			clk_clk                                               => CONNECTED_TO_clk_clk,                                               --                                      clk.clk
			reset_reset_n                                         => CONNECTED_TO_reset_reset_n,                                         --                                    reset.reset_n
			max_frequency_index_0_iq_complex_samples_re_data      => CONNECTED_TO_max_frequency_index_0_iq_complex_samples_re_data,      -- max_frequency_index_0_iq_complex_samples.re_data
			max_frequency_index_0_iq_complex_samples_im_data      => CONNECTED_TO_max_frequency_index_0_iq_complex_samples_im_data,      --                                         .im_data
			max_frequency_index_0_index_frequency_index_frequency => CONNECTED_TO_max_frequency_index_0_index_frequency_index_frequency  --    max_frequency_index_0_index_frequency.index_frequency
		);

