-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency\TWDLMULT_SDNF1_3_block2.vhd
-- Created: 2020-12-29 17:32:42
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: TWDLMULT_SDNF1_3_block2
-- Source Path: max_frequency/max_frequency/FFT_streamer/FFT HDL Optimized/TWDLMULT_SDNF1_3
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY TWDLMULT_SDNF1_3_block2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        dout_13_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_13_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_15_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_15_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        dout_2_vld                        :   IN    std_logic;
        twdl_3_7_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_3_7_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_3_8_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_3_8_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_3_8_vld                      :   IN    std_logic;
        softReset                         :   IN    std_logic;
        twdlXdin_7_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_7_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_8_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_8_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
        twdlXdin_7_vld                    :   OUT   std_logic
        );
END TWDLMULT_SDNF1_3_block2;


ARCHITECTURE rtl OF TWDLMULT_SDNF1_3_block2 IS

  -- Component Declarations
  COMPONENT Complex3Multiply_block4
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          din1_re_dly3                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          din1_im_dly3                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          din1_vld_dly3                   :   IN    std_logic;
          twdl_3_7_re                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          twdl_3_7_im                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          softReset                       :   IN    std_logic;
          twdlXdin_7_re                   :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          twdlXdin_7_im                   :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          twdlXdin1_vld                   :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Complex3Multiply_block5
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          din2_re_dly3                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          din2_im_dly3                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          di2_vld_dly3                    :   IN    std_logic;
          twdl_3_8_re                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          twdl_3_8_im                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          softReset                       :   IN    std_logic;
          twdlXdin_8_re                   :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          twdlXdin_8_im                   :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12
          twdlXdin2_vld                   :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : Complex3Multiply_block4
    USE ENTITY work.Complex3Multiply_block4(rtl);

  FOR ALL : Complex3Multiply_block5
    USE ENTITY work.Complex3Multiply_block5(rtl);

  -- Signals
  SIGNAL dout_13_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_re_dly1                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_re_dly2                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_13_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_im_dly1                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_im_dly2                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_re_dly3                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_im_dly3                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din1_vld_dly1                    : std_logic;
  SIGNAL din1_vld_dly2                    : std_logic;
  SIGNAL din1_vld_dly3                    : std_logic;
  SIGNAL twdlXdin_7_re_tmp                : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL twdlXdin_7_im_tmp                : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL twdlXdin1_vld                    : std_logic;
  SIGNAL dout_15_re_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_re_dly1                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_re_dly2                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL dout_15_im_signed                : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_im_dly1                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_im_dly2                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_re_dly3                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL din2_im_dly3                     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL di2_vld_dly1                     : std_logic;
  SIGNAL di2_vld_dly2                     : std_logic;
  SIGNAL di2_vld_dly3                     : std_logic;
  SIGNAL twdlXdin_8_re_tmp                : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL twdlXdin_8_im_tmp                : std_logic_vector(11 DOWNTO 0);  -- ufix12

BEGIN
  u_MUL3_1 : Complex3Multiply_block4
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              din1_re_dly3 => std_logic_vector(din1_re_dly3),  -- sfix12
              din1_im_dly3 => std_logic_vector(din1_im_dly3),  -- sfix12
              din1_vld_dly3 => din1_vld_dly3,
              twdl_3_7_re => twdl_3_7_re,  -- sfix12_En10
              twdl_3_7_im => twdl_3_7_im,  -- sfix12_En10
              softReset => softReset,
              twdlXdin_7_re => twdlXdin_7_re_tmp,  -- sfix12
              twdlXdin_7_im => twdlXdin_7_im_tmp,  -- sfix12
              twdlXdin1_vld => twdlXdin1_vld
              );

  u_MUL3_2 : Complex3Multiply_block5
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              din2_re_dly3 => std_logic_vector(din2_re_dly3),  -- sfix12
              din2_im_dly3 => std_logic_vector(din2_im_dly3),  -- sfix12
              di2_vld_dly3 => di2_vld_dly3,
              twdl_3_8_re => twdl_3_8_re,  -- sfix12_En10
              twdl_3_8_im => twdl_3_8_im,  -- sfix12_En10
              softReset => softReset,
              twdlXdin_8_re => twdlXdin_8_re_tmp,  -- sfix12
              twdlXdin_8_im => twdlXdin_8_im_tmp,  -- sfix12
              twdlXdin2_vld => twdlXdin_7_vld
              );

  dout_13_re_signed <= signed(dout_13_re);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_re_dly1 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly1 <= dout_13_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_re_dly2 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly2 <= din1_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  dout_13_im_signed <= signed(dout_13_im);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_im_dly1 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly1 <= dout_13_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_im_dly2 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly2 <= din1_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  intdelay_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_re_dly3 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_re_dly3 <= din1_re_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_im_dly3 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_im_dly3 <= din1_im_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_vld_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_vld_dly1 <= dout_2_vld;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_vld_dly2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_vld_dly2 <= din1_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  intdelay_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din1_vld_dly3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din1_vld_dly3 <= din1_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_8_process;


  dout_15_re_signed <= signed(dout_15_re);

  intdelay_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_re_dly1 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly1 <= dout_15_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_9_process;


  intdelay_10_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_re_dly2 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly2 <= din2_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_10_process;


  dout_15_im_signed <= signed(dout_15_im);

  intdelay_11_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_im_dly1 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly1 <= dout_15_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_11_process;


  intdelay_12_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_im_dly2 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly2 <= din2_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_12_process;


  intdelay_13_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_re_dly3 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_re_dly3 <= din2_re_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_13_process;


  intdelay_14_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din2_im_dly3 <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        din2_im_dly3 <= din2_im_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_14_process;


  intdelay_15_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      di2_vld_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly1 <= dout_2_vld;
      END IF;
    END IF;
  END PROCESS intdelay_15_process;


  intdelay_16_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      di2_vld_dly2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly2 <= di2_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_16_process;


  intdelay_17_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      di2_vld_dly3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        di2_vld_dly3 <= di2_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_17_process;


  twdlXdin_7_re <= twdlXdin_7_re_tmp;

  twdlXdin_7_im <= twdlXdin_7_im_tmp;

  twdlXdin_8_re <= twdlXdin_8_re_tmp;

  twdlXdin_8_im <= twdlXdin_8_im_tmp;

END rtl;

