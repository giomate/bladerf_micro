-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency_index\RADIX22FFT_SDNF1_5_block2.vhd
-- Created: 2021-01-03 10:20:46
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDNF1_5_block2
-- Source Path: max_frequency_index/max_index_frequency/FFT_streamer/FFT HDL Optimized/RADIX22FFT_SDNF1_5
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDNF1_5_block2 IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        dout_6_re                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_6_im                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_8_re                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_8_im                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_4_vld                        :   IN    std_logic;
        twdl_5_7_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_5_7_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_5_8_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_5_8_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_5_vld                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_7_re                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_7_im                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_8_re_1                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_8_im_1                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_8_vld                        :   OUT   std_logic
        );
END RADIX22FFT_SDNF1_5_block2;


ARCHITECTURE rtl OF RADIX22FFT_SDNF1_5_block2 IS

  -- Component Declarations
  COMPONENT Complex3Multiply_block30
    PORT( clk                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          din2_re_dly3                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          din2_im_dly3                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          di2_vld_dly3                    :   IN    std_logic;
          twdl_5_8_re                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          twdl_5_8_im                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          softReset                       :   IN    std_logic;
          dinXTwdl2_re                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          dinXTwdl2_im                    :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          din_vld_dly9                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Complex3Multiply_block30
    USE ENTITY work.Complex3Multiply_block30(rtl);

  -- Signals
  SIGNAL dout_6_re_signed                 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_re_dly1                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly2                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly3                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly4                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly5                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly6                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly7                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly8                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_re_dly9                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL dout_6_im_signed                 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_im_dly1                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly2                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly3                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly4                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly5                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly6                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly7                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly8                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din1_im_dly9                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL dout_8_re_signed                 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_re_dly1                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_re_dly2                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL dout_8_im_signed                 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_im_dly1                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_im_dly2                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_re_dly3                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL din2_im_dly3                     : signed(11 DOWNTO 0) := to_signed(16#000#, 12);  -- sfix12
  SIGNAL di2_vld_dly1                     : std_logic := '0';
  SIGNAL di2_vld_dly2                     : std_logic := '0';
  SIGNAL di2_vld_dly3                     : std_logic := '0';
  SIGNAL dinXTwdl2_re                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL dinXTwdl2_im                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL dinXTwdl2_vld                    : std_logic;
  SIGNAL dinXTwdl2_re_signed              : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dinXTwdl2_im_signed              : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din_vld_dly1                     : std_logic := '0';
  SIGNAL din_vld_dly2                     : std_logic := '0';
  SIGNAL din_vld_dly3                     : std_logic := '0';
  SIGNAL din_vld_dly4                     : std_logic := '0';
  SIGNAL din_vld_dly5                     : std_logic := '0';
  SIGNAL din_vld_dly6                     : std_logic := '0';
  SIGNAL din_vld_dly7                     : std_logic := '0';
  SIGNAL din_vld_dly8                     : std_logic := '0';
  SIGNAL din_vld_dly9                     : std_logic := '0';
  SIGNAL Radix22ButterflyG1_NF_btf1_re_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf1_im_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf2_re_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf2_im_reg : signed(12 DOWNTO 0) := to_signed(16#0000#, 13);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 : std_logic := '0';
  SIGNAL Radix22ButterflyG1_NF_btf1_re_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf1_im_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf2_re_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_btf2_im_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next : std_logic;
  SIGNAL dout_7_re_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_7_im_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_8_re_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_8_im_tmp                    : signed(11 DOWNTO 0);  -- sfix12

BEGIN
  u_MUL3_2 : Complex3Multiply_block30
    PORT MAP( clk => clk,
              enb_1_32_0 => enb_1_32_0,
              din2_re_dly3 => std_logic_vector(din2_re_dly3),  -- sfix12
              din2_im_dly3 => std_logic_vector(din2_im_dly3),  -- sfix12
              di2_vld_dly3 => di2_vld_dly3,
              twdl_5_8_re => twdl_5_8_re,  -- sfix12_En10
              twdl_5_8_im => twdl_5_8_im,  -- sfix12_En10
              softReset => softReset,
              dinXTwdl2_re => dinXTwdl2_re,  -- sfix12
              dinXTwdl2_im => dinXTwdl2_im,  -- sfix12
              din_vld_dly9 => dinXTwdl2_vld
              );

  dout_6_re_signed <= signed(dout_6_re);

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly1 <= dout_6_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly2 <= din1_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly3 <= din1_re_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly4 <= din1_re_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  intdelay_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly5 <= din1_re_dly4;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly6 <= din1_re_dly5;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly7 <= din1_re_dly6;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly8 <= din1_re_dly7;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  intdelay_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly9 <= din1_re_dly8;
      END IF;
    END IF;
  END PROCESS intdelay_8_process;


  dout_6_im_signed <= signed(dout_6_im);

  intdelay_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly1 <= dout_6_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_9_process;


  intdelay_10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly2 <= din1_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_10_process;


  intdelay_11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly3 <= din1_im_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_11_process;


  intdelay_12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly4 <= din1_im_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_12_process;


  intdelay_13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly5 <= din1_im_dly4;
      END IF;
    END IF;
  END PROCESS intdelay_13_process;


  intdelay_14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly6 <= din1_im_dly5;
      END IF;
    END IF;
  END PROCESS intdelay_14_process;


  intdelay_15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly7 <= din1_im_dly6;
      END IF;
    END IF;
  END PROCESS intdelay_15_process;


  intdelay_16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly8 <= din1_im_dly7;
      END IF;
    END IF;
  END PROCESS intdelay_16_process;


  intdelay_17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly9 <= din1_im_dly8;
      END IF;
    END IF;
  END PROCESS intdelay_17_process;


  dout_8_re_signed <= signed(dout_8_re);

  intdelay_18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly1 <= dout_8_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_18_process;


  intdelay_19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly2 <= din2_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_19_process;


  dout_8_im_signed <= signed(dout_8_im);

  intdelay_20_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly1 <= dout_8_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_20_process;


  intdelay_21_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly2 <= din2_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_21_process;


  intdelay_22_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly3 <= din2_re_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_22_process;


  intdelay_23_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly3 <= din2_im_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_23_process;


  intdelay_24_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly1 <= dout_4_vld;
      END IF;
    END IF;
  END PROCESS intdelay_24_process;


  intdelay_25_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly2 <= di2_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_25_process;


  intdelay_26_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly3 <= di2_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_26_process;


  dinXTwdl2_re_signed <= signed(dinXTwdl2_re);

  dinXTwdl2_im_signed <= signed(dinXTwdl2_im);

  intdelay_27_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly1 <= dout_4_vld;
      END IF;
    END IF;
  END PROCESS intdelay_27_process;


  intdelay_28_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly2 <= din_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_28_process;


  intdelay_29_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly3 <= din_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_29_process;


  intdelay_30_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly4 <= din_vld_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_30_process;


  intdelay_31_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly5 <= din_vld_dly4;
      END IF;
    END IF;
  END PROCESS intdelay_31_process;


  intdelay_32_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly6 <= din_vld_dly5;
      END IF;
    END IF;
  END PROCESS intdelay_32_process;


  intdelay_33_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly7 <= din_vld_dly6;
      END IF;
    END IF;
  END PROCESS intdelay_33_process;


  intdelay_34_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly8 <= din_vld_dly7;
      END IF;
    END IF;
  END PROCESS intdelay_34_process;


  intdelay_35_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din_vld_dly9 <= din_vld_dly8;
      END IF;
    END IF;
  END PROCESS intdelay_35_process;


  -- Radix22ButterflyG1_NF
  Radix22ButterflyG1_NF_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Radix22ButterflyG1_NF_btf1_re_reg <= Radix22ButterflyG1_NF_btf1_re_reg_next;
        Radix22ButterflyG1_NF_btf1_im_reg <= Radix22ButterflyG1_NF_btf1_im_reg_next;
        Radix22ButterflyG1_NF_btf2_re_reg <= Radix22ButterflyG1_NF_btf2_re_reg_next;
        Radix22ButterflyG1_NF_btf2_im_reg <= Radix22ButterflyG1_NF_btf2_im_reg_next;
        Radix22ButterflyG1_NF_dinXtwdl_vld_dly1 <= Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_NF_process;

  Radix22ButterflyG1_NF_output : PROCESS (Radix22ButterflyG1_NF_btf1_im_reg, Radix22ButterflyG1_NF_btf1_re_reg,
       Radix22ButterflyG1_NF_btf2_im_reg, Radix22ButterflyG1_NF_btf2_re_reg,
       Radix22ButterflyG1_NF_dinXtwdl_vld_dly1, din1_im_dly9, din1_re_dly9,
       dinXTwdl2_im_signed, dinXTwdl2_re_signed, din_vld_dly9)
    VARIABLE sra_temp : signed(12 DOWNTO 0);
    VARIABLE sra_temp_0 : signed(12 DOWNTO 0);
    VARIABLE sra_temp_1 : signed(12 DOWNTO 0);
    VARIABLE sra_temp_2 : signed(12 DOWNTO 0);
  BEGIN
    Radix22ButterflyG1_NF_btf1_re_reg_next <= Radix22ButterflyG1_NF_btf1_re_reg;
    Radix22ButterflyG1_NF_btf1_im_reg_next <= Radix22ButterflyG1_NF_btf1_im_reg;
    Radix22ButterflyG1_NF_btf2_re_reg_next <= Radix22ButterflyG1_NF_btf2_re_reg;
    Radix22ButterflyG1_NF_btf2_im_reg_next <= Radix22ButterflyG1_NF_btf2_im_reg;
    Radix22ButterflyG1_NF_dinXtwdl_vld_dly1_next <= din_vld_dly9;
    IF din_vld_dly9 = '1' THEN 
      Radix22ButterflyG1_NF_btf1_re_reg_next <= resize(din1_re_dly9, 13) + resize(dinXTwdl2_re_signed, 13);
      Radix22ButterflyG1_NF_btf2_re_reg_next <= resize(din1_re_dly9, 13) - resize(dinXTwdl2_re_signed, 13);
      Radix22ButterflyG1_NF_btf1_im_reg_next <= resize(din1_im_dly9, 13) + resize(dinXTwdl2_im_signed, 13);
      Radix22ButterflyG1_NF_btf2_im_reg_next <= resize(din1_im_dly9, 13) - resize(dinXTwdl2_im_signed, 13);
    END IF;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf1_re_reg, 1);
    dout_7_re_tmp <= sra_temp(11 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf1_im_reg, 1);
    dout_7_im_tmp <= sra_temp_0(11 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf2_re_reg, 1);
    dout_8_re_tmp <= sra_temp_1(11 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG1_NF_btf2_im_reg, 1);
    dout_8_im_tmp <= sra_temp_2(11 DOWNTO 0);
    dout_8_vld <= Radix22ButterflyG1_NF_dinXtwdl_vld_dly1;
  END PROCESS Radix22ButterflyG1_NF_output;


  dout_7_re <= std_logic_vector(dout_7_re_tmp);

  dout_7_im <= std_logic_vector(dout_7_im_tmp);

  dout_8_re_1 <= std_logic_vector(dout_8_re_tmp);

  dout_8_im_1 <= std_logic_vector(dout_8_im_tmp);

END rtl;

