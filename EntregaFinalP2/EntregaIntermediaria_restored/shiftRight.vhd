library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftRight is
    port
    (
        -- Input ports
        entrada : in  std_logic_vector(31 downto 0);
		  shamt	 : in std_logic_vector(4 downto 0);
        -- Output ports
        saida: out std_logic_vector(31 downto 0)
    );
end entity;

architecture comportamento of shiftRight is
begin

     saida <= std_logic_vector(unsigned(entrada) srl to_integer(unsigned(shamt)));

end architecture;