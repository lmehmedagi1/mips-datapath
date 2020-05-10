
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:25:24 05/08/2019
-- Design Name:   CONTROL
-- Module Name:   C:/Xilinx92i/Projekat2/control_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL
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

ENTITY control_testbench_vhd IS
END control_testbench_vhd;

ARCHITECTURE behavior OF control_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT CONTROL
	PORT(
		opcode : IN std_logic_vector(5 downto 0);          
		RegDst : OUT std_logic;
		ALUSrc : OUT std_logic;
		MemToReg : OUT std_logic;
		RegWrite : OUT std_logic;
		MemRead : OUT std_logic;
		MemWrite : OUT std_logic;
		Branch : OUT std_logic;
		ALUop : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_opcode :  std_logic_vector(5 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_RegDst :  std_logic;
	SIGNAL tb_ALUSrc :  std_logic;
	SIGNAL tb_MemToReg :  std_logic;
	SIGNAL tb_RegWrite :  std_logic;
	SIGNAL tb_MemRead :  std_logic;
	SIGNAL tb_MemWrite :  std_logic;
	SIGNAL tb_Branch :  std_logic;
	SIGNAL tb_ALUop :  std_logic_vector(1 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: CONTROL PORT MAP(
		opcode => tb_opcode,
		RegDst => tb_RegDst,
		ALUSrc => tb_ALUSrc,
		MemToReg => tb_MemToReg,
		RegWrite => tb_RegWrite,
		MemRead => tb_MemRead,
		MemWrite => tb_MemWrite,
		Branch => tb_Branch,
		ALUop => tb_ALUop
	);

	tb : PROCESS
	BEGIN
	
		tb_opcode <= "000000";
		WAIT FOR 50 ns;
		
		ASSERT (tb_RegDst = '1') report "Greska RegDst1" severity warning;
		ASSERT (tb_ALUSrc = '0') report "Greska ALUSrc" severity warning;
		ASSERT (tb_MemToReg = '0') report "Greska MemToreg1" severity warning;
		ASSERT (tb_RegWrite = '1') report "Greska RegWrite1" severity warning;
		ASSERT (tb_MemRead = '0') report "Greska MemRead1" severity warning;
		ASSERT (tb_MemWrite = '0') report "Greska MemWrite1" severity warning;
		ASSERT (tb_Branch = '0') report "Greska Branch1" severity warning;
		ASSERT (tb_ALUop = "10") report "Greska ALUop1" severity warning;
		
		--...
		
		WAIT FOR 50 ns;
		
		tb_opcode <= "100011";
		WAIT FOR 50 ns;
		
		ASSERT (tb_RegDst = '0') report "Greska RegDst2" severity warning;
		ASSERT (tb_ALUSrc = '1') report "Greska ALUSrc2" severity warning;
		ASSERT (tb_MemToReg = '1') report "Greska MemToReg2" severity warning;
		ASSERT (tb_RegWrite = '1') report "Greska RegWrite2" severity warning;
		ASSERT (tb_MemRead = '1') report "Greska MemRead2" severity warning;
		ASSERT (tb_MemWrite = '0') report "Greska MemWrite2" severity warning;
		ASSERT (tb_Branch = '0') report "Greska Branch2" severity warning;
		ASSERT (tb_ALUop = "00") report "Greska ALUop2" severity warning;
		
		
		
		tb_opcode <= "101011";
		WAIT FOR 50 ns;
		
		ASSERT (tb_RegDst = '0') report "Greska RegDst3" severity warning;
		ASSERT (tb_ALUSrc = '1') report "Greska ALUSrc3" severity warning;
		ASSERT (tb_MemToReg = '0') report "Greska MemToReg3" severity warning;
		ASSERT (tb_RegWrite = '0') report "Greska RegWrite3" severity warning;
		ASSERT (tb_MemRead = '0') report "Greska MemRead3" severity warning;
		ASSERT (tb_MemWrite = '1') report "Greska MemWrite3" severity warning;
		ASSERT (tb_Branch = '0') report "Greska Branch3" severity warning;
		ASSERT (tb_ALUop = "00") report "Greska ALUop3" severity warning;
		
		
		
	END PROCESS;

END;
