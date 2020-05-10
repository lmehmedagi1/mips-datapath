
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:32:05 05/26/2019
-- Design Name:   DATAPATH
-- Module Name:   C:/Users/Lejla/Desktop/Lab8/datapath_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DATAPATH
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

ENTITY datapath_testbench_vhd IS
END datapath_testbench_vhd;

ARCHITECTURE behavior OF datapath_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT DATAPATH
	PORT(
		clk : IN std_logic;          
		address : OUT std_logic_vector(31 downto 0);
		instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_clk :  std_logic := '0';

	--Outputs
	SIGNAL tb_address :  std_logic_vector(31 downto 0);
	SIGNAL tb_instruction :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: DATAPATH PORT MAP(
		clk => tb_clk,
		address => tb_address,
		instruction => tb_instruction
	);

	tb : PROCESS
	BEGIN

		-- imamo 32 instrukcija u memoriji instrukcija
		-- adrese su redom 0, 4, 8, 12, ..., 124
		-- instrukcije definisane u memoryinstruction komponenti
		
		petlja : for i in 1 to 32 loop
		
			-- postavljamo rastu?u ivicu sata 
			tb_clk <= '0';
			WAIT FOR 50 ns;
			tb_clk <= '1';
			WAIT FOR 50 ns;
			
		end loop petlja;

		
	END PROCESS;

END;
