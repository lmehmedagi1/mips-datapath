
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:55:27 05/12/2019
-- Design Name:   ALUControl
-- Module Name:   C:/Users/Lejla/Desktop/Projekat2/alucontrol_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALUControl
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

ENTITY alucontrol_testbench_vhd IS
END alucontrol_testbench_vhd;

ARCHITECTURE behavior OF alucontrol_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT ALUControl
	PORT(
		ALUOp : IN std_logic_vector(1 downto 0);
		funct : IN std_logic_vector(5 downto 0);          
		control : OUT std_logic
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_ALUOp :  std_logic_vector(1 downto 0) := (others=>'0');
	SIGNAL tb_funct :  std_logic_vector(5 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_control :  std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: ALUControl PORT MAP(
		ALUOp => tb_ALUOp,
		funct => tb_funct,
		control => tb_control
	);

	tb : PROCESS
	BEGIN
	
		tb_ALUOp <= "10";
		tb_funct <= "100010"; -- oduzimanje, control treba biti 1
		
		WAIT FOR 50 ns;
		ASSERT (tb_control = '1') report "Greska oduzimanje" severity warning;
		
		
		tb_ALUOp <= "10";
		tb_funct <= "100000"; -- sabiranje, control treba biti 0
		
		WAIT FOR 50 ns;
		ASSERT (tb_control = '0') report "Greska sabiranje" severity warning;
		
		tb_ALUOp <= "00";
		tb_funct <= "000000"; -- lw i sw, control treba biti 0
		
		WAIT FOR 50 ns;
		ASSERT (tb_control = '0') report "Greska I-tip instrukcija" severity warning;
		
	
	END PROCESS;

END;
