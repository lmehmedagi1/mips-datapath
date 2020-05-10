
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:37:32 05/08/2019
-- Design Name:   REGFILE
-- Module Name:   C:/Xilinx92i/Projekat2/regfile_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REGFILE
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

ENTITY regfile_testbench_vhd IS
END regfile_testbench_vhd;

ARCHITECTURE behavior OF regfile_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT REGFILE
	PORT(
		clock : IN std_logic;
		regWrite : IN std_logic;
		readRegister1 : IN std_logic_vector(4 downto 0);
		readRegister2 : IN std_logic_vector(4 downto 0);
		writeRegister : IN std_logic_vector(4 downto 0);
		writeData : IN std_logic_vector(31 downto 0);          
		registerData1 : OUT std_logic_vector(31 downto 0);
		registerData2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_clock :  std_logic := '0';
	SIGNAL tb_regWrite :  std_logic := '0';
	SIGNAL tb_readRegister1 :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL tb_readRegister2 :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL tb_writeRegister :  std_logic_vector(4 downto 0) := (others=>'0');
	SIGNAL tb_writeData :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_registerData1 :  std_logic_vector(31 downto 0);
	SIGNAL tb_registerData2 :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: REGFILE PORT MAP(
		clock => tb_clock,
		regWrite => tb_regWrite,
		readRegister1 => tb_readRegister1,
		readRegister2 => tb_readRegister2,
		writeRegister => tb_writeRegister,
		writeData => tb_writeData,
		registerData1 => tb_registerData1,
		registerData2 => tb_registerData2
	);

	tb_clock_process : PROCESS
	BEGIN
	
		tb_clock <= '0';
		WAIT FOR 10 ns;
		
		tb_readRegister1 <= "00000"; -- citanje iz registra 0 
		WAIT FOR 50 ns;
		
		ASSERT (tb_registerData1 = x"00000000") report "Greska" severity warning;
		
		
		tb_clock <= '1';
		WAIT FOR 10 ns;
		
	END PROCESS;

END;
