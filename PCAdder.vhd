----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:58:44 04/10/2019 
-- Design Name: 
-- Module Name:    PCAdder - Behavioral 
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

entity PCAdder is
    Port ( cur_address : in  STD_LOGIC_VECTOR (31 downto 0);
           next_address : out  STD_LOGIC_VECTOR (31 downto 0));
end PCAdder;

architecture Behavioral of PCAdder is
begin 
process (cur_address)
	begin
		next_address <= cur_address+x"00000004";
	end process;
end Behavioral;