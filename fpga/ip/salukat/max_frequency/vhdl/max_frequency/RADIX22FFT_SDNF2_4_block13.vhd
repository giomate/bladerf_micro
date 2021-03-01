-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency\RADIX22FFT_SDNF2_4_block13.vhd
-- Created: 2020-12-29 17:32:44
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDNF2_4_block13
-- Source Path: max_frequency/max_frequency/FFT_streamer/FFT HDL Optimized/RADIX22FFT_SDNF2_4
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDNF2_4_block13 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        rotate_29                         :   IN    std_logic;  -- ufix1
        dout_26_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_26_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_30_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_30_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_1_vld                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_29_re                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_29_im                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_30_re_1                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_30_im_1                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_4_vld                        :   OUT   std_logic
        );
END RADIX22FFT_SDNF2_4_block13;


ARCHITECTURE rtl OF RADIX22FFT_SDNF2_4_block13 IS

  -- Signals
  SIGNAL dout_26_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_26_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_30_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_30_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG2_NF_din_vld_dly : std_logic;
  SIGNAL Radix22ButterflyG2_NF_btf1_re_reg : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf1_im_reg : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf2_re_reg : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf2_im_reg : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_din_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_NF_btf1_re_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf1_im_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf2_re_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG2_NF_btf2_im_reg_next : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL dout_29_re_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_29_im_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_30_re_tmp                   : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_30_im_tmp                   : signed(11 DOWNTO 0);  -- sfix12

BEGIN
  dout_26_re_signed <= signed(dout_26_re);

  dout_26_im_signed <= signed(dout_26_im);

  dout_30_re_signed <= signed(dout_30_re);

  dout_30_im_signed <= signed(dout_30_im);

  -- Radix22ButterflyG2_NF
  Radix22ButterflyG2_NF_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG2_NF_din_vld_dly <= '0';
      Radix22ButterflyG2_NF_btf1_re_reg <= to_signed(16#0000#, 13);
      Radix22ButterflyG2_NF_btf1_im_reg <= to_signed(16#0000#, 13);
      Radix22ButterflyG2_NF_btf2_re_reg <= to_signed(16#0000#, 13);
      Radix22ButterflyG2_NF_btf2_im_reg <= to_signed(16#0000#, 13);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        Radix22ButterflyG2_NF_din_vld_dly <= Radix22ButterflyG2_NF_din_vld_dly_next;
        Radix22ButterflyG2_NF_btf1_re_reg <= Radix22ButterflyG2_NF_btf1_re_reg_next;
        Radix22ButterflyG2_NF_btf1_im_reg <= Radix22ButterflyG2_NF_btf1_im_reg_next;
        Radix22ButterflyG2_NF_btf2_re_reg <= Radix22ButterflyG2_NF_btf2_re_reg_next;
        Radix22ButterflyG2_NF_btf2_im_reg <= Radix22ButterflyG2_NF_btf2_im_reg_next;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG2_NF_process;

  Radix22ButterflyG2_NF_output : PROCESS (Radix22ButterflyG2_NF_btf1_im_reg, Radix22ButterflyG2_NF_btf1_re_reg,
       Radix22ButterflyG2_NF_btf2_im_reg, Radix22ButterflyG2_NF_btf2_re_reg,
       Radix22ButterflyG2_NF_din_vld_dly, dout_1_vld, dout_26_im_signed,
       dout_26_re_signed, dout_30_im_signed, dout_30_re_signed, rotate_29)
    VARIABLE sra_temp : signed(12 DOWNTO 0);
    VARIABLE sra_temp_0 : signed(12 DOWNTO 0);
    VARIABLE sra_temp_1 : signed(12 DOWNTO 0);
    VARIABLE sra_temp_2 : signed(12 DOWNTO 0);
  BEGIN
    Radix22ButterflyG2_NF_btf1_re_reg_next <= Radix22ButterflyG2_NF_btf1_re_reg;
    Radix22ButterflyG2_NF_btf1_im_reg_next <= Radix22ButterflyG2_NF_btf1_im_reg;
    Radix22ButterflyG2_NF_btf2_re_reg_next <= Radix22ButterflyG2_NF_btf2_re_reg;
    Radix22ButterflyG2_NF_btf2_im_reg_next <= Radix22ButterflyG2_NF_btf2_im_reg;
    Radix22ButterflyG2_NF_din_vld_dly_next <= dout_1_vld;
    IF rotate_29 /= '0' THEN 
      IF dout_1_vld = '1' THEN 
        Radix22ButterflyG2_NF_btf1_re_reg_next <= resize(dout_26_re_signed, 13) + resize(dout_30_im_signed, 13);
        Radix22ButterflyG2_NF_btf2_re_reg_next <= resize(dout_26_re_signed, 13) - resize(dout_30_im_signed, 13);
        Radix22ButterflyG2_NF_btf2_im_reg_next <= resize(dout_26_im_signed, 13) + resize(dout_30_re_signed, 13);
        Radix22ButterflyG2_NF_btf1_im_reg_next <= resize(dout_26_im_signed, 13) - resize(dout_30_re_signed, 13);
      END IF;
    ELSIF dout_1_vld = '1' THEN 
      Radix22ButterflyG2_NF_btf1_re_reg_next <= resize(dout_26_re_signed, 13) + resize(dout_30_re_signed, 13);
      Radix22ButterflyG2_NF_btf2_re_reg_next <= resize(dout_26_re_signed, 13) - resize(dout_30_re_signed, 13);
      Radix22ButterflyG2_NF_btf1_im_reg_next <= resize(dout_26_im_signed, 13) + resize(dout_30_im_signed, 13);
      Radix22ButterflyG2_NF_btf2_im_reg_next <= resize(dout_26_im_signed, 13) - resize(dout_30_im_signed, 13);
    END IF;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_re_reg, 1);
    dout_29_re_tmp <= sra_temp(11 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_im_reg, 1);
    dout_29_im_tmp <= sra_temp_0(11 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_re_reg, 1);
    dout_30_re_tmp <= sra_temp_1(11 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_im_reg, 1);
    dout_30_im_tmp <= sra_temp_2(11 DOWNTO 0);
    dout_4_vld <= Radix22ButterflyG2_NF_din_vld_dly;
  END PROCESS Radix22ButterflyG2_NF_output;


  dout_29_re <= std_logic_vector(dout_29_re_tmp);

  dout_29_im <= std_logic_vector(dout_29_im_tmp);

  dout_30_re_1 <= std_logic_vector(dout_30_re_tmp);

  dout_30_im_1 <= std_logic_vector(dout_30_im_tmp);

END rtl;

