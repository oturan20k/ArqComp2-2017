----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:17:51 10/09/2017 
-- Design Name: 
-- Module Name:    procesador2 - arq_procesador2 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity procesador2 is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salida_procesador : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture arq_procesador2 of procesador2 is

COMPONENT adder
	PORT(
		entrada_a : IN std_logic_vector(31 downto 0);
		entrada_b : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT PC
	PORT(
		entrada : IN std_logic_vector(31 downto 0);
		RST : IN std_logic;
		CLK : IN std_logic;          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT inst_memory
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		salida_instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT unidad_control
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	COMPONENT reg_file
	PORT(
		reset : IN std_logic;
		reg_s_1 : IN std_logic_vector(4 downto 0);
		reg_s_2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		dwr : IN std_logic_vector(31 downto 0);          
		salida_1 : OUT std_logic_vector(31 downto 0);
		salida_2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT MUX
	PORT(
		entrada_2 : IN std_logic_vector(31 downto 0);
		imm_bit : IN std_logic;
		entrada_SEU : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT SEU
	PORT(
		imm : IN std_logic_vector(12 downto 0);          
		salida_imm : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT Alu
	PORT(
		entrada_1 : IN std_logic_vector(31 downto 0);
		entrada_2 : IN std_logic_vector(31 downto 0);
		operando : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	

signal adder_to_NPC, NPC_to_PC, PC_to_Inst_memory, inst_memory_to_URS, Alu_res, reg_file_to_Alu1, reg_file_to_Mux, SEU_to_MUX, MUX_to_Alu: STD_LOGIC_VECTOR (31 downto 0);
signal unidad_control_salida : STD_LOGIC_VECTOR (5 downto 0);

begin
Inst_adder: adder PORT MAP(
		entrada_a => x"00000001",
		entrada_b => NPC_to_PC,
		salida => adder_to_NPC
	);
	
Inst_next_PC: PC PORT MAP(
		entrada =>adder_to_NPC ,
		RST => rst,
		CLK => clk ,
		salida =>NPC_to_PC 
	);
Inst_PC: PC PORT MAP(
		entrada =>NPC_to_PC ,
		RST => rst,
		CLK => clk ,
		salida =>PC_to_Inst_memory 
	);
Inst_inst_memory: inst_memory PORT MAP(
		direccion => PC_to_Inst_memory  ,
		reset => rst ,
		salida_instruccion => inst_memory_to_URS 
	);
Inst_unidad_control: unidad_control PORT MAP(
		op => inst_memory_to_URS(31 downto 30) ,
		op3 => inst_memory_to_URS(24 downto 19) ,
		salida => unidad_control_salida 
	);	
Inst_reg_file: reg_file PORT MAP(
		reset => rst,
		reg_s_1 => inst_memory_to_URS (18 downto 14),
		reg_s_2 => inst_memory_to_URS (4 downto 0),
		rd =>inst_memory_to_URS (29 downto 25) ,
		dwr => Alu_res ,
		salida_1 => reg_file_to_Alu1 ,
		salida_2 => reg_file_to_Mux
	);
Inst_MUX: MUX PORT MAP(
		entrada_2 => reg_file_to_Mux ,
		imm_bit => inst_memory_to_URS (13),
		entrada_SEU => SEU_to_MUX ,
		salida => MUX_to_Alu
	);
Inst_SEU: SEU PORT MAP(
		imm => inst_memory_to_URS (12 downto 0),
		salida_imm => SEU_to_MUX
	);
Inst_Alu: Alu PORT MAP(
		entrada_1 => reg_file_to_Alu1,
		entrada_2 => MUX_to_Alu ,
		operando => unidad_control_salida ,
		salida => Alu_res
	);
	
	salida_procesador <= Alu_res;

	





end arq_procesador2;

