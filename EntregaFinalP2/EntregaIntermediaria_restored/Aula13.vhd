library ieee;
use ieee.std_logic_1164.all;

entity Aula13 is
  -- Total de bits das entradas e saidas
  generic (
        simulacao : boolean := FALSE -- para gravar na placa, altere de TRUE para FALSE
  );
  port   (
    CLOCK_50 : in std_logic;
    KEY: in std_logic_vector(3 downto 0);
	 SW: in std_logic_vector(9 downto 0);
    LEDR  : out std_logic_vector(9 downto 0);
	 HEX0 : out std_logic_vector (6 downto 0);
	 HEX1 : out std_logic_vector (6 downto 0);
	 HEX2 : out std_logic_vector (6 downto 0);
	 HEX3 : out std_logic_vector (6 downto 0);
	 HEX4 : out std_logic_vector (6 downto 0);
	 HEX5 : out std_logic_vector (6 downto 0);
	 PC_OUT : out std_logic_vector(31 downto 0);
	 ULA_OUT : out std_logic_vector(31 downto 0);
	 RAM_OUT : out std_logic_Vector(31 downto 0);
	 PontosdeControle : out std_logic_Vector(16 downto 0);
	 teste_opcode : out std_logic_vector (5 downto 0)
	 --entradaShift : in std_logic_vector (31 downto 0);
	 --testeshamt : in std_logic_vector (4 downto 0);
	 --saidaShift : out std_logic_vector (31 downto 0)
	 
  );
  
end entity;


architecture arquitetura of Aula13 is

--sinais
signal saidaInc : std_logic_vector(31 downto 0);
signal Endereco : std_logic_vector(31 downto 0);
signal saidaROM : std_logic_vector(31 downto 0);
signal saidaRAM : std_logic_vector(31 downto 0);
signal regRs : std_logic_vector(31 downto 0);
signal regRt : std_logic_vector(31 downto 0);
signal saidaULA : std_logic_vector(31 downto 0);
signal sinalEstendido : std_logic_vector(31 downto 0);
signal somadorToMux : std_logic_vector(31 downto 0);
signal muxToULA : std_logic_vector(31 downto 0);
signal muxToPC : std_logic_vector(31 downto 0);
signal muxToBancoReg : std_logic_vector(4 downto 0);
signal muxRamOut : std_logic_vector(31 downto 0);
signal muxJMP : std_logic_vector(31 downto 0);
signal CLK : std_logic;
signal flagZero : std_logic;
signal SinaisControle : std_logic_vector (16 downto 0);
signal ULActrl : std_logic_vector (2 downto 0);
signal saidaDecOpULA : std_logic_vector (2 downto 0); 
signal saidaDecFunctULA : std_logic_vector (2 downto 0);
signal saidaMuxTeste : std_logic_vector (31 downto 0);
signal saidaLUI : std_logic_vector (31 downto 0);
signal saidaMuxJR : std_logic_vector(31 downto 0);
signal saidaMuxBeqBne : std_logic;
signal ulaToMux : std_logic_vector (31 downto 0);
signal shiftLeftOut : std_logic_vector (31 downto 0);
signal shiftRightOut : std_logic_vector (31 downto 0);
signal muxShiftOut : std_logic_vector (31 downto 0);
  
begin

-- Instanciando os componentes:

-- Para simular, fica mais simples tirar o edgeDetector
gravar:  if simulacao generate
CLK <= KEY(0);
else generate 
	CLK <= KEY(0);
end generate;

PC : entity work.registradorGenerico generic map (larguraDados => 32)
          port map (DIN => saidaMuxJR, DOUT => Endereco , ENABLE => '1', CLK => CLK);
		  
incrementaPC1 :  entity work.somaConstante generic map (larguraDados => 32, constante => 4)
        port map( entrada => Endereco, saida => saidaInc);
		  
somadorGenerico :  entity work.somadorGenerico generic map (larguraDados => 32)
			port map(entradaA => saidaInc, 
						entradaB => sinalEstendido(29 downto 0) & "00", 
						saida => somadorToMux
						);
		  
