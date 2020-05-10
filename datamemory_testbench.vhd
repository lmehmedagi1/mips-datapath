
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:47:58 05/19/2019
-- Design Name:   DataMemory
-- Module Name:   C:/Users/Lejla/Desktop/Projekat2/datamemory_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMemory
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends 
-- that these types always be used for the top-level I/O of a design in order 
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY datamemory_testbench_vhd IS
END datamemory_testbench_vhd;

ARCHITECTURE behavior OF datamemory_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DataMemory
	PORT(
		clock : IN std_logic;
		readAddress : IN std_logic_vector(31 downto 0);
		MemRead : IN std_logic;
		writeData : IN std_logic_vector(31 downto 0);
		MemWrite : IN std_logic;          
		readData : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_clock :  std_logic := '0';
	SIGNAL tb_MemRead :  std_logic := '0';
	SIGNAL tb_MemWrite :  std_logic := '0';
	SIGNAL tb_readAddress :  std_logic_vector(31 downto 0) := (others=>'0');
	SIGNAL tb_writeData :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_readData :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: DataMemory PORT MAP(
		clock => tb_clock,
		readAddress => tb_readAddress,
		MemRead => tb_MemRead,
		writeData => tb_writeData,
		MemWrite => tb_MemWrite,
		readData => tb_readData
	);

	tb : PROCESS
	BEGIN

		-- upisujemo broj x"77777777" na mem adresu 0, clock na 0 pa na 1 da bude rastu?a ivica

		tb_clock <= '0';
		WAIT FOR 10 ns;
		
		tb_MemRead <= '0';
		tb_MemWrite <= '1';
		tb_writeData <= x"00000005";
		tb_readAddress <= x"00000000";		
		tb_clock <= '1';

		WAIT FOR 50 ns;
		
		
		-- provjeravamo vrijednost na mem adresi 0, clock na 0 pa na 1 da bude rastu?a ivica
		tb_clock <= '0';
		WAIT FOR 10 ns;
		
		tb_MemRead <= '1';
		tb_MemWrite <= '0';
		tb_writeData <= x"00000005";
		tb_readAddress <= x"00000000";
		tb_clock <= '1';
		WAIT FOR 50 ns;
		
		
		ASSERT (tb_readData = x"00000005") report "Greska" severity warning;
		
		
	END PROCESS;

END;
