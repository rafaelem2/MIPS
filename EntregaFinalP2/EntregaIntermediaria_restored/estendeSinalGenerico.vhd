library ieee;
use ieee.std_logic_1164.all;

entity estendeSinalGenerico is
    generic
    (
        larguraDadoEntrada : natural  :=    16;
        larguraDadoSaida   : natural  :=    32
    );
    port
    (
        -- Input ports
        estendeSinal_IN : in  std_logic_vector(larguraDadoEntrada-1 downto 0);
		  ORI             : in std_logic;
        -- Output ports
        estendeSinal_OUT: out std_logic_vector(larguraDadoSaida-1 downto 0)
    );
end entity;

architecture comportamento of estendeSinalGenerico is

signal extensor : std_logic_vector(15 DOWNTO 0);
begin

MUXpc : entity work.muxGenerico2x1 generic map(larguraDados => 16)
			 port map (entradaA_MUX => (others => estendeSinal_IN(larguraDadoEntrada-1)),
						  entradaB_MUX => x"0000",
						  seletor_MUX => ORI,
						  saida_MUX => extensor
						  );

    estendeSinal_OUT <= extensor & estendeSinal_IN;

end architecture;