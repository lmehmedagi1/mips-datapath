----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:17 05/19/2019 
-- Design Name: 
-- Module Name:    DataMemory - Behavioral 
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

entity DataMemory is
    Port ( clock : in  STD_LOGIC;
           readAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           MemRead : in  STD_LOGIC;
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           MemWrite : in  STD_LOGIC;
           readData : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

	 -- niz od 64 memorijske lokacije
    type mem_array is array(0 to 63) of STD_LOGIC_VECTOR (31 downto 0);
    signal memorija: mem_array := (
        x"00000000",
        x"00000001", 
        x"00000002", 
        x"00000003", 
        x"00000004", 
        x"00000005", 
        x"00000006", 
        x"00000007", 
        x"00000008", 
        x"00000009", 
        x"0000000A", 
        x"0000000B", 
        x"0000000C", 
        x"0000000D", 
        x"0000000E", 
        x"00000010", 
        x"00000011", 
        x"00000012", 
        x"00000013", 
        x"00000014", 
        x"00000015", 
        x"00000016", 
        x"00000017", 
        x"00000018", 
        x"00000019", 
        x"0000001A", 
        x"0000001B", 
        x"0000001C", 
        x"0000001D", 
        x"0000001E", 
        x"00000020", 
        x"00000021", 
		  x"00000022",
        x"00000023", 
        x"00000024", 
        x"00000025", 
        x"00000026", 
        x"00000027", 
        x"00000028", 
        x"00000029", 
        x"0000002A", 
        x"0000002B", 
        x"0000002C", 
        x"0000002D", 
        x"0000002E", 
        x"00000030", 
        x"00000031", 
        x"00000032", 
        x"00000033", 
        x"00000034", 
        x"00000035", 
        x"00000036", 
        x"00000037", 
        x"00000038", 
        x"00000039", 
        x"0000003A", 
        x"0000003B", 
        x"0000003C", 
        x"0000003D", 
        x"0000003E", 
        x"00000040", 
        x"00000041", 
        x"00000042", 
        x"00000043"
    );

begin


    process(clock, MemRead, MemWrite)
        begin
        if rising_edge(clock) and MemRead = '1' then
				-- citamo iz memorije
				readData <= memorija(conv_integer(unsigned(readAddress)));
		  elsif rising_edge(clock) and MemWrite = '1' then
				-- upisujemo u memoriju
				memorija(conv_integer(unsigned(readAddress))) <= writeData;
		  else 
				-- nije bitna vrijednost
				readData <= x"00000001";
        end if;
	end process;


end Behavioral;

