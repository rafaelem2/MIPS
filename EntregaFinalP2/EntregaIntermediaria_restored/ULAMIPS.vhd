library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

entity ULAMIPS is
 generic (larguraDados : natural := 32);
 port(
	 entradaA          : in  std_logic_vector(larguraDados-1 downto 0);
	 entradaB          : in  std_logic_vector(larguraDados-1 downto 0);
	 seletor        : in  std_logic_vector(1 downto 0);
	 inverteB        : in  std_logic;
	 saida         : out std_logic_vector(larguraDados-1 downto 0);
	 flagZero        : out std_logic;
	 somaOUT : out std_logic;
	 overflow : out std_logic
 );
end entity;

architecture componente of ULAMIPS is

	signal carryOut31,  carryIn1,  carryIn2,  carryIn3  : std_logic;
	signal carryIn4,  carryIn5,  carryIn6,  carryIn7  : std_logic; 
	signal carryIn8,  carryIn9,  carryIn10, carryIn11 : std_logic;
	signal carryIn12, carryIn13, carryIn14, carryIn15 : std_logic;
	signal carryIn16, carryIn17, carryIn18, carryIn19 : std_logic;
	signal carryIn20, carryIn21, carryIn22, carryIn23 : std_logic;
	signal carryIn24, carryIn25, carryIn26, carryIn27 : std_logic;
	signal carryIn28, carryIn29, carryIn30, carryIn31 : std_logic;
	signal resultadoSomabit31, entradaBbit31: std_logic;

begin

entradaBbit31 <= not(entradaB(31)) when inverteB = '1' else entradaB(31);
somaOUT <= carryIn31 xor (entradaA(31) xor entradaBbit31);
resultadoSomabit31 <= carryIn31 xor (entradaA(31) xor entradaBbit31);
overflow <= (carryOut31 xor carryIn31);

ULA_0: entity work.ULA_1bit
   port map( 
      SLT => (carryOut31 xor carryIn31) xor resultadoSomabit31,
      entradaA => entradaA(0),
		entradaB => entradaB(0),
		inverteB => inverteB ,
		selecao => seletor ,
		carryIn  => inverteB ,
		carryOut => carryIn1,
		resultado => saida(0)
   );
	
ULA_1: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(1) ,
		entradaB => entradaB(1),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn1,
		carryOut => carryIn2,
		resultado => saida(1)
   );
	
ULA_2: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(2),
		entradaB => entradaB(2),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn2,
		carryOut => carryIn3,
		resultado => saida(2)
   );

ULA_3: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(3),
		entradaB => entradaB(3),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn3,
		carryOut => carryIn4,
		resultado => saida(3)
   );
	
ULA_4: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(4),
		entradaB => entradaB(4),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn4,
		carryOut => carryIn5,
		resultado => saida(4)
   );
	
ULA_5: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(5),
		entradaB => entradaB(5),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn5,
		carryOut => carryIn6,
		resultado => saida(5)
   );
	
ULA_6: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(6) ,
		entradaB => entradaB(6),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn6,
		carryOut => carryIn7,
		resultado => saida(6)
   );
	
ULA_7: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(7) ,
		entradaB => entradaB(7),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn7,
		carryOut => carryIn8,
		resultado => saida(7)
   );
	
ULA_8: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(8),
		entradaB => entradaB(8),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn8,
		carryOut => carryIn9,
		resultado => saida(8)
   );
	
ULA_9: entity work.ULA_1bit
   port map( 
      SLT => '0' ,
      entradaA => entradaA(9),
		entradaB => entradaB(9),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn9,
		carryOut => carryIn10,
		resultado => saida(9)
   );
	
ULA_10: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(10),
		entradaB => entradaB(10),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn10,
		carryOut => carryIn11,
		resultado => saida(10)
   );
	
ULA_11: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(11),
		entradaB => entradaB(11),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn11,
		carryOut => carryIn12,
		resultado => saida(11)
   );
	
ULA_12: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(12) ,
		entradaB => entradaB(12),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn12,
		carryOut => carryIn13,
		resultado => saida(12)
   );
	
ULA_13: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(13) ,
		entradaB => entradaB(13),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn13,
		carryOut => carryIn14,
		resultado => saida(13)
   );
	
ULA_14: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(14) ,
		entradaB => entradaB(14),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn14,
		carryOut => carryIn15,
		resultado => saida(14)
   );
	
ULA_15: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(15),
		entradaB => entradaB(15),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn15,
		carryOut => carryIn16,
		resultado => saida(15)
   );
	
ULA_16: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(16) ,
		entradaB => entradaB(16),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn16,
		carryOut => carryIn17,
		resultado => saida(16)
   );
	
ULA_17: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(17) ,
		entradaB => entradaB(17),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn17,
		carryOut => carryIn18,
		resultado => saida(17)
   );
	
ULA_18: entity work.ULA_1bit
   port map( 
      SLT => '0' ,
      entradaA => entradaA(18),
		entradaB => entradaB(18),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn18,
		carryOut => carryIn19,
		resultado => saida(18)
   );
	
ULA_19: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(19) ,
		entradaB => entradaB(19),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn19,
		carryOut => carryIn20,
		resultado => saida(19)
   );
	
ULA_20: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(20),
		entradaB => entradaB(20),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn20,
		carryOut => carryIn21,
		resultado => saida(20)
   );
	
ULA_21: entity work.ULA_1bit
   port map( 
      SLT => '0' ,
      entradaA => entradaA(21) ,
		entradaB => entradaB(21),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn21,
		carryOut => carryIn22,
		resultado => saida(21)
   );
	
ULA_22: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(22) ,
		entradaB => entradaB(22),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn22,
		carryOut => carryIn23,
		resultado => saida(22) 
   );
	
ULA_23: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(23),
		entradaB => entradaB(23),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn23,
		carryOut => carryIn24,
		resultado => saida(23)
   );
	
ULA_24: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(24) ,
		entradaB => entradaB(24),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn24,
		carryOut => carryIn25,
		resultado => saida(24) 
   );
	
ULA_25: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(25),
		entradaB => entradaB(25),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn25,
		carryOut => carryIn26,
		resultado => saida(25)
   );
	
ULA_26: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(26),
		entradaB => entradaB(26),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn26,
		carryOut => carryIn27,
		resultado => saida(26)
   );
	
ULA_27: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(27) ,
		entradaB => entradaB(27),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn27,
		carryOut => carryIn28,
		resultado => saida(27)
   );
	
ULA_28: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(28) ,
		entradaB => entradaB(28),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn28,
		carryOut => carryIn29,
		resultado => saida(28)
   );
	
ULA_29: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(29),
		entradaB => entradaB(29),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn29,
		carryOut => carryIn30,
		resultado => saida(29)
   );
	
ULA_30: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(30) ,
		entradaB => entradaB(30),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn30,
		carryOut => carryIn31,
		resultado => saida(30)
   );
	
ULA_31: entity work.ULA_1bit
   port map( 
      SLT => '0',
      entradaA => entradaA(31),
		entradaB => entradaB(31),
		inverteB => inverteB,
		selecao => seletor,
		carryIn  => carryIn31,
		carryOut => carryOut31,
		resultado => saida(31)
   );

flagZero <= '1' when unsigned(saida) = "00000000000000000000000000000000" else '0';
	
end architecture;