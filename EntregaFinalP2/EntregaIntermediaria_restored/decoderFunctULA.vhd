library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoderFunctULA is
  port   (
	 funct  : in std_logic_vector(5 downto 0);
	 saida : out std_logic_vector(2 downto 0)
  );
end entity;

architecture arch_name of decoderFunctULA is

  constant ANDCODE : std_logic_vector(5 downto 0) := "100100";
  constant ORCODE  : std_logic_vector(5 downto 0) := "100101";
  constant ADD    : std_logic_vector(5 downto 0) := "100000";
  constant SUB    : std_logic_vector(5 downto 0) := "100010";
  constant SLT    : std_logic_vector(5 downto 0) := "101010";
  constant NORCODE  : std_logic_vector(5 downto 0) := "100111";
  
begin
	
	saida <="010" when (funct = ADD) else
            "110" when (funct = SUB) else
            "111" when (funct = SLT) else
				"000" when (funct = ANDCODE) else 
            "001" when (funct = ORCODE or funct = NORCODE) else
            "000";
	
end architecture;