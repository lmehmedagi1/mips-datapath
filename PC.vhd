----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:48:42 04/10/2019 
-- Design Name: 
-- Module Name:    PC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( clk : in  STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

architecture Behavioral of PC is

begin
process (clk)
	begin
	if rising_edge(clk) then 
		pc_out <= pc_in;
	end if;
end process;
end Behavioral;