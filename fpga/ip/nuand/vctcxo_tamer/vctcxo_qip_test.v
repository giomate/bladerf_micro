module vctcxo_qip_test(
input clk,
input reset);

vctcxo_qsys vctcxo (
		.clk_clk(clk),                                //                        clk.clk
		.reset_reset_n(reset)        //                    reset.reset_n
		
	);
endmodule