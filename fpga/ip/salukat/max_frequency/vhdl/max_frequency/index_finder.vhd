-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency\index_finder.vhd
-- Created: 2020-12-29 17:32:44
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: index_finder
-- Source Path: max_frequency/max_frequency/frequency_max/index_finder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.max_frequency_pkg.ALL;

ENTITY index_finder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_32_0                        :   IN    std_logic;
        enable                            :   IN    std_logic;
        fft_data_re                       :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        fft_data_im                       :   IN    vector_of_std_logic_vector12(0 TO 31);  -- sfix12 [32]
        index_max                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        index_max1                        :   OUT   std_logic
        );
END index_finder;


ARCHITECTURE rtl OF index_finder IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT for_each
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_32_0                      :   IN    std_logic;
          fft_data_re                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          fft_data_im                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12
          enable                          :   IN    std_logic;
          Out1                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13
          Out2                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT Maximum
    PORT( in0                             :   IN    vector_of_std_logic_vector13(0 TO 31);  -- sfix13 [32]
          out0                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : for_each
    USE ENTITY work.for_each(rtl);

  FOR ALL : Maximum
    USE ENTITY work.Maximum(rtl);

  -- Signals
  SIGNAL fft_data_re_signed               : vector_of_std_logic_vector12(0 TO 31);  -- ufix12 [32]
  SIGNAL fft_data_im_signed               : vector_of_std_logic_vector12(0 TO 31);  -- ufix12 [32]
  SIGNAL magnitud_fft_out1_0              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_0              : std_logic;
  SIGNAL magnitud_fft_out1_1              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_1              : std_logic;
  SIGNAL magnitud_fft_out1_2              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_2              : std_logic;
  SIGNAL magnitud_fft_out1_3              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_3              : std_logic;
  SIGNAL magnitud_fft_out1_4              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_4              : std_logic;
  SIGNAL magnitud_fft_out1_5              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_5              : std_logic;
  SIGNAL magnitud_fft_out1_6              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_6              : std_logic;
  SIGNAL magnitud_fft_out1_7              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_7              : std_logic;
  SIGNAL magnitud_fft_out1_8              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_8              : std_logic;
  SIGNAL magnitud_fft_out1_9              : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_9              : std_logic;
  SIGNAL magnitud_fft_out1_10             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_10             : std_logic;
  SIGNAL magnitud_fft_out1_11             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_11             : std_logic;
  SIGNAL magnitud_fft_out1_12             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_12             : std_logic;
  SIGNAL magnitud_fft_out1_13             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_13             : std_logic;
  SIGNAL magnitud_fft_out1_14             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_14             : std_logic;
  SIGNAL magnitud_fft_out1_15             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_15             : std_logic;
  SIGNAL magnitud_fft_out1_16             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_16             : std_logic;
  SIGNAL magnitud_fft_out1_17             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_17             : std_logic;
  SIGNAL magnitud_fft_out1_18             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_18             : std_logic;
  SIGNAL magnitud_fft_out1_19             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_19             : std_logic;
  SIGNAL magnitud_fft_out1_20             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_20             : std_logic;
  SIGNAL magnitud_fft_out1_21             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_21             : std_logic;
  SIGNAL magnitud_fft_out1_22             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_22             : std_logic;
  SIGNAL magnitud_fft_out1_23             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_23             : std_logic;
  SIGNAL magnitud_fft_out1_24             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_24             : std_logic;
  SIGNAL magnitud_fft_out1_25             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_25             : std_logic;
  SIGNAL magnitud_fft_out1_26             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_26             : std_logic;
  SIGNAL magnitud_fft_out1_27             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_27             : std_logic;
  SIGNAL magnitud_fft_out1_28             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_28             : std_logic;
  SIGNAL magnitud_fft_out1_29             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_29             : std_logic;
  SIGNAL magnitud_fft_out1_30             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_30             : std_logic;
  SIGNAL magnitud_fft_out1_31             : std_logic_vector(12 DOWNTO 0);  -- ufix13
  SIGNAL magnitud_fft_out2_31             : std_logic;
  SIGNAL for_each_out1                    : vector_of_signed13(0 TO 31);  -- sfix13 [32]
  SIGNAL for_each_out1_1                  : vector_of_std_logic_vector13(0 TO 31);  -- ufix13 [32]
  SIGNAL Maximum_out1                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Maximum_out1_unsigned            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Index_Vector_dtc_comp_out        : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL for_each_out2                    : std_logic_vector(0 TO 31);  -- boolean [32]
  SIGNAL Index_Vector_out1                : std_logic;

BEGIN
  u_for_each_instance1 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(0),  -- sfix12
              fft_data_im => fft_data_im_signed(0),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_0,  -- sfix13
              Out2 => magnitud_fft_out2_0
              );

  u_for_each_instance2 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(1),  -- sfix12
              fft_data_im => fft_data_im_signed(1),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_1,  -- sfix13
              Out2 => magnitud_fft_out2_1
              );

  u_for_each_instance3 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(2),  -- sfix12
              fft_data_im => fft_data_im_signed(2),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_2,  -- sfix13
              Out2 => magnitud_fft_out2_2
              );

  u_for_each_instance4 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(3),  -- sfix12
              fft_data_im => fft_data_im_signed(3),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_3,  -- sfix13
              Out2 => magnitud_fft_out2_3
              );

  u_for_each_instance5 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(4),  -- sfix12
              fft_data_im => fft_data_im_signed(4),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_4,  -- sfix13
              Out2 => magnitud_fft_out2_4
              );

  u_for_each_instance6 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(5),  -- sfix12
              fft_data_im => fft_data_im_signed(5),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_5,  -- sfix13
              Out2 => magnitud_fft_out2_5
              );

  u_for_each_instance7 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(6),  -- sfix12
              fft_data_im => fft_data_im_signed(6),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_6,  -- sfix13
              Out2 => magnitud_fft_out2_6
              );

  u_for_each_instance8 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(7),  -- sfix12
              fft_data_im => fft_data_im_signed(7),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_7,  -- sfix13
              Out2 => magnitud_fft_out2_7
              );

  u_for_each_instance9 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(8),  -- sfix12
              fft_data_im => fft_data_im_signed(8),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_8,  -- sfix13
              Out2 => magnitud_fft_out2_8
              );

  u_for_each_instance10 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(9),  -- sfix12
              fft_data_im => fft_data_im_signed(9),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_9,  -- sfix13
              Out2 => magnitud_fft_out2_9
              );

  u_for_each_instance11 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(10),  -- sfix12
              fft_data_im => fft_data_im_signed(10),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_10,  -- sfix13
              Out2 => magnitud_fft_out2_10
              );

  u_for_each_instance12 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(11),  -- sfix12
              fft_data_im => fft_data_im_signed(11),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_11,  -- sfix13
              Out2 => magnitud_fft_out2_11
              );

  u_for_each_instance13 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(12),  -- sfix12
              fft_data_im => fft_data_im_signed(12),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_12,  -- sfix13
              Out2 => magnitud_fft_out2_12
              );

  u_for_each_instance14 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(13),  -- sfix12
              fft_data_im => fft_data_im_signed(13),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_13,  -- sfix13
              Out2 => magnitud_fft_out2_13
              );

  u_for_each_instance15 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(14),  -- sfix12
              fft_data_im => fft_data_im_signed(14),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_14,  -- sfix13
              Out2 => magnitud_fft_out2_14
              );

  u_for_each_instance16 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(15),  -- sfix12
              fft_data_im => fft_data_im_signed(15),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_15,  -- sfix13
              Out2 => magnitud_fft_out2_15
              );

  u_for_each_instance17 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(16),  -- sfix12
              fft_data_im => fft_data_im_signed(16),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_16,  -- sfix13
              Out2 => magnitud_fft_out2_16
              );

  u_for_each_instance18 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(17),  -- sfix12
              fft_data_im => fft_data_im_signed(17),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_17,  -- sfix13
              Out2 => magnitud_fft_out2_17
              );

  u_for_each_instance19 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(18),  -- sfix12
              fft_data_im => fft_data_im_signed(18),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_18,  -- sfix13
              Out2 => magnitud_fft_out2_18
              );

  u_for_each_instance20 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(19),  -- sfix12
              fft_data_im => fft_data_im_signed(19),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_19,  -- sfix13
              Out2 => magnitud_fft_out2_19
              );

  u_for_each_instance21 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(20),  -- sfix12
              fft_data_im => fft_data_im_signed(20),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_20,  -- sfix13
              Out2 => magnitud_fft_out2_20
              );

  u_for_each_instance22 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(21),  -- sfix12
              fft_data_im => fft_data_im_signed(21),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_21,  -- sfix13
              Out2 => magnitud_fft_out2_21
              );

  u_for_each_instance23 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(22),  -- sfix12
              fft_data_im => fft_data_im_signed(22),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_22,  -- sfix13
              Out2 => magnitud_fft_out2_22
              );

  u_for_each_instance24 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(23),  -- sfix12
              fft_data_im => fft_data_im_signed(23),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_23,  -- sfix13
              Out2 => magnitud_fft_out2_23
              );

  u_for_each_instance25 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(24),  -- sfix12
              fft_data_im => fft_data_im_signed(24),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_24,  -- sfix13
              Out2 => magnitud_fft_out2_24
              );

  u_for_each_instance26 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(25),  -- sfix12
              fft_data_im => fft_data_im_signed(25),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_25,  -- sfix13
              Out2 => magnitud_fft_out2_25
              );

  u_for_each_instance27 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(26),  -- sfix12
              fft_data_im => fft_data_im_signed(26),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_26,  -- sfix13
              Out2 => magnitud_fft_out2_26
              );

  u_for_each_instance28 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(27),  -- sfix12
              fft_data_im => fft_data_im_signed(27),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_27,  -- sfix13
              Out2 => magnitud_fft_out2_27
              );

  u_for_each_instance29 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(28),  -- sfix12
              fft_data_im => fft_data_im_signed(28),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_28,  -- sfix13
              Out2 => magnitud_fft_out2_28
              );

  u_for_each_instance30 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(29),  -- sfix12
              fft_data_im => fft_data_im_signed(29),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_29,  -- sfix13
              Out2 => magnitud_fft_out2_29
              );

  u_for_each_instance31 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(30),  -- sfix12
              fft_data_im => fft_data_im_signed(30),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_30,  -- sfix13
              Out2 => magnitud_fft_out2_30
              );

  u_for_each_instance32 : for_each
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_32_0 => enb_1_32_0,
              fft_data_re => fft_data_re_signed(31),  -- sfix12
              fft_data_im => fft_data_im_signed(31),  -- sfix12
              enable => enable,
              Out1 => magnitud_fft_out1_31,  -- sfix13
              Out2 => magnitud_fft_out2_31
              );

  u_max_frequency_max_frequency_frequency_max_index_finder_Maximum : Maximum
    PORT MAP( in0 => for_each_out1_1,  -- sfix13 [32]
              out0 => Maximum_out1  -- uint32
              );

  fft_data_re_signed <= fft_data_re;

  fft_data_im_signed <= fft_data_im;

  for_each_out1(0) <= signed(magnitud_fft_out1_0);
  for_each_out1(1) <= signed(magnitud_fft_out1_1);
  for_each_out1(2) <= signed(magnitud_fft_out1_2);
  for_each_out1(3) <= signed(magnitud_fft_out1_3);
  for_each_out1(4) <= signed(magnitud_fft_out1_4);
  for_each_out1(5) <= signed(magnitud_fft_out1_5);
  for_each_out1(6) <= signed(magnitud_fft_out1_6);
  for_each_out1(7) <= signed(magnitud_fft_out1_7);
  for_each_out1(8) <= signed(magnitud_fft_out1_8);
  for_each_out1(9) <= signed(magnitud_fft_out1_9);
  for_each_out1(10) <= signed(magnitud_fft_out1_10);
  for_each_out1(11) <= signed(magnitud_fft_out1_11);
  for_each_out1(12) <= signed(magnitud_fft_out1_12);
  for_each_out1(13) <= signed(magnitud_fft_out1_13);
  for_each_out1(14) <= signed(magnitud_fft_out1_14);
  for_each_out1(15) <= signed(magnitud_fft_out1_15);
  for_each_out1(16) <= signed(magnitud_fft_out1_16);
  for_each_out1(17) <= signed(magnitud_fft_out1_17);
  for_each_out1(18) <= signed(magnitud_fft_out1_18);
  for_each_out1(19) <= signed(magnitud_fft_out1_19);
  for_each_out1(20) <= signed(magnitud_fft_out1_20);
  for_each_out1(21) <= signed(magnitud_fft_out1_21);
  for_each_out1(22) <= signed(magnitud_fft_out1_22);
  for_each_out1(23) <= signed(magnitud_fft_out1_23);
  for_each_out1(24) <= signed(magnitud_fft_out1_24);
  for_each_out1(25) <= signed(magnitud_fft_out1_25);
  for_each_out1(26) <= signed(magnitud_fft_out1_26);
  for_each_out1(27) <= signed(magnitud_fft_out1_27);
  for_each_out1(28) <= signed(magnitud_fft_out1_28);
  for_each_out1(29) <= signed(magnitud_fft_out1_29);
  for_each_out1(30) <= signed(magnitud_fft_out1_30);
  for_each_out1(31) <= signed(magnitud_fft_out1_31);

  outputgen: FOR k IN 0 TO 31 GENERATE
    for_each_out1_1(k) <= std_logic_vector(for_each_out1(k));
  END GENERATE;

  Maximum_out1_unsigned <= unsigned(Maximum_out1);

  Index_Vector_dtc_comp_out <= Maximum_out1_unsigned(4 DOWNTO 0);

  for_each_out2(0) <= magnitud_fft_out2_0;
  for_each_out2(1) <= magnitud_fft_out2_1;
  for_each_out2(2) <= magnitud_fft_out2_2;
  for_each_out2(3) <= magnitud_fft_out2_3;
  for_each_out2(4) <= magnitud_fft_out2_4;
  for_each_out2(5) <= magnitud_fft_out2_5;
  for_each_out2(6) <= magnitud_fft_out2_6;
  for_each_out2(7) <= magnitud_fft_out2_7;
  for_each_out2(8) <= magnitud_fft_out2_8;
  for_each_out2(9) <= magnitud_fft_out2_9;
  for_each_out2(10) <= magnitud_fft_out2_10;
  for_each_out2(11) <= magnitud_fft_out2_11;
  for_each_out2(12) <= magnitud_fft_out2_12;
  for_each_out2(13) <= magnitud_fft_out2_13;
  for_each_out2(14) <= magnitud_fft_out2_14;
  for_each_out2(15) <= magnitud_fft_out2_15;
  for_each_out2(16) <= magnitud_fft_out2_16;
  for_each_out2(17) <= magnitud_fft_out2_17;
  for_each_out2(18) <= magnitud_fft_out2_18;
  for_each_out2(19) <= magnitud_fft_out2_19;
  for_each_out2(20) <= magnitud_fft_out2_20;
  for_each_out2(21) <= magnitud_fft_out2_21;
  for_each_out2(22) <= magnitud_fft_out2_22;
  for_each_out2(23) <= magnitud_fft_out2_23;
  for_each_out2(24) <= magnitud_fft_out2_24;
  for_each_out2(25) <= magnitud_fft_out2_25;
  for_each_out2(26) <= magnitud_fft_out2_26;
  for_each_out2(27) <= magnitud_fft_out2_27;
  for_each_out2(28) <= magnitud_fft_out2_28;
  for_each_out2(29) <= magnitud_fft_out2_29;
  for_each_out2(30) <= magnitud_fft_out2_30;
  for_each_out2(31) <= magnitud_fft_out2_31;

  
  Index_Vector_out1 <= for_each_out2(0) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#00#, 5) ELSE
      for_each_out2(1) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#01#, 5) ELSE
      for_each_out2(2) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#02#, 5) ELSE
      for_each_out2(3) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#03#, 5) ELSE
      for_each_out2(4) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#04#, 5) ELSE
      for_each_out2(5) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#05#, 5) ELSE
      for_each_out2(6) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#06#, 5) ELSE
      for_each_out2(7) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#07#, 5) ELSE
      for_each_out2(8) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#08#, 5) ELSE
      for_each_out2(9) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#09#, 5) ELSE
      for_each_out2(10) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#0A#, 5) ELSE
      for_each_out2(11) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#0B#, 5) ELSE
      for_each_out2(12) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#0C#, 5) ELSE
      for_each_out2(13) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#0D#, 5) ELSE
      for_each_out2(14) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#0E#, 5) ELSE
      for_each_out2(15) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#0F#, 5) ELSE
      for_each_out2(16) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#10#, 5) ELSE
      for_each_out2(17) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#11#, 5) ELSE
      for_each_out2(18) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#12#, 5) ELSE
      for_each_out2(19) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#13#, 5) ELSE
      for_each_out2(20) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#14#, 5) ELSE
      for_each_out2(21) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#15#, 5) ELSE
      for_each_out2(22) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#16#, 5) ELSE
      for_each_out2(23) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#17#, 5) ELSE
      for_each_out2(24) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#18#, 5) ELSE
      for_each_out2(25) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#19#, 5) ELSE
      for_each_out2(26) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#1A#, 5) ELSE
      for_each_out2(27) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#1B#, 5) ELSE
      for_each_out2(28) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#1C#, 5) ELSE
      for_each_out2(29) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#1D#, 5) ELSE
      for_each_out2(30) WHEN Index_Vector_dtc_comp_out = to_unsigned(16#1E#, 5) ELSE
      for_each_out2(31);

  index_max1 <= Index_Vector_out1;

  index_max <= Maximum_out1;

END rtl;

