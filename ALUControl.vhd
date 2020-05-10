----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:39:06 05/12/2019 
-- Design Name: 
-- Module Name:    ALUControl - Behavioral 
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

entity ALUControl is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           control : out  STD_LOGIC);
end ALUControl;

architecture Behavioral of ALUControl is

begin
	-- izlaz je 0 - sabiranje
	-- izlaz je 1 - oduzimanje
	
	-- po postavci koriste se samo add, sub, lw i sw
	
	-- lw i sw u ovoj fazi sabiraju vrijednost ref. registra i neposrednu vrijednost, add sabira komponente, pa je oduzimanje samo kod sub
	-- za sub ALUOp = 10 i funct = 34 = "100010"
	
	control <= '1' WHEN ALUOp = "10" AND funct = "100010" ELSE '0';

end Behavioral;