ROM : entity work.ROMMIPS generic map (dataWidth => 32, addrWidth => 32, memoryAddrWidth => 6)
          port map (Endereco => Endereco, Dado => saidaROM);
			 
RAM : entity work.RAMMIPS generic map (dataWidth => 32, addrWidth => 32, memoryAddrWidth => 6)
			port map (clk => CLK,
						 Endereco => saidaULA,
						 Dado_in => regRt,
						 Dado_out => saidaRAM,
						 we => SinaisControle(0), 
						 re=> SinaisControle(1), 
						 habilita => '1'
						 );

BANCOREG: entity work.bancoReg generic map (larguraDados => 32, larguraEndBancoRegs => 5)
			 port map (clk => CLK,
						  enderecoA => saidaROM(25 downto 21),
						  enderecoB => saidaROM(20 downto 16),
						  enderecoC => muxToBancoReg,
						  dadoEscritaC => muxShiftOut,
						  escreveC => SinaisControle(7),
						  saidaA => regRs,
						  saidaB => regRt
						  );

ULA : entity work.ULAMIPS  generic map(larguraDados => 32)
          port map (entradaA => regRs, entradaB => muxToULA, seletor => ULActrl(1 downto 0), inverteB => ULActrl(2), saida => ulaToMux, flagZero => flagZero);

MUXNOR : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => ulaToMux,
						  entradaB_MUX => not ulaToMux,
						  seletor_MUX => SinaisControle(14),
						  saida_MUX => saidaULA
						  );
						  
MUXbeq : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => saidaInc,
						  entradaB_MUX => somadorToMux,
						  seletor_MUX => saidaMuxBeqBne AND (SinaisControle(2) or SinaisControle(13)),
						  saida_MUX => muxToPC
						  );

MUXUla : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => regRt,
						  entradaB_MUX => sinalEstendido,
						  seletor_MUX => SinaisControle(6),
						  saida_MUX => muxToULA
						  );
						  
MUXBancoReg : entity work.muxGenerico4x1 generic map (larguraDados => 5)
			 port map (entradaA_MUX => saidaROM(20 downto 16),
						  entradaB_MUX => saidaROM(15 downto 11),
						  entradaC_MUX => "11111",
						  entradaD_MUX => "00000",
						  seletor_MUX => SinaisControle(9 downto 8),
						  saida_MUX => muxToBancoReg
						  );						  				  

MUXRam : entity work.muxGenerico4x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => saidaULA,
						  entradaB_MUX => saidaRAM,
						  entradaC_MUX => saidaInc,
						  entradaD_MUX => saidaLUI,
						  seletor_MUX =>SinaisControle(4 downto 3),
						  saida_MUX => muxRamOut
						  );							  

MUXdoJMP: entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => muxToPC,
						  entradaB_MUX => saidaInc(31 downto 28) & saidaROM(25 downto 0) & "00",
						  seletor_MUX => SinaisControle(10),
						  saida_MUX => muxJMP
						  );							
						
estendeSinal : entity work.estendeSinalGenerico generic map (larguraDadoEntrada => 16, larguraDadoSaida => 32)
			port map (estendeSinal_IN => saidaROM(15 downto 0),
						 ORI => SinaisControle(11),
						 estendeSinal_OUT => sinalEstendido
						 );

decoderInstru: entity work.decoderInstru 
			port map(opcode => saidaROM(31 downto 26),
						funct => saidaROM(5 downto 0),
						selMuxShift => SinaisControle(16 downto 15),
						sig_nor => SinaisControle(14),
						sig_bne => SinaisControle(13),
						habilitaJR => SinaisControle(12),
						sig_ORI_ANDI => SinaisControle(11),
						selMuxPc => SinaisControle(10),
						selMuxReg => SinaisControle(9 downto 8),
						habilitaReg => SinaisControle(7),
						selMuxULA => SinaisControle(6),
						tipoR => SinaisControle(5),
						selMuxULAMem => SinaisControle(4 downto 3),
						sig_beq => SinaisControle(2),
						habLeituraMem => SinaisControle(1),
						habEscritaMem => SinaisControle(0));
			
