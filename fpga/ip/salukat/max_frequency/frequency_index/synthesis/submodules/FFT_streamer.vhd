-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency_index\FFT_streamer.vhd
-- Created: 2021-01-03 10:20:46
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: FFT_streamer
-- Source Path: max_frequency_index/max_index_frequency/FFT_streamer
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.max_index_frequency_pkg.ALL;

ENTITY FFT_streamer IS
  PORT( clk                               :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        In1_re                            :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        In1_im                            :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        In2                               :   IN    std_logic;
        Out1_re                           :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        Out1_im                           :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        Out2                              :   OUT   std_logic
        );
END FFT_streamer;


ARCHITECTURE rtl OF FFT_streamer IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT FFT_HDL_Optimized
    PORT( clk                             :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          dataIn_re                       :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          dataIn_im                       :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          dataOut_im                      :   OUT   vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : FFT_HDL_Optimized
    USE ENTITY work.FFT_HDL_Optimized(rtl);

  -- Signals
  SIGNAL FFT_HDL_Optimized_out1_re        : vector_of_std_logic_vector12(0 TO 31);  -- ufix12 [32]
  SIGNAL FFT_HDL_Optimized_out1_im        : vector_of_std_logic_vector12(0 TO 31);  -- ufix12 [32]
  SIGNAL FFT_HDL_Optimized_out2           : std_logic;

BEGIN
  u_FFT_HDL_Optimized : FFT_HDL_Optimized
    PORT MAP( clk => clk,
              enb_1_32_0 => enb_1_32_0,
              dataIn_re => In1_re,  -- sfix12 [32]
              dataIn_im => In1_im,  -- sfix12 [32]
              validIn => In2,
              dataOut_re => FFT_HDL_Optimized_out1_re,  -- sfix12 [32]
              dataOut_im => FFT_HDL_Optimized_out1_im,  -- sfix12 [32]
              validOut => FFT_HDL_Optimized_out2
              );

  Out2 <= FFT_HDL_Optimized_out2;

  Out1_re <= FFT_HDL_Optimized_out1_re;

  Out1_im <= FFT_HDL_Optimized_out1_im;

END rtl;

