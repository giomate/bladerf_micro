-- -------------------------------------------------------------
-- 
-- File Name: D:\Salukat\Development\Software\Quartus\BladeRF\hdl\fpga\ip\salukat\max_frequency\vhdl\max_frequency_reduced\TWDLROM_3_10.vhd
-- Created: 2020-12-29 12:17:31
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: TWDLROM_3_10
-- Source Path: max_frequency_reduced/max_frequency/FFT_streamer/FFT HDL Optimized/TWDLROM_3_10
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.max_frequency_pkg.ALL;

ENTITY TWDLROM_3_10 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        dout_2_vld                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        twdl_3_10_re                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_3_10_im                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_3_10_vld                     :   OUT   std_logic
        );
END TWDLROM_3_10;


ARCHITECTURE rtl OF TWDLROM_3_10 IS

  -- Constants
  CONSTANT Twiddle_re_table_data          : vector_of_signed12(0 TO 1) := 
    (to_signed(16#400#, 12), to_signed(16#3B2#, 12));  -- sfix12 [2]
  CONSTANT Twiddle_im_table_data          : vector_of_signed12(0 TO 1) := 
    (to_signed(16#000#, 12), to_signed(-16#188#, 12));  -- sfix12 [2]

  -- Signals
  SIGNAL Radix22TwdlMapping_cnt           : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Radix22TwdlMapping_phase         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Radix22TwdlMapping_octantReg1    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Radix22TwdlMapping_twdlAddr_raw  : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Radix22TwdlMapping_twdlAddrMap   : std_logic;  -- ufix1
  SIGNAL Radix22TwdlMapping_twdl45Reg     : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg1      : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg2      : std_logic;
  SIGNAL Radix22TwdlMapping_cnt_next      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Radix22TwdlMapping_phase_next    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Radix22TwdlMapping_octantReg1_next : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Radix22TwdlMapping_twdlAddr_raw_next : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Radix22TwdlMapping_twdlAddrMap_next : std_logic;  -- ufix1
  SIGNAL Radix22TwdlMapping_twdl45Reg_next : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg1_next : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg2_next : std_logic;
  SIGNAL twdlAddr                         : std_logic;  -- ufix1
  SIGNAL twdlAddrVld                      : std_logic;
  SIGNAL twdlOctant                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL twdl45                           : std_logic;
  SIGNAL Twiddle_re_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL twiddleS_re                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twiddleReg_re                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Twiddle_im_cast                  : signed(31 DOWNTO 0);  -- int32
  SIGNAL twiddleS_im                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twiddleReg_im                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdlOctantReg                    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL twdl45Reg                        : std_logic;
  SIGNAL twdl_3_10_re_tmp                 : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdl_3_10_im_tmp                 : signed(11 DOWNTO 0);  -- sfix12_En10

BEGIN
  -- Radix22TwdlMapping
  Radix22TwdlMapping_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22TwdlMapping_octantReg1 <= to_unsigned(16#0#, 3);
      Radix22TwdlMapping_twdlAddr_raw <= to_unsigned(16#0#, 4);
      Radix22TwdlMapping_twdlAddrMap <= '0';
      Radix22TwdlMapping_twdl45Reg <= '0';
      Radix22TwdlMapping_dvldReg1 <= '0';
      Radix22TwdlMapping_dvldReg2 <= '0';
      Radix22TwdlMapping_cnt <= to_unsigned(16#1#, 2);
      Radix22TwdlMapping_phase <= to_unsigned(16#2#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Radix22TwdlMapping_cnt <= Radix22TwdlMapping_cnt_next;
        Radix22TwdlMapping_phase <= Radix22TwdlMapping_phase_next;
        Radix22TwdlMapping_octantReg1 <= Radix22TwdlMapping_octantReg1_next;
        Radix22TwdlMapping_twdlAddr_raw <= Radix22TwdlMapping_twdlAddr_raw_next;
        Radix22TwdlMapping_twdlAddrMap <= Radix22TwdlMapping_twdlAddrMap_next;
        Radix22TwdlMapping_twdl45Reg <= Radix22TwdlMapping_twdl45Reg_next;
        Radix22TwdlMapping_dvldReg1 <= Radix22TwdlMapping_dvldReg1_next;
        Radix22TwdlMapping_dvldReg2 <= Radix22TwdlMapping_dvldReg2_next;
      END IF;
    END IF;
  END PROCESS Radix22TwdlMapping_process;

  Radix22TwdlMapping_output : PROCESS (Radix22TwdlMapping_cnt, Radix22TwdlMapping_dvldReg1,
       Radix22TwdlMapping_dvldReg2, Radix22TwdlMapping_octantReg1,
       Radix22TwdlMapping_phase, Radix22TwdlMapping_twdl45Reg,
       Radix22TwdlMapping_twdlAddrMap, Radix22TwdlMapping_twdlAddr_raw,
       dout_2_vld)
    VARIABLE octant : unsigned(2 DOWNTO 0);
    VARIABLE cnt_cast : unsigned(3 DOWNTO 0);
    VARIABLE sub_cast : signed(9 DOWNTO 0);
    VARIABLE sub_temp : signed(9 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(5 DOWNTO 0);
    VARIABLE sub_temp_0 : signed(5 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(5 DOWNTO 0);
    VARIABLE sub_temp_1 : signed(5 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(9 DOWNTO 0);
    VARIABLE sub_temp_2 : signed(9 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(9 DOWNTO 0);
    VARIABLE sub_temp_3 : signed(9 DOWNTO 0);
  BEGIN
    sub_temp := to_signed(16#000#, 10);
    sub_temp_0 := to_signed(16#00#, 6);
    sub_temp_1 := to_signed(16#00#, 6);
    sub_temp_2 := to_signed(16#000#, 10);
    sub_temp_3 := to_signed(16#000#, 10);
    cnt_cast := to_unsigned(16#0#, 4);
    sub_cast := to_signed(16#000#, 10);
    sub_cast_0 := to_signed(16#00#, 6);
    sub_cast_1 := to_signed(16#00#, 6);
    sub_cast_2 := to_signed(16#000#, 10);
    sub_cast_3 := to_signed(16#000#, 10);
    Radix22TwdlMapping_twdlAddr_raw_next <= Radix22TwdlMapping_twdlAddr_raw;
    Radix22TwdlMapping_twdlAddrMap_next <= Radix22TwdlMapping_twdlAddrMap;
    Radix22TwdlMapping_twdl45Reg_next <= Radix22TwdlMapping_twdl45Reg;
    Radix22TwdlMapping_dvldReg2_next <= Radix22TwdlMapping_dvldReg1;
    Radix22TwdlMapping_dvldReg1_next <= dout_2_vld;
    CASE Radix22TwdlMapping_twdlAddr_raw IS
      WHEN "0010" =>
        octant := to_unsigned(16#0#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN "0100" =>
        octant := to_unsigned(16#1#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
      WHEN "0110" =>
        octant := to_unsigned(16#2#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN "1000" =>
        octant := to_unsigned(16#3#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
      WHEN "1010" =>
        octant := to_unsigned(16#4#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN OTHERS => 
        octant := Radix22TwdlMapping_twdlAddr_raw(3 DOWNTO 1);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
    END CASE;
    Radix22TwdlMapping_octantReg1_next <= octant;
    CASE octant IS
      WHEN "000" =>
        Radix22TwdlMapping_twdlAddrMap_next <= Radix22TwdlMapping_twdlAddr_raw(0);
      WHEN "001" =>
        sub_cast_0 := signed(resize(Radix22TwdlMapping_twdlAddr_raw, 6));
        sub_temp_0 := to_signed(16#04#, 6) - sub_cast_0;
        Radix22TwdlMapping_twdlAddrMap_next <= sub_temp_0(0);
      WHEN "010" =>
        sub_cast_1 := signed(resize(Radix22TwdlMapping_twdlAddr_raw, 6));
        sub_temp_1 := sub_cast_1 - to_signed(16#04#, 6);
        Radix22TwdlMapping_twdlAddrMap_next <= sub_temp_1(0);
      WHEN "011" =>
        sub_cast_2 := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0', 10));
        sub_temp_2 := to_signed(16#010#, 10) - sub_cast_2;
        Radix22TwdlMapping_twdlAddrMap_next <= sub_temp_2(1);
      WHEN "100" =>
        sub_cast_3 := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0', 10));
        sub_temp_3 := sub_cast_3 - to_signed(16#010#, 10);
        Radix22TwdlMapping_twdlAddrMap_next <= sub_temp_3(1);
      WHEN OTHERS => 
        sub_cast := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0', 10));
        sub_temp := to_signed(16#018#, 10) - sub_cast;
        Radix22TwdlMapping_twdlAddrMap_next <= sub_temp(1);
    END CASE;
    IF Radix22TwdlMapping_phase = to_unsigned(16#0#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= to_unsigned(16#0#, 4);
    ELSIF Radix22TwdlMapping_phase = to_unsigned(16#1#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= resize(Radix22TwdlMapping_cnt, 4) sll 1;
    ELSIF Radix22TwdlMapping_phase = to_unsigned(16#2#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= resize(Radix22TwdlMapping_cnt, 4);
    ELSE 
      cnt_cast := resize(Radix22TwdlMapping_cnt, 4);
      Radix22TwdlMapping_twdlAddr_raw_next <= (cnt_cast sll 1) + cnt_cast;
    END IF;
    Radix22TwdlMapping_phase_next <= to_unsigned(16#2#, 2);
    Radix22TwdlMapping_cnt_next <= to_unsigned(16#1#, 2);
    twdlAddr <= Radix22TwdlMapping_twdlAddrMap;
    twdlAddrVld <= Radix22TwdlMapping_dvldReg2;
    twdlOctant <= Radix22TwdlMapping_octantReg1;
    twdl45 <= Radix22TwdlMapping_twdl45Reg;
  END PROCESS Radix22TwdlMapping_output;


  -- Twiddle ROM1
  Twiddle_re_cast <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & twdlAddr;
  twiddleS_re <= Twiddle_re_table_data(to_integer(Twiddle_re_cast));

  TWIDDLEROM_RE_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twiddleReg_re <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twiddleReg_re <= twiddleS_re;
      END IF;
    END IF;
  END PROCESS TWIDDLEROM_RE_process;


  -- Twiddle ROM2
  Twiddle_im_cast <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & twdlAddr;
  twiddleS_im <= Twiddle_im_table_data(to_integer(Twiddle_im_cast));

  TWIDDLEROM_IM_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twiddleReg_im <= to_signed(16#000#, 12);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twiddleReg_im <= twiddleS_im;
      END IF;
    END IF;
  END PROCESS TWIDDLEROM_IM_process;


  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdlOctantReg <= to_unsigned(16#0#, 3);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twdlOctantReg <= twdlOctant;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl45Reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twdl45Reg <= twdl45;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  -- Radix22TwdlOctCorr
  Radix22TwdlOctCorr_output : PROCESS (twdl45Reg, twdlOctantReg, twiddleReg_im, twiddleReg_re)
    VARIABLE twdlIn_re : signed(11 DOWNTO 0);
    VARIABLE twdlIn_im : signed(11 DOWNTO 0);
    VARIABLE cast : signed(12 DOWNTO 0);
    VARIABLE cast_0 : signed(12 DOWNTO 0);
    VARIABLE cast_1 : signed(12 DOWNTO 0);
    VARIABLE cast_2 : signed(12 DOWNTO 0);
    VARIABLE cast_3 : signed(12 DOWNTO 0);
    VARIABLE cast_4 : signed(12 DOWNTO 0);
    VARIABLE cast_5 : signed(12 DOWNTO 0);
    VARIABLE cast_6 : signed(12 DOWNTO 0);
    VARIABLE cast_7 : signed(12 DOWNTO 0);
    VARIABLE cast_8 : signed(12 DOWNTO 0);
    VARIABLE cast_9 : signed(12 DOWNTO 0);
    VARIABLE cast_10 : signed(12 DOWNTO 0);
  BEGIN
    cast_0 := to_signed(16#0000#, 13);
    cast_2 := to_signed(16#0000#, 13);
    cast_4 := to_signed(16#0000#, 13);
    cast_6 := to_signed(16#0000#, 13);
    cast_8 := to_signed(16#0000#, 13);
    cast_10 := to_signed(16#0000#, 13);
    cast := to_signed(16#0000#, 13);
    cast_1 := to_signed(16#0000#, 13);
    cast_3 := to_signed(16#0000#, 13);
    cast_5 := to_signed(16#0000#, 13);
    cast_7 := to_signed(16#0000#, 13);
    cast_9 := to_signed(16#0000#, 13);
    twdlIn_re := twiddleReg_re;
    twdlIn_im := twiddleReg_im;
    IF twdl45Reg = '1' THEN 
      CASE twdlOctantReg IS
        WHEN "000" =>
          twdlIn_re := to_signed(16#2D4#, 12);
          twdlIn_im := to_signed(-16#2D4#, 12);
        WHEN "010" =>
          twdlIn_re := to_signed(-16#2D4#, 12);
          twdlIn_im := to_signed(-16#2D4#, 12);
        WHEN "100" =>
          twdlIn_re := to_signed(-16#2D4#, 12);
          twdlIn_im := to_signed(16#2D4#, 12);
        WHEN OTHERS => 
          twdlIn_re := to_signed(16#2D4#, 12);
          twdlIn_im := to_signed(-16#2D4#, 12);
      END CASE;
    ELSE 
      CASE twdlOctantReg IS
        WHEN "000" =>
          NULL;
        WHEN "001" =>
          cast := resize(twiddleReg_im, 13);
          cast_0 :=  - (cast);
          twdlIn_re := cast_0(11 DOWNTO 0);
          cast_5 := resize(twiddleReg_re, 13);
          cast_6 :=  - (cast_5);
          twdlIn_im := cast_6(11 DOWNTO 0);
        WHEN "010" =>
          twdlIn_re := twiddleReg_im;
          cast_7 := resize(twiddleReg_re, 13);
          cast_8 :=  - (cast_7);
          twdlIn_im := cast_8(11 DOWNTO 0);
        WHEN "011" =>
          cast_1 := resize(twiddleReg_re, 13);
          cast_2 :=  - (cast_1);
          twdlIn_re := cast_2(11 DOWNTO 0);
          twdlIn_im := twiddleReg_im;
        WHEN "100" =>
          cast_3 := resize(twiddleReg_re, 13);
          cast_4 :=  - (cast_3);
          twdlIn_re := cast_4(11 DOWNTO 0);
          cast_9 := resize(twiddleReg_im, 13);
          cast_10 :=  - (cast_9);
          twdlIn_im := cast_10(11 DOWNTO 0);
        WHEN OTHERS => 
          twdlIn_re := twiddleReg_im;
          twdlIn_im := twiddleReg_re;
      END CASE;
    END IF;
    twdl_3_10_re_tmp <= twdlIn_re;
    twdl_3_10_im_tmp <= twdlIn_im;
  END PROCESS Radix22TwdlOctCorr_output;


  twdl_3_10_re <= std_logic_vector(twdl_3_10_re_tmp);

  twdl_3_10_im <= std_logic_vector(twdl_3_10_im_tmp);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl_3_10_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twdl_3_10_vld <= twdlAddrVld;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


END rtl;

