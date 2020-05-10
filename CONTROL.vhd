----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:15:24 05/08/2019 
-- Design Name: 
-- Module Name:    CONTROL - Behavioral 
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

entity CONTROL is
    Port ( opcode        : IN std_logic_vector(5 DOWNTO 0); -- instruction 31-26
			  RegDst        : OUT std_logic;
			  ALUSrc        : OUT std_logic;
			  MemToReg      : OUT std_logic;
			  RegWrite      : OUT std_logic;
			  MemRead       : OUT std_logic;
			  MemWrite      : OUT std_logic;
			  Branch        : OUT std_logic;
			  ALUop         : OUT std_logic_vector(1 DOWNTO 0));
end CONTROL;

architecture Behavioral of CONTROL is
begin
	PROCESS (opcode)
	BEGIN
		CASE opcode IS
			WHEN "000000" => -- R tip instrukcija
				RegDst        <= '1';
				ALUSrc        <= '0';
				MemToReg      <= '0';
				RegWrite      <= '1';
				MemRead       <= '0';
				MemWrite      <= '0';
				Branch        <= '0';
				ALUop         <= "10";
			WHEN "100011" => -- I tip (load word - lw)
				RegDst        <= '0';
				ALUSrc        <= '1';
				MemToReg      <= '1';
				RegWrite      <= '1';
				MemRead       <= '1';
				MemWrite      <= '0';
				Branch        <= '0';
				ALUop         <= "00";
			WHEN "101011" => -- I tip (store word - sw)
				RegDst        <= '0';
				ALUSrc        <= '1';
				MemToReg      <= '0';
				RegWrite      <= '0';
				MemRead       <= '0';
				MemWrite      <= '1';
				Branch        <= '0';
				ALUop         <= "00";
			WHEN OTHERS => NULL; -- nece biti drugih po postavci
				RegDst        <= '0';
				ALUSrc        <= '0';
				MemToReg      <= '0';
				RegWrite      <= '0';
				MemRead       <= '0';
				MemWrite      <= '0';
				Branch        <= '0';
				ALUop         <= "00";
		END CASE;
END PROCESS;

end Behavioral;

