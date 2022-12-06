library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA_1bit is
   port(
	SLT      : in  std_logic;
	entradaA   : in  std_logic;
	entradaB   : in  std_logic;
	inverteB : in  std_logic;
	selecao : in  std_logic_vector(1 downto 0);
	carryIn  : in  std_logic;
	carryOut : out std_logic;
	resultado    : out std_logic
);
end entity;

architecture componente of ULA_1bit is
   signal muxB_Out  : std_logic;
   signal somaAB : std_logic;

begin
	
MUX_B: entity work.muxGenerico2x1_1bit
   port map( 
      entradaA_MUX   => entradaB,
      entradaB_MUX   => not(entradaB),
      seletor_MUX   => inverteB,
      saida_MUX => muxB_Out
   );

Somador :  entity work.somadorULA
   port map( 
      entradaA    => entradaA, 
      entradaB    => muxB_Out, 
      carryIn   => carryIn,
      carryOut  => carryOut,	
      saida     => somaAB
   );

Mux_resultado: entity work.muxGenerico4x1_1bit
   port map( 
      entradaA_MUX   => entradaA and muxB_Out,
      entradaB_MUX   => entradaA or  muxB_Out,
      entradaC_MUX   => somaAB,
      entradaD_MUX   => SLT,
      seletor_MUX   => selecao,
      saida_MUX => resultado
   );

end architecture;