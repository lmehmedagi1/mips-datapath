
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:12:47 04/10/2019
-- Design Name:   MEMORYINSTRUCTION
-- Module Name:   C:/Xilinx92i/Projekat2/memoryinstruction_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MEMORYINSTRUCTION
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

ENTITY memoryinstruction_testbench_vhd IS
END memoryinstruction_testbench_vhd;

ARCHITECTURE behavior OF memoryinstruction_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT MEMORYINSTRUCTION
	PORT(
		address : IN std_logic_vector(31 downto 0);          
		data : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_address :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_data :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: MEMORYINSTRUCTION PORT MAP(
		address => tb_address,
		data => tb_data
	);

	tb : PROCESS
	BEGIN
	
--		-- read 12 commands
--		FOR I IN 0 TO 11 LOOP
--			tb_address <= x"8C0A0020" OR std_logic_vector(to_unsigned(I * 4, 32));
--			WAIT FOR 25 ns;
--		END LOOP;
		
		tb_address <= x"00000000";
		wait for 50 ns;
		
		-- treba biti x"8C0A0020"
		ASSERT (tb_data = x"8C0A0020") report "Greska" severity warning;
		
		
			
	END PROCESS;

END;
