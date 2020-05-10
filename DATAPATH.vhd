----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:11:26 04/10/2019 
-- Design Name: 
-- Module Name:    DATAPATH - Behavioral 
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

entity DATAPATH is
    Port ( clk : in  STD_LOGIC;
           address : out  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end DATAPATH;

architecture Behavioral of DATAPATH is


-- komponente

component PC is
    Port ( clk : in  STD_LOGIC;
           pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component PCAdder is
    Port ( cur_address : in  STD_LOGIC_VECTOR (31 downto 0);
           next_address : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component MEMORYINSTRUCTION is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           data : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component CONTROL is
    Port ( opcode        : IN std_logic_vector(5 DOWNTO 0); -- instruction 31-26
			  RegDst        : OUT std_logic;
			  ALUSrc        : OUT std_logic;
			  MemToReg      : OUT std_logic;
			  RegWrite      : OUT std_logic;
			  MemRead       : OUT std_logic;
			  MemWrite      : OUT std_logic;
			  Branch        : OUT std_logic;
			  ALUop         : OUT std_logic_vector(1 DOWNTO 0));
end component;

component MUX2_1 is
	 Generic (W : integer);
    Port ( rt 		: in  STD_LOGIC_VECTOR;
           rd 		: in  STD_LOGIC_VECTOR;
           regDst : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR);
end component;

component REGFILE is
    Port ( clock 			 : in  STD_LOGIC;
           regWrite 		 : in  STD_LOGIC;
           readRegister1 : in  STD_LOGIC_VECTOR (4 downto 0);
           readRegister2 : in  STD_LOGIC_VECTOR (4 downto 0);
           writeRegister : in  STD_LOGIC_VECTOR (4 downto 0);
           writeData 	 : in  STD_LOGIC_VECTOR (31 downto 0);
           registerData1 : out  STD_LOGIC_VECTOR (31 downto 0);
           registerData2 : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component SIGNEXTEND is
    Port ( data : in  STD_LOGIC_VECTOR (15 downto 0);
           extended : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALUControl is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           funct : in  STD_LOGIC_VECTOR (5 downto 0);
           control : out  STD_LOGIC);
end component;

component ALU is
    Port ( readData1 : in  STD_LOGIC_VECTOR (31 downto 0);
           muxOutput : in  STD_LOGIC_VECTOR (31 downto 0);
           operation : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component DataMemory is
    Port ( clock : in  STD_LOGIC;
           readAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           MemRead : in  STD_LOGIC;
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           MemWrite : in  STD_LOGIC;
           readData : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


-- signali


signal pc_output : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";
signal adder_output : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";

-- podaci
signal read_data1 : std_logic_vector(31 downto 0):= "00000000000000000000000000000000"; -- procitano iz registra rs
signal read_data2 : std_logic_vector(31 downto 0):= "00000000000000000000000000000000"; -- procitano iz registra rt
signal write_data : std_logic_vector(31 downto 0):= "00000000000000000000000000000000"; -- vrijednost koju upisujemo u rd
signal extended_immediate : std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal write_register : std_logic_vector(4 downto 0) := "00000"; -- registar u koji upisujemo
signal secondALUOperand : std_logic_vector(31 downto 0):= "00000000000000000000000000000000"; -- extended immediate ili read_data2
signal ALUResult : std_logic_vector(31 downto 0):= "00000000000000000000000000000000";

signal read_from_memory : std_logic_vector(31 downto 0):= "00000000000000000000000000000000"; -- vrijednost procitana iz memorije

signal aluOperation : std_logic := '0';

-- biti instrukcije
signal immediate : std_logic_vector(15 downto 0);
signal opcode : std_logic_vector(5 downto 0);
signal rs : std_logic_vector(4 downto 0);
signal rt : std_logic_vector(4 downto 0);
signal rd : std_logic_vector(4 downto 0);
signal funct : std_logic_vector(5 downto 0);

-- signali za control
signal reg_dest : std_logic := '0';
signal alu_src  : std_logic := '0';
signal mem_to_reg : std_logic := '0';
signal reg_write : std_logic := '0';
signal mem_read : std_logic := '0';
signal mem_write : std_logic := '0';
signal branch : std_logic := '0';
signal alu_op: std_logic_vector(1 downto 0);

signal current_instruction : STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000000";


begin

	pm1 : PC 					port map (clk, adder_output, address);
	pm2 : PCAdder 				port map (pc_output, adder_output);
	pm3 : MEMORYINSTRUCTION port map (pc_output, current_instruction);
	
	opcode <= current_instruction(31 downto 26);
	rs <= current_instruction(25 downto 21);
	rt <= current_instruction(20 downto 16);
	rd <= current_instruction(15 downto 11);
	funct <= current_instruction(5 downto 0);
	immediate <= current_instruction(15 downto 0);
	
	instruction <= current_instruction;
	
	pm4 : CONTROL 	   port map (opcode, reg_dest, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op);
	pm5 : MUX2_1 	   generic map (5) port map (rt, rd, reg_dest, write_register);
	pm6 : REGFILE 	   port map (clk, reg_write, rs, rt, write_register, write_data, read_data1, read_data2);
	pm7 : SIGNEXTEND  port map (immediate, extended_immediate);
	pm8 : MUX2_1 	   generic map (32) port map (read_data2, extended_immediate, alu_src, secondALUOperand);
	pm9 : ALUControl  port map (alu_op, funct, aluOperation);
	pm10 : ALU 		   port map (read_data1, secondALUOperand, aluOperation, ALUResult);
	pm11 : DataMemory port map (clk, ALUResult, mem_read, read_data2, mem_write, read_from_memory);
	pm12 : MUX2_1 		generic map (32) port map (ALUResult, read_from_memory, mem_to_reg, write_data);
	pm13 : REGFILE 	port map (clk, reg_write, rs, rt, write_register, write_data, read_data1, read_data2);
	
	process (clk) begin
		if rising_edge(clk) then
			pc_output <= adder_output;
		end if;
	end process;
	
end Behavioral;

