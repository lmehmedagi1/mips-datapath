
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:06:21 05/12/2019
-- Design Name:   ALU
-- Module Name:   C:/Users/Lejla/Desktop/Projekat2/alu_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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

ENTITY alu_testbench_vhd IS
END alu_testbench_vhd;

ARCHITECTURE behavior OF alu_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT ALU
	PORT(
		readData1 : IN std_logic_vector(31 downto 0);
		muxOutput : IN std_logic_vector(31 downto 0);
		operation : IN std_logic;          
		result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_operation :  std_logic := '0';
	SIGNAL tb_readData1 :  std_logic_vector(31 downto 0) := (others=>'0');
	SIGNAL tb_muxOutput :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_result :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: ALU PORT MAP(
		readData1 => tb_readData1,
		muxOutput => tb_muxOutput,
		operation => tb_operation,
		result => tb_result
	);

	tb : PROCESS
	BEGIN

		-- operation je 0, treba ih sabrati
		
		tb_operation <= '0';
		tb_readData1 <= x"00000002";
		tb_muxOutput <= x"00000001";
		WAIT FOR 50 ns;
		
		ASSERT (tb_result = x"00000003") report "Greska sabiranje" severity warning;
		
		-- operation je 1, treba ih oduzet
		
		tb_operation <= '1';
		tb_readData1 <= x"00000002";
		tb_muxOutput <= x"00000001";
		WAIT FOR 50 ns;
		
		ASSERT (tb_result = x"00000001") report "Greska oduzimanje" severity warning;


	END PROCESS;

END;
