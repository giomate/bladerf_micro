library ieee ;
    use ieee.std_logic_1164.all ;
	 


entity index_synchronizer is
  generic (
    UNVALID_LEVEL :       std_logic   := '0';
    DATA_WIDTH      : positive  := 8

  ) ;
  port (
    valid       :   in  std_logic ;
    clock       :   in  std_logic ;
	 enable       :   in  std_logic ;
    async       : in std_logic_vector(DATA_WIDTH-1 downto 0) ;
   
    sync        :   out std_logic_vector(DATA_WIDTH-1 downto 0) := (others=>UNVALID_LEVEL)
  ) ;
end entity ; 

architecture arch of index_synchronizer is

    attribute ALTERA_ATTRIBUTE  : string;
    attribute PRESERVE          : boolean;

    signal reg0, reg1   : std_logic_vector(DATA_WIDTH-1 downto 0) ;

    attribute ALTERA_ATTRIBUTE of arch  : architecture is "-name SDC_STATEMENT ""set_false_path -to [get_registers {*index_synchronizer:*|reg0}] """;
    attribute ALTERA_ATTRIBUTE of reg0  : signal is "-name SYNCHRONIZER_IDENTIFICATION ""FORCED IF ASYNCHRONOUS""";
   attribute ALTERA_ATTRIBUTE of reg1  : signal is "-name SYNCHRONIZER_IDENTIFICATION ""FORCED IF ASYNCHRONOUS""";
   attribute PRESERVE of reg0          : signal is TRUE;
   attribute PRESERVE of reg1          : signal is TRUE;
  attribute PRESERVE of sync          : signal is TRUE;

begin

    synchronize : process( clock, enable )
    begin
        if( enable = '0' ) then
         --   sync <= (others=>UNVALID_LEVEL);
         --   reg0 <= (others=>UNVALID_LEVEL) ;
          --  reg1 <= (others=>UNVALID_LEVEL) ;
        elsif( rising_edge( clock ) ) then
				if (valid='1') then
					sync<=reg1;
					reg1 <= reg0 ;
					reg0 <=async;
				end if;
            
        end if ;
    end process ;

end architecture arch;

