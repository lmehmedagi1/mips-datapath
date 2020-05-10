
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:50:46 05/12/2019
-- Design Name:   MUX2_1
-- Module Name:   C:/Users/Lejla/Desktop/Projekat2/mux2_1_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX2_1
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

ENTITY mux2_1_testbench_vhd IS
END mux2_1_testbench_vhd;

ARCHITECTURE behavior OF mux2_1_testbench_vhd IS 

	constant num : integer := 5;

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT MUX2_1
	GENERIC (N      : INTEGER := 32);
	PORT(
		rtOrRegValue : IN std_logic_vector;
		rdOrImmediate : IN std_logic_vector;
		regDstOrALUSrc : IN std_logic;          
		result : OUT std_logic_vector
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_regDstOrALUSrc :  std_logic := '0';
	SIGNAL tb_rtOrRegValue :  std_logic_vector(num - 1 downto 0) := (others=>'0');
	SIGNAL tb_rdOrImmediate :  std_logic_vector(num - 1 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_result :  std_logic_vector(num - 1 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: MUX2_1 
	GENERIC MAP (N => num)
	PORT MAP(
		rtOrRegValue => tb_rtOrRegValue,
		rdOrImmediate => tb_rdOrImmediate,
		regDstOrALUSrc => tb_regDstOrALUSrc,
		result => tb_result
	);

	tb : PROCESS
	BEGIN
		
		-- kada je regDst 1 vraca se rd

		tb_regDstOrALUSrc <= '1';
		tb_rtOrRegValue <= "00100";
		tb_rdOrImmediate <= "00101";
		
		WAIT FOR 50 ns;
		
		ASSERT (tb_result = "00101") report "Greska rd" severity warning;
		
		-- kada je regDst 0 vraca se rt
		
		tb_regDstOrALUSrc <= '0';
		tb_rtOrRegValue <= "00001";
		tb_rdOrImmediate <= "00010";
		
		WAIT FOR 50 ns;
		
		ASSERT (tb_result = "00001") report "Greska rt" severity warning;

		
	END PROCESS;

END;
