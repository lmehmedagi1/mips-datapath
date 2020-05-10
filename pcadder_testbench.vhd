
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:09:12 04/10/2019
-- Design Name:   PCAdder
-- Module Name:   C:/Xilinx92i/Projekat2/pcadder_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PCAdder
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

ENTITY pcadder_testbench_vhd IS
END pcadder_testbench_vhd;

ARCHITECTURE behavior OF pcadder_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT PCAdder
	PORT(
		cur_address : IN std_logic_vector(31 downto 0);          
		next_address : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_cur_address :  std_logic_vector(31 downto 0) := (others=>'0');
	--Outputs
	SIGNAL tb_next_address :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: PCAdder PORT MAP(
		cur_address => tb_cur_address,
		next_address => tb_next_address
	);


	tb : PROCESS
	BEGIN
		tb_cur_address <= x"aaaaaaaa";
		WAIT FOR 50 ns;
		
		-- treba biti AAAAAAAE
		ASSERT (tb_next_address = x"AAAAAAAE") report "Greska" severity failure;
		
	END PROCESS;

END;
