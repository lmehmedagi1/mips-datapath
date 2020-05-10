----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:50 05/12/2019 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( readData1 : in  STD_LOGIC_VECTOR (31 downto 0);
           muxOutput : in  STD_LOGIC_VECTOR (31 downto 0);
           operation : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

	-- operation je 0 - sabiranje
	-- operation je 1 - oduzimanje

	result <= readData1 + muxOutput WHEN operation = '0' ELSE readData1 - muxOutput;

end Behavioral;

