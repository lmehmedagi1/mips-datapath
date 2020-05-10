----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:41:51 05/08/2019 
-- Design Name: 
-- Module Name:    MUX2_1 - Behavioral 
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

entity MUX2_1 is
	Generic (
		N : INTEGER := 32 -- jedna komponenta za 32bitne i 4bitne ulaze
	);
	
   Port ( rtOrRegValue 	  : in  STD_LOGIC_VECTOR (N - 1 downto 0);
          rdOrImmediate   : in  STD_LOGIC_VECTOR (N - 1 downto 0);
          regDstOrALUSrc  : in  STD_LOGIC;
          result  		  : out  STD_LOGIC_VECTOR (N - 1 downto 0));
end MUX2_1;

architecture Behavioral of MUX2_1 is
begin
	
	result <= rtOrRegValue WHEN regDstOrALUSrc = '0' ELSE rdOrImmediate;

end Behavioral;

