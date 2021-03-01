-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency\max_frequency.vhd
-- Created: 2020-12-29 17:32:45
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1e-06
-- Target subsystem base rate: 1e-06
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        3.2e-05
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- valid                         ce_out        3.2e-05
-- fft_data_re                   ce_out        3.2e-05
-- fft_data_im                   ce_out        3.2e-05
-- index_max                     ce_out        3.2e-05
-- f_max                         ce_out        3.2e-05
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: max_frequency
-- Source Path: max_frequency/max_frequency
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.max_frequency_pkg.ALL;

ENTITY max_frequency IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        rx_in_re                          :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        rx_in_im                          :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
        ce_out                            :   OUT   std_logic;
        valid                             :   OUT   std_logic;
        fft_data_re                       :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        fft_data_im                       :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        index_max                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        f_max                             :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
        );
END max_frequency;


ARCHITECTURE rtl OF max_frequency IS

  -- Component Declarations
  COMPONENT max_frequency_tc
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_32_0                      :   OUT   std_logic;
          enb_1_32_1                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT serial2parallel
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          S_re                            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          S_im                            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          P_re                            :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          P_im                            :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          ValidOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT FFT_streamer
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          In1_re                          :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          In1_im                          :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          In2                             :   IN    std_logic;
          Out1_re                         :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          Out1_im                         :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          Out2                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT frequency_max
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          enb_1_32_1                      :   IN    std_logic;
          enb                             :   IN    std_logic;
          fft_data_re                     :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          fft_data_im                     :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          enable                          :   IN    std_logic;
          index_max                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          f_max                           :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : max_frequency_tc
    USE ENTITY work.max_frequency_tc(rtl);

  FOR ALL : serial2parallel
    USE ENTITY work.serial2parallel(rtl);

  FOR ALL : FFT_streamer
    USE ENTITY work.FFT_streamer(rtl);

  FOR ALL : frequency_max
    USE ENTITY work.frequency_max(rtl);

  -- Signals
  SIGNAL enb_1_32_0                       : std_logic;
  SIGNAL enb_1_32_1                       : std_logic;
  SIGNAL enb                              : std_logic;
  SIGNAL serial2parallel_out1_re          : vector_of_std_logic_vector12(0 TO 31);  -- ufix12 [32]
  SIGNAL serial2parallel_out1_im          : vector_of_std_logic_vector12(0 TO 31);  -- ufix12 [32]
  SIGNAL serial2parallel_out2             : std_logic;
  SIGNAL FFT_streamer_out1_re             : vector_of_std_logic_vector12(0 TO 31);  -- ufix12 [32]
  SIGNAL FFT_streamer_out1_im             : vector_of_std_logic_vector12(0 TO 31);  -- ufix12 [32]
  SIGNAL FFT_streamer_out2                : std_logic;
  SIGNAL FFT_streamer_out2_1              : std_logic;
  SIGNAL FFT_streamer_out1_re_signed      : vector_of_signed12(0 TO 31);  -- sfix12 [32]
  SIGNAL FFT_streamer_out1_im_signed      : vector_of_signed12(0 TO 31);  -- sfix12 [32]
  SIGNAL delayMatch1_reg_re               : vector_of_signed12(0 TO 31);  -- sfix12 [32]
  SIGNAL delayMatch1_reg_im               : vector_of_signed12(0 TO 31);  -- sfix12 [32]
  SIGNAL delayMatch1_reg_next_re          : vector_of_signed12(0 TO 31);  -- sfix12 [32]
  SIGNAL delayMatch1_reg_next_im          : vector_of_signed12(0 TO 31);  -- sfix12 [32]
  SIGNAL FFT_streamer_out1_re_1           : vector_of_signed12(0 TO 31);  -- sfix12 [32]
  SIGNAL FFT_streamer_out1_im_1           : vector_of_signed12(0 TO 31);  -- sfix12 [32]
  SIGNAL frequency_max_out1               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL frequency_max_out2               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL frequency_max_out1_unsigned      : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL frequency_max_out1_1             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL RateTransition_bypass_reg        : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL frequency_max_out1_2             : unsigned(31 DOWNTO 0);  -- uint32

