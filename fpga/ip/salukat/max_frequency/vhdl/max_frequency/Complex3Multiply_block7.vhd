-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency\Complex3Multiply_block7.vhd
-- Created: 2020-12-29 17:32:43
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Complex3Multiply_block7
-- Source Path: max_frequency/max_frequency/FFT_streamer/FFT HDL Optimized/TWDLMULT_SDNF1_3/Complex3Multiply
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Complex3Multiply_block7 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        din1_re_dly3                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        din1_im_dly3                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        din1_vld_dly3                     :   IN    std_logic;
        twdl_3_11_re                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_3_11_im                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        softReset                         :   IN    std_logic;
        twdlXdin_11_re                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_11_im                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin1_vld                     :   OUT   std_logic
        );
END Complex3Multiply_block7;


ARCHITECTURE rtl OF Complex3Multiply_block7 IS

  -- Signals
  SIGNAL din1_re_dly3_signed              : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din_re_reg                       : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_im_dly3_signed              : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din_im_reg                       : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din_sum                          : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL twdl_3_11_re_signed              : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdl_re_reg                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdl_3_11_im_signed              : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdl_im_reg                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL adder_add_cast                   : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL adder_add_cast_1                 : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL twdl_sum                         : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Complex3Multiply_din1_re_pipe1   : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL Complex3Multiply_din1_im_pipe1   : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL Complex3Multiply_din1_sum_pipe1  : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Complex3Multiply_prodOfRe_pipe1  : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex3Multiply_ProdOfIm_pipe1  : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24
  SIGNAL Complex3Multiply_prodOfSum_pipe1 : signed(25 DOWNTO 0) := to_signed(16#0000000#, 26);  -- sfix26
  SIGNAL Complex3Multiply_twiddle_re_pipe1 : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL Complex3Multiply_twiddle_im_pipe1 : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL Complex3Multiply_twiddle_sum_pipe1 : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL prodOfRe                         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24_En10
  SIGNAL prodOfIm                         : signed(23 DOWNTO 0) := to_signed(16#000000#, 24);  -- sfix24_En10
  SIGNAL prodOfSum                        : signed(25 DOWNTO 0) := to_signed(16#0000000#, 26);  -- sfix26_En10
  SIGNAL din_vld_dly1                     : std_logic;
  SIGNAL din_vld_dly2                     : std_logic;
  SIGNAL din_vld_dly3                     : std_logic;
  SIGNAL prod_vld                         : std_logic;
  SIGNAL Complex3Add_tmpResult_reg        : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Complex3Add_multRes_re_reg1      : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Complex3Add_multRes_re_reg2      : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Complex3Add_multRes_im_reg       : signed(26 DOWNTO 0);  -- sfix27
  SIGNAL Complex3Add_prod_vld_reg1        : std_logic;
  SIGNAL Complex3Add_prodOfSum_reg        : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Complex3Add_tmpResult_reg_next   : signed(25 DOWNTO 0);  -- sfix26_En10
  SIGNAL Complex3Add_multRes_re_reg1_next : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex3Add_multRes_re_reg2_next : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex3Add_multRes_im_reg_next  : signed(26 DOWNTO 0);  -- sfix27_En10
  SIGNAL Complex3Add_sub_cast             : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex3Add_sub_cast_1           : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex3Add_sub_cast_2           : signed(26 DOWNTO 0);  -- sfix27_En10
  SIGNAL Complex3Add_sub_cast_3           : signed(26 DOWNTO 0);  -- sfix27_En10
  SIGNAL Complex3Add_add_cast             : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex3Add_add_cast_1           : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL Complex3Add_add_temp             : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL multResFP_re                     : signed(24 DOWNTO 0);  -- sfix25_En10
  SIGNAL multResFP_im                     : signed(26 DOWNTO 0);  -- sfix27_En10
  SIGNAL twdlXdin_11_re_tmp               : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twdlXdin_11_im_tmp               : signed(11 DOWNTO 0);  -- sfix12

BEGIN
  din1_re_dly3_signed <= signed(din1_re_dly3);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_re_reg <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        IF softReset = '1' THEN
          din_re_reg <= to_signed(16#000#, 12);
        ELSE 
          din_re_reg <= din1_re_dly3_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  din1_im_dly3_signed <= signed(din1_im_dly3);

  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_im_reg <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        IF softReset = '1' THEN
          din_im_reg <= to_signed(16#000#, 12);
        ELSE 
          din_im_reg <= din1_im_dly3_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  din_sum <= resize(din_re_reg, 13) + resize(din_im_reg, 13);

  twdl_3_11_re_signed <= signed(twdl_3_11_re);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl_re_reg <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        IF softReset = '1' THEN
          twdl_re_reg <= to_signed(16#000#, 12);
        ELSE 
          twdl_re_reg <= twdl_3_11_re_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  twdl_3_11_im_signed <= signed(twdl_3_11_im);

  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl_im_reg <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        IF softReset = '1' THEN
          twdl_im_reg <= to_signed(16#000#, 12);
        ELSE 
          twdl_im_reg <= twdl_3_11_im_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  adder_add_cast <= resize(twdl_re_reg, 13);
  adder_add_cast_1 <= resize(twdl_im_reg, 13);
  twdl_sum <= adder_add_cast + adder_add_cast_1;

  -- Complex3Multiply
  Complex3Multiply_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        prodOfRe <= Complex3Multiply_prodOfRe_pipe1;
        prodOfIm <= Complex3Multiply_ProdOfIm_pipe1;
        prodOfSum <= Complex3Multiply_prodOfSum_pipe1;
        Complex3Multiply_prodOfRe_pipe1 <= Complex3Multiply_din1_re_pipe1 * Complex3Multiply_twiddle_re_pipe1;
        Complex3Multiply_ProdOfIm_pipe1 <= Complex3Multiply_din1_im_pipe1 * Complex3Multiply_twiddle_im_pipe1;
        Complex3Multiply_prodOfSum_pipe1 <= Complex3Multiply_din1_sum_pipe1 * Complex3Multiply_twiddle_sum_pipe1;
        Complex3Multiply_twiddle_re_pipe1 <= twdl_re_reg;
        Complex3Multiply_twiddle_im_pipe1 <= twdl_im_reg;
        Complex3Multiply_twiddle_sum_pipe1 <= twdl_sum;
        Complex3Multiply_din1_re_pipe1 <= din_re_reg;
        Complex3Multiply_din1_im_pipe1 <= din_im_reg;
        Complex3Multiply_din1_sum_pipe1 <= din_sum;
      END IF;
    END IF;
  END PROCESS Complex3Multiply_process;


  intdelay_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly1 <= din1_vld_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly2 <= din_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly3 <= din_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      prod_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        prod_vld <= din_vld_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  -- Complex3Add
  Complex3Add_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Complex3Add_prodOfSum_reg <= to_signed(16#0000000#, 26);
      Complex3Add_tmpResult_reg <= to_signed(16#0000000#, 26);
      Complex3Add_multRes_re_reg1 <= to_signed(16#0000000#, 25);
      Complex3Add_multRes_re_reg2 <= to_signed(16#0000000#, 25);
      Complex3Add_multRes_im_reg <= to_signed(16#0000000#, 27);
      Complex3Add_prod_vld_reg1 <= '0';
      twdlXdin1_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Complex3Add_tmpResult_reg <= Complex3Add_tmpResult_reg_next;
        Complex3Add_multRes_re_reg1 <= Complex3Add_multRes_re_reg1_next;
        Complex3Add_multRes_re_reg2 <= Complex3Add_multRes_re_reg2_next;
        Complex3Add_multRes_im_reg <= Complex3Add_multRes_im_reg_next;
        Complex3Add_prodOfSum_reg <= prodOfSum;
        twdlXdin1_vld <= Complex3Add_prod_vld_reg1;
        Complex3Add_prod_vld_reg1 <= prod_vld;
      END IF;
    END IF;
  END PROCESS Complex3Add_process;

  Complex3Add_multRes_re_reg2_next <= Complex3Add_multRes_re_reg1;
  Complex3Add_sub_cast <= resize(prodOfRe, 25);
  Complex3Add_sub_cast_1 <= resize(prodOfIm, 25);
  Complex3Add_multRes_re_reg1_next <= Complex3Add_sub_cast - Complex3Add_sub_cast_1;
  Complex3Add_sub_cast_2 <= resize(Complex3Add_prodOfSum_reg, 27);
  Complex3Add_sub_cast_3 <= resize(Complex3Add_tmpResult_reg, 27);
  Complex3Add_multRes_im_reg_next <= Complex3Add_sub_cast_2 - Complex3Add_sub_cast_3;
  Complex3Add_add_cast <= resize(prodOfRe, 25);
  Complex3Add_add_cast_1 <= resize(prodOfIm, 25);
  Complex3Add_add_temp <= Complex3Add_add_cast + Complex3Add_add_cast_1;
  Complex3Add_tmpResult_reg_next <= resize(Complex3Add_add_temp, 26);
  multResFP_re <= Complex3Add_multRes_re_reg2;
  multResFP_im <= Complex3Add_multRes_im_reg;

  twdlXdin_11_re_tmp <= multResFP_re(21 DOWNTO 10);

  twdlXdin_11_re <= std_logic_vector(twdlXdin_11_re_tmp);

  twdlXdin_11_im_tmp <= multResFP_im(21 DOWNTO 10);

  twdlXdin_11_im <= std_logic_vector(twdlXdin_11_im_tmp);

END rtl;

