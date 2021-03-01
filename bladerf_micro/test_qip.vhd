 
 library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;
    use ieee.math_complex.all;

library work;
    use work.bladerf_micro;
   -- use work.bladerf_p.all;
  --  use work.fifo_readwrite_p.all;
  --  use work.sensor_trobina_pkg.all;

architecture test_ip of bladerf_micro is

  component nios_cpu is
        port (
            clk_clk       : in std_logic := '0'; -- clk
            reset_reset_n : in std_logic := '1'  -- reset_n
        );
    end component nios_cpu;
begin
    u0 : component nios_cpu
        port map (
            clk_clk       => c5_clock2,       --   clk.clk
            reset_reset_n => '1'  -- reset.reset_n
        );

end architecture;