	component vctcxo_qsys is
		port (
			clk_clk                                 : in std_logic := 'X'; -- clk
			reset_reset_n                           : in std_logic := 'X'; -- reset_n
			vctcxo_tamer_0_conduit_end_tune_ref     : in std_logic := 'X'; -- tune_ref
			vctcxo_tamer_0_conduit_end_vctcxo_clock : in std_logic := 'X'  -- vctcxo_clock
		);
	end component vctcxo_qsys;

	u0 : component vctcxo_qsys
		port map (
			clk_clk                                 => CONNECTED_TO_clk_clk,                                 --                        clk.clk
			reset_reset_n                           => CONNECTED_TO_reset_reset_n,                           --                      reset.reset_n
			vctcxo_tamer_0_conduit_end_tune_ref     => CONNECTED_TO_vctcxo_tamer_0_conduit_end_tune_ref,     -- vctcxo_tamer_0_conduit_end.tune_ref
			vctcxo_tamer_0_conduit_end_vctcxo_clock => CONNECTED_TO_vctcxo_tamer_0_conduit_end_vctcxo_clock  --                           .vctcxo_clock
		);

