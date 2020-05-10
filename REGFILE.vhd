----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:57:40 05/08/2019 
-- Design Name: 
-- Module Name:    REGFILE - Behavioral 
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

entity REGFILE is
    Port ( clock 			 : in  STD_LOGIC;
           regWrite 		 : in  STD_LOGIC;
           readRegister1 : in  STD_LOGIC_VECTOR (4 downto 0);
           readRegister2 : in  STD_LOGIC_VECTOR (4 downto 0);
           writeRegister : in  STD_LOGIC_VECTOR (4 downto 0);
           writeData 	 : in  STD_LOGIC_VECTOR (31 downto 0);
           registerData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           registerData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end REGFILE;

architecture Behavioral of REGFILE is
	
	-- niz od 32 registra 
    type mem_array is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
    signal registri: mem_array := (
        "00000000000000000000000000000000", -- R0
        "00000000000000000000000000000000", -- $at
        "00000000000000000000000000000000", -- $v0
        "00000000000000000000000000000000", -- $v1
        "00000000000000000000000000000000", -- $a0
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", -- $a3
        "00000000000000000000000000000000", -- $t0
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", -- $t7
        "00000000000000000000000000000000", -- $s0
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",  
        "00000000000000000000000000000000", 
        "00000000000000000000000000000000",
        "00000000000000000000000000000000",
        "00000000000000000000000000000000", -- $s7
        "00000000000000000000000000000000", -- $t8
        "00000000000000000000000000000000", -- $t9
        "00000000000000000000000000000000", -- $k0
        "00000000000000000000000000000000", -- $k1
        "00000000000000000000000000000000", -- $gp - globalni pokazivac
        "00000000000000000000000000000000", -- $sp - pokazivac na stek
        "00000000000000000000000000000000", -- $fp - pokazivac na okvir
        "00000000000000000000000000000000"  -- $ra - adresa na koju procedura vraca vrijednost 
    );

	begin

    registerData1 <= registri(conv_integer(unsigned(readRegister1)));
    registerData2 <= registri(conv_integer(unsigned(readRegister2)));

    process(clock)
        begin
        if rising_edge(clock) and regWrite = '1' and writeRegister /= "00000" then
				-- upisujemo u registre na rastucu ivicu sata
				registri(conv_integer(unsigned(writeRegister))) <= writeData;
        end if;
end process;

end Behavioral;

