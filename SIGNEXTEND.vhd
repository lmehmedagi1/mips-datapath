----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:08 05/08/2019 
-- Design Name: 
-- Module Name:    SIGNEXTEND - Behavioral 
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

entity SIGNEXTEND is
    Port ( data : in  STD_LOGIC_VECTOR (15 downto 0);
           extended : out  STD_LOGIC_VECTOR (31 downto 0));
end SIGNEXTEND;

architecture Behavioral of SIGNEXTEND is

begin
	-- prosirujemo sa 0ama ako je msb data = 0, a sa 1ama ako je 1
	extended <= x"0000" & data WHEN data(15) = '0' ELSE x"FFFF" & data;
end Behavioral;

