
--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:54:44 04/10/2019
-- Design Name:   PC
-- Module Name:   C:/Xilinx92i/Projekat2/pc_testbench.vhd
-- Project Name:  Projekat2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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

ENTITY pc_testbench_vhd IS
END pc_testbench_vhd;

ARCHITECTURE behavior OF pc_testbench_vhd IS 

	-- Component Declaration for the Unit Under Test (UUT)
	COMPONENT PC
	PORT(
		clk : IN std_logic;
		pc_in : IN std_logic_vector(31 downto 0);          
		pc_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	--Inputs
	SIGNAL tb_clk :  std_logic := '0';
	SIGNAL tb_pc_in :  std_logic_vector(31 downto 0) := (others=>'0');

	--Outputs
	SIGNAL tb_pc_out :  std_logic_vector(31 downto 0);

BEGIN

	-- Instantiate the Unit Under Test (UUT)
	uut: PC PORT MAP(
		clk => tb_clk,
		pc_in => tb_pc_in,
		pc_out => tb_pc_out
	);

	tb_clock : PROCESS
	BEGIN
	
		tb_clk <= '0';
		tb_pc_in <= x"00000002";
		WAIT FOR 50 ns;
		ASSERT (tb_pc_out /= x"00000002") report "Greska silazna ivica sata" severity warning;
		
		
		tb_clk <= '1';
		tb_pc_in <= x"00000005";
		WAIT FOR 50 ns;
		ASSERT (tb_pc_out = x"00000005") report "Greska rastuca ivica sata" severity warning;
		
	END PROCESS;
	
	

END;
