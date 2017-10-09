
-- VHDL Instantiation Created from source file MUX.vhd -- 00:52:23 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MUX
	PORT(
		entrada_2 : IN std_logic_vector(31 downto 0);
		imm_bit : IN std_logic;
		entrada_SEU : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_MUX: MUX PORT MAP(
		entrada_2 => ,
		imm_bit => ,
		entrada_SEU => ,
		salida => 
	);


