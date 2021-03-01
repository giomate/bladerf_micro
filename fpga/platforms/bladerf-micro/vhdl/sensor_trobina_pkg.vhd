-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency_index\max_index_frequency_pkg.vhd
-- Created: 2020-12-31 16:37:02
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE sensor_trobina_pkg IS

constant RX_DATA_WIDTH         : natural := 12;    -- write side data width
--  TYPE vector_of_signed12 IS ARRAY (NATURAL RANGE <>) OF signed(RX_DATA_WIDTH-1 DOWNTO 0);
--  TYPE vector_of_std_logic_vector12 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(RX_DATA_WIDTH-1 DOWNTO 0);
 -- TYPE vector_of_std_logic_vector13 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(12 DOWNTO 0);
--  TYPE vector_of_unsigned32 IS ARRAY (NATURAL RANGE <>) OF unsigned(31 DOWNTO 0);
 -- TYPE vector_of_signed13 IS ARRAY (NATURAL RANGE <>) OF signed(12 DOWNTO 0);

 type rx_complex_t is record
    re    :   std_logic_vector(RX_DATA_WIDTH-1 DOWNTO 0);
    im    :   std_logic_vector(RX_DATA_WIDTH-1 DOWNTO 0);
end record;

type rx_buffers_t is array( natural range <> ) of rx_complex_t;

END sensor_trobina_pkg;
