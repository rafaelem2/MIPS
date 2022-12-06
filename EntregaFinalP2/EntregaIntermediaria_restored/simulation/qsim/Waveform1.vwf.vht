-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/05/2022 23:19:54"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Aula13
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Aula13_vhd_vec_tst IS
END Aula13_vhd_vec_tst;
ARCHITECTURE Aula13_arch OF Aula13_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL entradaShift : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX5 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL saidaShift : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL testeshamt : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT Aula13
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	entradaShift : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	saidaShift : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	testeshamt : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Aula13
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	entradaShift => entradaShift,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	HEX5 => HEX5,
	KEY => KEY,
	LEDR => LEDR,
	saidaShift => saidaShift,
	SW => SW,
	testeshamt => testeshamt
	);
-- entradaShift[31]
t_prcs_entradaShift_31: PROCESS
BEGIN
	entradaShift(31) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_31;
-- entradaShift[30]
t_prcs_entradaShift_30: PROCESS
BEGIN
	entradaShift(30) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_30;
-- entradaShift[29]
t_prcs_entradaShift_29: PROCESS
BEGIN
	entradaShift(29) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_29;
-- entradaShift[28]
t_prcs_entradaShift_28: PROCESS
BEGIN
	entradaShift(28) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_28;
-- entradaShift[27]
t_prcs_entradaShift_27: PROCESS
BEGIN
	entradaShift(27) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_27;
-- entradaShift[26]
t_prcs_entradaShift_26: PROCESS
BEGIN
	entradaShift(26) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_26;
-- entradaShift[25]
t_prcs_entradaShift_25: PROCESS
BEGIN
	entradaShift(25) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_25;
-- entradaShift[24]
t_prcs_entradaShift_24: PROCESS
BEGIN
	entradaShift(24) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_24;
-- entradaShift[23]
t_prcs_entradaShift_23: PROCESS
BEGIN
	entradaShift(23) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_23;
-- entradaShift[22]
t_prcs_entradaShift_22: PROCESS
BEGIN
	entradaShift(22) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_22;
-- entradaShift[21]
t_prcs_entradaShift_21: PROCESS
BEGIN
	entradaShift(21) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_21;
-- entradaShift[20]
t_prcs_entradaShift_20: PROCESS
BEGIN
	entradaShift(20) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_20;
-- entradaShift[19]
t_prcs_entradaShift_19: PROCESS
BEGIN
	entradaShift(19) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_19;
-- entradaShift[18]
t_prcs_entradaShift_18: PROCESS
BEGIN
	entradaShift(18) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_18;
-- entradaShift[17]
t_prcs_entradaShift_17: PROCESS
BEGIN
	entradaShift(17) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_17;
-- entradaShift[16]
t_prcs_entradaShift_16: PROCESS
BEGIN
	entradaShift(16) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_16;
-- entradaShift[15]
t_prcs_entradaShift_15: PROCESS
BEGIN
	entradaShift(15) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_15;
-- entradaShift[14]
t_prcs_entradaShift_14: PROCESS
BEGIN
	entradaShift(14) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_14;
-- entradaShift[13]
t_prcs_entradaShift_13: PROCESS
BEGIN
	entradaShift(13) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_13;
-- entradaShift[12]
t_prcs_entradaShift_12: PROCESS
BEGIN
	entradaShift(12) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_12;
-- entradaShift[11]
t_prcs_entradaShift_11: PROCESS
BEGIN
	entradaShift(11) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_11;
-- entradaShift[10]
t_prcs_entradaShift_10: PROCESS
BEGIN
	entradaShift(10) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_10;
-- entradaShift[9]
t_prcs_entradaShift_9: PROCESS
BEGIN
	entradaShift(9) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_9;
-- entradaShift[8]
t_prcs_entradaShift_8: PROCESS
BEGIN
	entradaShift(8) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_8;
-- entradaShift[7]
t_prcs_entradaShift_7: PROCESS
BEGIN
	entradaShift(7) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_7;
-- entradaShift[6]
t_prcs_entradaShift_6: PROCESS
BEGIN
	entradaShift(6) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_6;
-- entradaShift[5]
t_prcs_entradaShift_5: PROCESS
BEGIN
	entradaShift(5) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_5;
-- entradaShift[4]
t_prcs_entradaShift_4: PROCESS
BEGIN
	entradaShift(4) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_4;
-- entradaShift[3]
t_prcs_entradaShift_3: PROCESS
BEGIN
	entradaShift(3) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_3;
-- entradaShift[2]
t_prcs_entradaShift_2: PROCESS
BEGIN
	entradaShift(2) <= '1';
WAIT;
END PROCESS t_prcs_entradaShift_2;
-- entradaShift[1]
t_prcs_entradaShift_1: PROCESS
BEGIN
	entradaShift(1) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_1;
-- entradaShift[0]
t_prcs_entradaShift_0: PROCESS
BEGIN
	entradaShift(0) <= '0';
WAIT;
END PROCESS t_prcs_entradaShift_0;
-- testeshamt[4]
t_prcs_testeshamt_4: PROCESS
BEGIN
	testeshamt(4) <= '0';
WAIT;
END PROCESS t_prcs_testeshamt_4;
-- testeshamt[3]
t_prcs_testeshamt_3: PROCESS
BEGIN
	testeshamt(3) <= '0';
WAIT;
END PROCESS t_prcs_testeshamt_3;
-- testeshamt[2]
t_prcs_testeshamt_2: PROCESS
BEGIN
	testeshamt(2) <= '0';
WAIT;
END PROCESS t_prcs_testeshamt_2;
-- testeshamt[1]
t_prcs_testeshamt_1: PROCESS
BEGIN
	testeshamt(1) <= '1';
WAIT;
END PROCESS t_prcs_testeshamt_1;
-- testeshamt[0]
t_prcs_testeshamt_0: PROCESS
BEGIN
	testeshamt(0) <= '0';
WAIT;
END PROCESS t_prcs_testeshamt_0;
END Aula13_arch;
