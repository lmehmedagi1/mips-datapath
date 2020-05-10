
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:52:31 05/08/2019
-- Design Name:   SIGNEXTEND
-- Module Name:   C:/Xilinx92i/Projekat2/signextend_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SIGNEXTEND
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

ENTITY signextend_testbench_vhd IS
END signextend_testbench_vhd;

ARCHITECTURE behavior OF signextend_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT SIGNEXTEND
	PORT(
		data : IN std_logic_vector(15 downto 0);          
		extended : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_data :  std_logic_vector(15 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_extended :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: SIGNEXTEND PORT MAP(
		data => tb_data,
		extended => tb_extended
	);

	tb : PROCESS
	BEGIN

		tb_data <= "0100000000000000";
		
		WAIT FOR 50 ns;
		
		ASSERT (tb_extended = "00000000000000000100000000000000") report "Greska" severity warning;
	END PROCESS;

END;
