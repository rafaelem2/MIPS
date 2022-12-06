library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoderOpcodeULA is
  port   (
	 opcode : in std_logic_vector(5 downto 0);
	 saida : out std_logic_vector(2 downto 0)
  );
end entity;

architecture arch_name of decoderOpcodeULA is
  constant LW     : std_logic_vector(5 downto 0) := "100011";
  constant SW     : std_logic_vector(5 downto 0) := "101011";
  constant BEQ    : std_logic_vector(5 downto 0) := "000100";
  constant ADDI 	: std_logic_vector(5 downto 0) := "001000";
  constant ORI 	: std_logic_vector(5 downto 0) := "001101";
  constant ANDI 	: std_logic_vector(5 downto 0) := "001100";
  constant BNE    : std_logic_vector(5 downto 0) := "000101";
  constant SLTI	: std_logic_vector(5 downto 0) := "001010";
  
  
begin
	
	saida <= "010" when (opcode = LW or opcode = SW or opcode = ADDI) else 
             "110" when (opcode = BEQ or opcode = BNE) else
				 "001" when (opcode = ORI) else
				 "111" when (opcode = SLTI) else
             "000";
	
end architecture;