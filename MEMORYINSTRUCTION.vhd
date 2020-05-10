----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:59:36 04/10/2019 
-- Design Name: 
-- Module Name:    MEMORYINSTRUCTION - Behavioral 
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

entity MEMORYINSTRUCTION is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           data : out  STD_LOGIC_VECTOR (31 downto 0));
end MEMORYINSTRUCTION;

architecture Behavioral of MEMORYINSTRUCTION is

type memory is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);

signal mem : memory := (
        "00000000000000000000000000100000", -- add $0, $0, $0 (ne radi ni?ta) 
        "10001101000010000000000000000010", -- lw $t0, 2($t0)
        "00000001000010000100000000100000", -- add t0, t0, t0
        "10001101000100000000000000000000", -- lw $s0, 0(t0)
        "10101100010010000000000000000000", -- sw $t0, 0(v0)
        "00000001001010001010000000100000", -- add $s4, $t1, $t0
        "00000001000100001010100000100010", -- sub $s5, $t0, $s0
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000",  
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000",
        "00000000000000000000000000100000",
        "00000000000000000000000000100000",
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000",
        "00000000000000000000000000100000",
        "00000000000000000000000000100000",  
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000",
        "00000000000000000000000000100000",
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000",
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000",
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000", 
        "00000000000000000000000000100000"  
    );

begin

	data <= mem(conv_integer(unsigned(address))/4) WHEN conv_integer(unsigned(address)) < 128 ELSE mem(0);

end Behavioral;