decoderOpcodeULA: entity work.decoderOpcodeULA 
			port map(opcode => saidaROM(31 downto 26), saida => saidaDecOpULA);
			
decoderFunctULA: entity work.decoderFunctULA
			port map(funct => saidaROM(5 downto 0) , saida => saidaDecFunctULA);
			
muxDecoder : entity work.muxGenerico2x1 generic map (larguraDados => 3)
			port map(entradaA_MUX => saidaDecOpULA, entradaB_MUX => saidaDecFunctULA, seletor_MUX => SinaisControle(5) , saida_MUX => ULActrl);
			
muxSaida : entity work.muxGenerico2x1 generic map (larguraDados => 32)
			port map(entradaA_MUX => Endereco, entradaB_MUX => saidaULA, seletor_MUX => SW(0), saida_MUX => saidaMuxTeste);
			
LUI : entity work.LUI
			port map(entrada => saidaROM(15 downto 0), saida => saidaLUI);
			
MUXJR: entity work.muxGenerico2x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => muxJMP,
						  entradaB_MUX => regRs,
						  seletor_MUX => SinaisControle(12),
						  saida_MUX => saidaMuxJR
						  );	
						  
MUXBEQ_BNE: entity work.muxGenerico2x1_1bit
			 port map (entradaA_MUX => not flagZero,
						  entradaB_MUX => flagZero,
						  seletor_MUX => SinaisControle(2),
						  saida_MUX => saidaMuxBeqBne
						  );

ShiftLeft: entity work.shiftLeft
			port map(entrada => regRt,
						shamt => saidaROM(10 downto 6),
						saida => shiftLeftOut
			);

ShiftRight: entity work.shiftRight
			port map(entrada => regRt,
						shamt => saidaROM(10 downto 6),
						saida => shiftRightOut
			);

MUXShift : entity work.muxGenerico4x1 generic map (larguraDados => 32)
			 port map (entradaA_MUX => muxRamOut,
						  entradaB_MUX => shiftLeftOut,
						  entradaC_MUX => shiftRightOut,
						  entradaD_MUX => x"00000000",
						  seletor_MUX =>SinaisControle(16 downto 15),
						  saida_MUX => muxShiftOut
						  );	

			
						 
DECHEX0 :  entity work.conversorHex7Seg
        port map(dadoHex => saidaMuxTeste(3 downto 0),
					  saida7seg => HEX0
					  );	 	
		  
DECHEX1 :  entity work.conversorHex7Seg
        port map(dadoHex => saidaMuxTeste(7 downto 4),
					  saida7seg => HEX1
					  );	 

DECHEX2 :  entity work.conversorHex7Seg
        port map(dadoHex => saidaMuxTeste(11 downto 8),
					  saida7seg => HEX2
					  );	 	
		 
DECHEX3 :  entity work.conversorHex7Seg
        port map(dadoHex => saidaMuxTeste(15 downto 12),
					  saida7seg => HEX3
					  );	 	
		
DECHEX4 :  entity work.conversorHex7Seg
        port map(dadoHex => saidaMuxTeste(19 downto 16),
					  saida7seg => HEX4
					  );	 	
		 
DECHEX5 :  entity work.conversorHex7Seg
        port map(dadoHex => saidaMuxTeste(23 downto 20),
					  saida7seg => HEX5
					  );
					
LEDR (3 downto 0) <= saidaMuxTeste(27 downto 24);
LEDR (7 downto 4) <= saidaMuxTeste(31 downto 28);	
	
ULA_OUT <= saidaULA;
PC_OUT <= Endereco;
RAM_OUT <= muxShiftOut;
teste_opcode <= saidaROM(31 downto 26);
PontosdeControle <= SinaisControle(16 downto 0);

				  
end architecture;