library ieee;
use ieee.std_logic_1164.all;

entity decoderInstru is
  port ( opcode : in std_logic_vector(5 downto 0);
			funct : in std_logic_vector(5 downto 0);
			selMuxShift : out std_logic_vector (1 downto 0);
			sig_nor : out std_logic;
			sig_bne : out std_logic;
			habilitaJR : out std_logic;
			sig_ORI_ANDI		: out std_logic;
			selMuxPc : out std_logic;
			selMuxReg : out std_logic_vector(1 downto 0);
			habilitaReg : out std_logic;
			selMuxULA : out std_logic;
			tipoR : out std_logic;
			selMuxULAMem : out std_logic_vector(1 downto 0);
			sig_beq : out std_logic;
			habLeituraMem : out std_logic;
			habEscritaMem : out std_logic
			
  );
end entity;

architecture comportamento of decoderInstru is
  constant Tipo_R : std_logic_vector(5 downto 0) := "000000";
  constant LW    : std_logic_vector(5 downto 0) := "100011";
  constant SW    : std_logic_vector(5 downto 0) := "101011";
  constant BEQ   : std_logic_vector(5 downto 0) := "000100";
  constant JMP   : std_logic_vector(5 downto 0) := "000010";
  constant ADDI  : std_logic_vector(5 downto 0) := "001000";
  constant LUI   : std_logic_vector(5 downto 0) := "001111";
  constant ORI   : std_logic_vector(5 downto 0) := "001101";
  constant ANDI   : std_logic_vector(5 downto 0) := "001100"; 
  constant JR 	  : std_logic_vector(5 downto 0) := "001000"; 
  constant JAL 	  : std_logic_vector(5 downto 0) := "000011"; 
  constant BNE	  : std_logic_vector(5 downto 0) := "000101";
  constant SLTI : std_logic_vector(5 downto 0) := "001010";
  constant NORCODE : std_logic_vector(5 downto 0) := "100111";
  constant SLLCODE : std_logic_vector(5 downto 0) := "000000";
  constant SRLCODE : std_logic_vector(5 downto 0) := "000010";

begin

	selMuxPc <= '1' when (opcode = JMP or opcode = JAL) else '0';

	selMuxReg <= "01" when (opcode = Tipo_R) else "10" when (opcode = JAL) else "00";

	habilitaReg <= '0' when (opcode = SW or opcode = BEQ or opcode = JMP or opcode = BNE) else '1';

	selMuxULA <= '1' when (opcode = LW or opcode = SW or opcode = ADDI or opcode = ORI or opcode = ANDI or opcode = SLTI) else '0';

	tipoR  <= '1' when (opcode = Tipo_R) else '0';
	
	selMuxULAMem <= "01" when (opcode = LW) else "11" when (opcode = LUI) 
							else "10" when (opcode = JAL) else "00";

	sig_beq <= '1' when (opcode = BEQ) else '0';

	habLeituraMem <= '1' when (opcode = LW) else '0';

	habEscritaMem <= '1' when (opcode = SW) else '0';
	
	sig_ORI_ANDI <= '1' when (opcode = ORI or opcode = ANDI) else '0';
	
	habilitaJR <= '1' when (funct = JR and opcode = Tipo_R) else '0';
	
	sig_bne <= '1' when (opcode = BNE) else '0';
	
	sig_nor <= '1' when (opcode = Tipo_R and funct = NORCODE) else '0';
	
	selMuxShift <= "01" when (opcode = Tipo_R and funct = SLLCODE) else "10" when (opcode = Tipo_R and funct = SRLCODE) else "00";



end architecture;