BEGIN
  u_max_frequency_tc : max_frequency_tc
    PORT MAP( clk => clk,
              reset => reset,
              clk_enable => clk_enable,
              enb => enb,
              enb_1_32_0 => enb_1_32_0,
              enb_1_32_1 => enb_1_32_1
              );

  u_serial2parallel : serial2parallel
    PORT MAP( clk => clk,
              reset => reset,
              enb => enb,
              S_re => rx_in_re,  -- sfix12
              S_im => rx_in_im,  -- sfix12
              P_re => serial2parallel_out1_re,  -- sfix12 [32]
              P_im => serial2parallel_out1_im,  -- sfix12 [32]
              ValidOut => serial2parallel_out2
              );

  u_FFT_streamer : FFT_streamer
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              In1_re => serial2parallel_out1_re,  -- sfix12 [32]
              In1_im => serial2parallel_out1_im,  -- sfix12 [32]
              In2 => serial2parallel_out2,
              Out1_re => FFT_streamer_out1_re,  -- sfix12 [32]
              Out1_im => FFT_streamer_out1_im,  -- sfix12 [32]
              Out2 => FFT_streamer_out2
              );

  u_frequency_max : frequency_max
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              enb_1_32_1 => enb_1_32_1,
              enb => enb,
              fft_data_re => FFT_streamer_out1_re,  -- sfix12 [32]
              fft_data_im => FFT_streamer_out1_im,  -- sfix12 [32]
              enable => FFT_streamer_out2,
              index_max => frequency_max_out1,  -- uint32
              f_max => frequency_max_out2  -- uint32
              );

  delayMatch_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      FFT_streamer_out2_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        FFT_streamer_out2_1 <= FFT_streamer_out2;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  valid <= FFT_streamer_out2_1;

  outputgen3: FOR k IN 0 TO 31 GENERATE
    FFT_streamer_out1_re_signed(k) <= signed(FFT_streamer_out1_re(k));
  END GENERATE;

  outputgen2: FOR k IN 0 TO 31 GENERATE
    FFT_streamer_out1_im_signed(k) <= signed(FFT_streamer_out1_im(k));
  END GENERATE;

  delayMatch1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayMatch1_reg_re(0) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(0) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(1) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(1) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(2) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(2) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(3) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(3) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(4) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(4) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(5) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(5) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(6) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(6) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(7) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(7) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(8) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(8) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(9) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(9) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(10) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(10) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(11) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(11) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(12) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(12) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(13) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(13) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(14) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(14) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(15) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(15) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(16) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(16) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(17) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(17) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(18) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(18) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(19) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(19) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(20) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(20) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(21) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(21) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(22) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(22) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(23) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(23) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(24) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(24) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(25) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(25) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(26) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(26) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(27) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(27) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(28) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(28) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(29) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(29) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(30) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(30) <= to_signed(16#000#, 12);
      delayMatch1_reg_re(31) <= to_signed(16#000#, 12);
      delayMatch1_reg_im(31) <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_0 = '1' THEN
        delayMatch1_reg_re(0) <= delayMatch1_reg_next_re(0);
        delayMatch1_reg_im(0) <= delayMatch1_reg_next_im(0);
        delayMatch1_reg_re(1) <= delayMatch1_reg_next_re(1);
        delayMatch1_reg_im(1) <= delayMatch1_reg_next_im(1);
        delayMatch1_reg_re(2) <= delayMatch1_reg_next_re(2);
        delayMatch1_reg_im(2) <= delayMatch1_reg_next_im(2);
        delayMatch1_reg_re(3) <= delayMatch1_reg_next_re(3);
        delayMatch1_reg_im(3) <= delayMatch1_reg_next_im(3);
        delayMatch1_reg_re(4) <= delayMatch1_reg_next_re(4);
        delayMatch1_reg_im(4) <= delayMatch1_reg_next_im(4);
        delayMatch1_reg_re(5) <= delayMatch1_reg_next_re(5);
        delayMatch1_reg_im(5) <= delayMatch1_reg_next_im(5);
        delayMatch1_reg_re(6) <= delayMatch1_reg_next_re(6);
        delayMatch1_reg_im(6) <= delayMatch1_reg_next_im(6);
        delayMatch1_reg_re(7) <= delayMatch1_reg_next_re(7);
        delayMatch1_reg_im(7) <= delayMatch1_reg_next_im(7);
        delayMatch1_reg_re(8) <= delayMatch1_reg_next_re(8);
        delayMatch1_reg_im(8) <= delayMatch1_reg_next_im(8);
        delayMatch1_reg_re(9) <= delayMatch1_reg_next_re(9);
        delayMatch1_reg_im(9) <= delayMatch1_reg_next_im(9);
        delayMatch1_reg_re(10) <= delayMatch1_reg_next_re(10);
        delayMatch1_reg_im(10) <= delayMatch1_reg_next_im(10);
        delayMatch1_reg_re(11) <= delayMatch1_reg_next_re(11);
        delayMatch1_reg_im(11) <= delayMatch1_reg_next_im(11);
        delayMatch1_reg_re(12) <= delayMatch1_reg_next_re(12);
        delayMatch1_reg_im(12) <= delayMatch1_reg_next_im(12);
        delayMatch1_reg_re(13) <= delayMatch1_reg_next_re(13);
        delayMatch1_reg_im(13) <= delayMatch1_reg_next_im(13);
        delayMatch1_reg_re(14) <= delayMatch1_reg_next_re(14);
        delayMatch1_reg_im(14) <= delayMatch1_reg_next_im(14);
        delayMatch1_reg_re(15) <= delayMatch1_reg_next_re(15);
        delayMatch1_reg_im(15) <= delayMatch1_reg_next_im(15);
        delayMatch1_reg_re(16) <= delayMatch1_reg_next_re(16);
        delayMatch1_reg_im(16) <= delayMatch1_reg_next_im(16);
        delayMatch1_reg_re(17) <= delayMatch1_reg_next_re(17);
        delayMatch1_reg_im(17) <= delayMatch1_reg_next_im(17);
        delayMatch1_reg_re(18) <= delayMatch1_reg_next_re(18);
        delayMatch1_reg_im(18) <= delayMatch1_reg_next_im(18);
        delayMatch1_reg_re(19) <= delayMatch1_reg_next_re(19);
        delayMatch1_reg_im(19) <= delayMatch1_reg_next_im(19);
        delayMatch1_reg_re(20) <= delayMatch1_reg_next_re(20);
        delayMatch1_reg_im(20) <= delayMatch1_reg_next_im(20);
        delayMatch1_reg_re(21) <= delayMatch1_reg_next_re(21);
        delayMatch1_reg_im(21) <= delayMatch1_reg_next_im(21);
        delayMatch1_reg_re(22) <= delayMatch1_reg_next_re(22);
        delayMatch1_reg_im(22) <= delayMatch1_reg_next_im(22);
        delayMatch1_reg_re(23) <= delayMatch1_reg_next_re(23);
        delayMatch1_reg_im(23) <= delayMatch1_reg_next_im(23);
        delayMatch1_reg_re(24) <= delayMatch1_reg_next_re(24);
        delayMatch1_reg_im(24) <= delayMatch1_reg_next_im(24);
        delayMatch1_reg_re(25) <= delayMatch1_reg_next_re(25);
        delayMatch1_reg_im(25) <= delayMatch1_reg_next_im(25);
        delayMatch1_reg_re(26) <= delayMatch1_reg_next_re(26);
        delayMatch1_reg_im(26) <= delayMatch1_reg_next_im(26);
        delayMatch1_reg_re(27) <= delayMatch1_reg_next_re(27);
        delayMatch1_reg_im(27) <= delayMatch1_reg_next_im(27);
        delayMatch1_reg_re(28) <= delayMatch1_reg_next_re(28);
        delayMatch1_reg_im(28) <= delayMatch1_reg_next_im(28);
        delayMatch1_reg_re(29) <= delayMatch1_reg_next_re(29);
        delayMatch1_reg_im(29) <= delayMatch1_reg_next_im(29);
        delayMatch1_reg_re(30) <= delayMatch1_reg_next_re(30);
        delayMatch1_reg_im(30) <= delayMatch1_reg_next_im(30);
        delayMatch1_reg_re(31) <= delayMatch1_reg_next_re(31);
        delayMatch1_reg_im(31) <= delayMatch1_reg_next_im(31);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  FFT_streamer_out1_re_1(0) <= delayMatch1_reg_re(0);
  FFT_streamer_out1_im_1(0) <= delayMatch1_reg_im(0);
  FFT_streamer_out1_re_1(1) <= delayMatch1_reg_re(1);
  FFT_streamer_out1_im_1(1) <= delayMatch1_reg_im(1);
  FFT_streamer_out1_re_1(2) <= delayMatch1_reg_re(2);
  FFT_streamer_out1_im_1(2) <= delayMatch1_reg_im(2);
  FFT_streamer_out1_re_1(3) <= delayMatch1_reg_re(3);
  FFT_streamer_out1_im_1(3) <= delayMatch1_reg_im(3);
  FFT_streamer_out1_re_1(4) <= delayMatch1_reg_re(4);
  FFT_streamer_out1_im_1(4) <= delayMatch1_reg_im(4);
  FFT_streamer_out1_re_1(5) <= delayMatch1_reg_re(5);
  FFT_streamer_out1_im_1(5) <= delayMatch1_reg_im(5);
  FFT_streamer_out1_re_1(6) <= delayMatch1_reg_re(6);
  FFT_streamer_out1_im_1(6) <= delayMatch1_reg_im(6);
  FFT_streamer_out1_re_1(7) <= delayMatch1_reg_re(7);
  FFT_streamer_out1_im_1(7) <= delayMatch1_reg_im(7);
  FFT_streamer_out1_re_1(8) <= delayMatch1_reg_re(8);
  FFT_streamer_out1_im_1(8) <= delayMatch1_reg_im(8);
  FFT_streamer_out1_re_1(9) <= delayMatch1_reg_re(9);
  FFT_streamer_out1_im_1(9) <= delayMatch1_reg_im(9);
  FFT_streamer_out1_re_1(10) <= delayMatch1_reg_re(10);
  FFT_streamer_out1_im_1(10) <= delayMatch1_reg_im(10);
  FFT_streamer_out1_re_1(11) <= delayMatch1_reg_re(11);
  FFT_streamer_out1_im_1(11) <= delayMatch1_reg_im(11);
  FFT_streamer_out1_re_1(12) <= delayMatch1_reg_re(12);
  FFT_streamer_out1_im_1(12) <= delayMatch1_reg_im(12);
  FFT_streamer_out1_re_1(13) <= delayMatch1_reg_re(13);
  FFT_streamer_out1_im_1(13) <= delayMatch1_reg_im(13);
  FFT_streamer_out1_re_1(14) <= delayMatch1_reg_re(14);
  FFT_streamer_out1_im_1(14) <= delayMatch1_reg_im(14);
  FFT_streamer_out1_re_1(15) <= delayMatch1_reg_re(15);
  FFT_streamer_out1_im_1(15) <= delayMatch1_reg_im(15);
  FFT_streamer_out1_re_1(16) <= delayMatch1_reg_re(16);
  FFT_streamer_out1_im_1(16) <= delayMatch1_reg_im(16);
  FFT_streamer_out1_re_1(17) <= delayMatch1_reg_re(17);
  FFT_streamer_out1_im_1(17) <= delayMatch1_reg_im(17);
  FFT_streamer_out1_re_1(18) <= delayMatch1_reg_re(18);
  FFT_streamer_out1_im_1(18) <= delayMatch1_reg_im(18);
  FFT_streamer_out1_re_1(19) <= delayMatch1_reg_re(19);
  FFT_streamer_out1_im_1(19) <= delayMatch1_reg_im(19);
  FFT_streamer_out1_re_1(20) <= delayMatch1_reg_re(20);
  FFT_streamer_out1_im_1(20) <= delayMatch1_reg_im(20);
  FFT_streamer_out1_re_1(21) <= delayMatch1_reg_re(21);
  FFT_streamer_out1_im_1(21) <= delayMatch1_reg_im(21);
  FFT_streamer_out1_re_1(22) <= delayMatch1_reg_re(22);
  FFT_streamer_out1_im_1(22) <= delayMatch1_reg_im(22);
  FFT_streamer_out1_re_1(23) <= delayMatch1_reg_re(23);
  FFT_streamer_out1_im_1(23) <= delayMatch1_reg_im(23);
  FFT_streamer_out1_re_1(24) <= delayMatch1_reg_re(24);
  FFT_streamer_out1_im_1(24) <= delayMatch1_reg_im(24);
  FFT_streamer_out1_re_1(25) <= delayMatch1_reg_re(25);
  FFT_streamer_out1_im_1(25) <= delayMatch1_reg_im(25);
  FFT_streamer_out1_re_1(26) <= delayMatch1_reg_re(26);
  FFT_streamer_out1_im_1(26) <= delayMatch1_reg_im(26);
  FFT_streamer_out1_re_1(27) <= delayMatch1_reg_re(27);
  FFT_streamer_out1_im_1(27) <= delayMatch1_reg_im(27);
  FFT_streamer_out1_re_1(28) <= delayMatch1_reg_re(28);
  FFT_streamer_out1_im_1(28) <= delayMatch1_reg_im(28);
  FFT_streamer_out1_re_1(29) <= delayMatch1_reg_re(29);
  FFT_streamer_out1_im_1(29) <= delayMatch1_reg_im(29);
  FFT_streamer_out1_re_1(30) <= delayMatch1_reg_re(30);
  FFT_streamer_out1_im_1(30) <= delayMatch1_reg_im(30);
  FFT_streamer_out1_re_1(31) <= delayMatch1_reg_re(31);
  FFT_streamer_out1_im_1(31) <= delayMatch1_reg_im(31);
  delayMatch1_reg_next_re(0) <= FFT_streamer_out1_re_signed(0);
  delayMatch1_reg_next_im(0) <= FFT_streamer_out1_im_signed(0);
  delayMatch1_reg_next_re(1) <= FFT_streamer_out1_re_signed(1);
  delayMatch1_reg_next_im(1) <= FFT_streamer_out1_im_signed(1);
  delayMatch1_reg_next_re(2) <= FFT_streamer_out1_re_signed(2);
  delayMatch1_reg_next_im(2) <= FFT_streamer_out1_im_signed(2);
  delayMatch1_reg_next_re(3) <= FFT_streamer_out1_re_signed(3);
  delayMatch1_reg_next_im(3) <= FFT_streamer_out1_im_signed(3);
  delayMatch1_reg_next_re(4) <= FFT_streamer_out1_re_signed(4);
  delayMatch1_reg_next_im(4) <= FFT_streamer_out1_im_signed(4);
  delayMatch1_reg_next_re(5) <= FFT_streamer_out1_re_signed(5);
  delayMatch1_reg_next_im(5) <= FFT_streamer_out1_im_signed(5);
  delayMatch1_reg_next_re(6) <= FFT_streamer_out1_re_signed(6);
  delayMatch1_reg_next_im(6) <= FFT_streamer_out1_im_signed(6);
  delayMatch1_reg_next_re(7) <= FFT_streamer_out1_re_signed(7);
  delayMatch1_reg_next_im(7) <= FFT_streamer_out1_im_signed(7);
  delayMatch1_reg_next_re(8) <= FFT_streamer_out1_re_signed(8);
  delayMatch1_reg_next_im(8) <= FFT_streamer_out1_im_signed(8);
  delayMatch1_reg_next_re(9) <= FFT_streamer_out1_re_signed(9);
  delayMatch1_reg_next_im(9) <= FFT_streamer_out1_im_signed(9);
  delayMatch1_reg_next_re(10) <= FFT_streamer_out1_re_signed(10);
  delayMatch1_reg_next_im(10) <= FFT_streamer_out1_im_signed(10);
  delayMatch1_reg_next_re(11) <= FFT_streamer_out1_re_signed(11);
  delayMatch1_reg_next_im(11) <= FFT_streamer_out1_im_signed(11);
  delayMatch1_reg_next_re(12) <= FFT_streamer_out1_re_signed(12);
  delayMatch1_reg_next_im(12) <= FFT_streamer_out1_im_signed(12);
  delayMatch1_reg_next_re(13) <= FFT_streamer_out1_re_signed(13);
  delayMatch1_reg_next_im(13) <= FFT_streamer_out1_im_signed(13);
  delayMatch1_reg_next_re(14) <= FFT_streamer_out1_re_signed(14);
  delayMatch1_reg_next_im(14) <= FFT_streamer_out1_im_signed(14);
  delayMatch1_reg_next_re(15) <= FFT_streamer_out1_re_signed(15);
  delayMatch1_reg_next_im(15) <= FFT_streamer_out1_im_signed(15);
  delayMatch1_reg_next_re(16) <= FFT_streamer_out1_re_signed(16);
  delayMatch1_reg_next_im(16) <= FFT_streamer_out1_im_signed(16);
  delayMatch1_reg_next_re(17) <= FFT_streamer_out1_re_signed(17);
  delayMatch1_reg_next_im(17) <= FFT_streamer_out1_im_signed(17);
  delayMatch1_reg_next_re(18) <= FFT_streamer_out1_re_signed(18);
  delayMatch1_reg_next_im(18) <= FFT_streamer_out1_im_signed(18);
  delayMatch1_reg_next_re(19) <= FFT_streamer_out1_re_signed(19);
  delayMatch1_reg_next_im(19) <= FFT_streamer_out1_im_signed(19);
  delayMatch1_reg_next_re(20) <= FFT_streamer_out1_re_signed(20);
  delayMatch1_reg_next_im(20) <= FFT_streamer_out1_im_signed(20);
  delayMatch1_reg_next_re(21) <= FFT_streamer_out1_re_signed(21);
  delayMatch1_reg_next_im(21) <= FFT_streamer_out1_im_signed(21);
  delayMatch1_reg_next_re(22) <= FFT_streamer_out1_re_signed(22);
  delayMatch1_reg_next_im(22) <= FFT_streamer_out1_im_signed(22);
  delayMatch1_reg_next_re(23) <= FFT_streamer_out1_re_signed(23);
  delayMatch1_reg_next_im(23) <= FFT_streamer_out1_im_signed(23);
  delayMatch1_reg_next_re(24) <= FFT_streamer_out1_re_signed(24);
  delayMatch1_reg_next_im(24) <= FFT_streamer_out1_im_signed(24);
  delayMatch1_reg_next_re(25) <= FFT_streamer_out1_re_signed(25);
  delayMatch1_reg_next_im(25) <= FFT_streamer_out1_im_signed(25);
  delayMatch1_reg_next_re(26) <= FFT_streamer_out1_re_signed(26);
  delayMatch1_reg_next_im(26) <= FFT_streamer_out1_im_signed(26);
  delayMatch1_reg_next_re(27) <= FFT_streamer_out1_re_signed(27);
  delayMatch1_reg_next_im(27) <= FFT_streamer_out1_im_signed(27);
  delayMatch1_reg_next_re(28) <= FFT_streamer_out1_re_signed(28);
  delayMatch1_reg_next_im(28) <= FFT_streamer_out1_im_signed(28);
  delayMatch1_reg_next_re(29) <= FFT_streamer_out1_re_signed(29);
  delayMatch1_reg_next_im(29) <= FFT_streamer_out1_im_signed(29);
  delayMatch1_reg_next_re(30) <= FFT_streamer_out1_re_signed(30);
  delayMatch1_reg_next_im(30) <= FFT_streamer_out1_im_signed(30);
  delayMatch1_reg_next_re(31) <= FFT_streamer_out1_re_signed(31);
  delayMatch1_reg_next_im(31) <= FFT_streamer_out1_im_signed(31);

  outputgen1: FOR k IN 0 TO 31 GENERATE
    fft_data_re(k) <= std_logic_vector(FFT_streamer_out1_re_1(k));
  END GENERATE;

  outputgen: FOR k IN 0 TO 31 GENERATE
    fft_data_im(k) <= std_logic_vector(FFT_streamer_out1_im_1(k));
  END GENERATE;

  frequency_max_out1_unsigned <= unsigned(frequency_max_out1);

  crp_delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      frequency_max_out1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        frequency_max_out1_1 <= frequency_max_out1_unsigned;
      END IF;
    END IF;
  END PROCESS crp_delay_process;


  RateTransition_bypass_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      RateTransition_bypass_reg <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_32_1 = '1' THEN
        RateTransition_bypass_reg <= frequency_max_out1_1;
      END IF;
    END IF;
  END PROCESS RateTransition_bypass_process;

  
  frequency_max_out1_2 <= frequency_max_out1_1 WHEN enb_1_32_1 = '1' ELSE
      RateTransition_bypass_reg;

  index_max <= std_logic_vector(frequency_max_out1_2);

  ce_out <= enb_1_32_1;

  f_max <= frequency_max_out2;

END rtl;
