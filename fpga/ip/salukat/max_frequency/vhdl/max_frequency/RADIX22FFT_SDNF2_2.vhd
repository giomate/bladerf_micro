-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency\RADIX22FFT_SDNF2_2.vhd
-- Created: 2020-12-29 17:32:42
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: RADIX22FFT_SDNF2_2
-- Source Path: max_frequency/max_frequency/FFT_streamer/FFT HDL Optimized/RADIX22FFT_SDNF2_2
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY RADIX22FFT_SDNF2_2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        rotate_1                          :   IN    std_logic;  -- ufix1
        dout_1_re                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_1_im                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_17_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_17_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_1_vld                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_1_re_1                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_1_im_1                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_2_re                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_2_im                         :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_2_vld                        :   OUT   std_logic
        );
END RADIX22FFT_SDNF2_2;


ARCHITECTURE rtl OF RADIX22FFT_SDNF2_2 IS

  -- Signals
  SIGNAL dout_1_re_signed                 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_1_im_signed                 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_17_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_17_im_signed                : signed(11 DOWNTO 0);  -- sfix12
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
  SIGNAL dout_1_re_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_1_im_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_2_re_tmp                    : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_2_im_tmp                    : signed(11 DOWNTO 0);  -- sfix12

BEGIN
  dout_1_re_signed <= signed(dout_1_re);

  dout_1_im_signed <= signed(dout_1_im);

  dout_17_re_signed <= signed(dout_17_re);

  dout_17_im_signed <= signed(dout_17_im);

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
       Radix22ButterflyG2_NF_din_vld_dly, dout_17_im_signed, dout_17_re_signed,
       dout_1_im_signed, dout_1_re_signed, dout_1_vld, rotate_1)
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
    IF rotate_1 /= '0' THEN 
      IF dout_1_vld = '1' THEN 
        Radix22ButterflyG2_NF_btf1_re_reg_next <= resize(dout_1_re_signed, 13) + resize(dout_17_im_signed, 13);
        Radix22ButterflyG2_NF_btf2_re_reg_next <= resize(dout_1_re_signed, 13) - resize(dout_17_im_signed, 13);
        Radix22ButterflyG2_NF_btf2_im_reg_next <= resize(dout_1_im_signed, 13) + resize(dout_17_re_signed, 13);
        Radix22ButterflyG2_NF_btf1_im_reg_next <= resize(dout_1_im_signed, 13) - resize(dout_17_re_signed, 13);
      END IF;
    ELSIF dout_1_vld = '1' THEN 
      Radix22ButterflyG2_NF_btf1_re_reg_next <= resize(dout_1_re_signed, 13) + resize(dout_17_re_signed, 13);
      Radix22ButterflyG2_NF_btf2_re_reg_next <= resize(dout_1_re_signed, 13) - resize(dout_17_re_signed, 13);
      Radix22ButterflyG2_NF_btf1_im_reg_next <= resize(dout_1_im_signed, 13) + resize(dout_17_im_signed, 13);
      Radix22ButterflyG2_NF_btf2_im_reg_next <= resize(dout_1_im_signed, 13) - resize(dout_17_im_signed, 13);
    END IF;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_re_reg, 1);
    dout_1_re_tmp <= sra_temp(11 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf1_im_reg, 1);
    dout_1_im_tmp <= sra_temp_0(11 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_re_reg, 1);
    dout_2_re_tmp <= sra_temp_1(11 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG2_NF_btf2_im_reg, 1);
    dout_2_im_tmp <= sra_temp_2(11 DOWNTO 0);
    dout_2_vld <= Radix22ButterflyG2_NF_din_vld_dly;
  END PROCESS Radix22ButterflyG2_NF_output;


  dout_2_re <= std_logic_vector(dout_2_re_tmp);

  dout_2_im <= std_logic_vector(dout_2_im_tmp);

  dout_1_re_1 <= std_logic_vector(dout_1_re_tmp);

  dout_1_im_1 <= std_logic_vector(dout_1_im_tmp);

END rtl;
