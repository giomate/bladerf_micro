-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency_index\CordicKernelMag_block5.vhd
-- Created: 2021-01-03 10:20:46
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: CordicKernelMag_block5
-- Source Path: max_frequency_index/max_index_frequency/frequency_max/index_finder/for_each/magnitud_fft/CordicKernelMag
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY CordicKernelMag_block5 IS
  PORT( xin                               :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
        yin                               :   IN    std_logic_vector(12 DOWNTO 0);  -- sfix13
        idx                               :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix5
        xout                              :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
        yout                              :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13
        );
END CordicKernelMag_block5;


ARCHITECTURE rtl OF CordicKernelMag_block5 IS

  -- Signals
  SIGNAL yin_signed                       : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yLessThanZero                    : std_logic;
  SIGNAL xin_signed                       : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL idx_unsigned                     : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL yShifted                         : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout2                            : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout1                            : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xout_tmp                         : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL xShifted                         : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout2                            : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout1                            : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL yout_tmp                         : signed(12 DOWNTO 0);  -- sfix13

BEGIN
  yin_signed <= signed(yin);

  
  yLessThanZero <= '1' WHEN yin_signed < to_signed(16#0000#, 13) ELSE
      '0';

  xin_signed <= signed(xin);

  idx_unsigned <= unsigned(idx);

  yShifted <= SHIFT_RIGHT(yin_signed, to_integer(idx_unsigned));

  xout2 <= xin_signed + yShifted;

  xout1 <= xin_signed - yShifted;

  
  xout_tmp <= xout2 WHEN yLessThanZero = '0' ELSE
      xout1;

  xout <= std_logic_vector(xout_tmp);

  xShifted <= SHIFT_RIGHT(xin_signed, to_integer(idx_unsigned));

  yout2 <= yin_signed - xShifted;

  yout1 <= yin_signed + xShifted;

  
  yout_tmp <= yout2 WHEN yLessThanZero = '0' ELSE
      yout1;

  yout <= std_logic_vector(yout_tmp);

END rtl;

