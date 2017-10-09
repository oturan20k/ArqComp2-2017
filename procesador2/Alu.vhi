
-- VHDL Instantiation Created from source file Alu.vhd -- 01:01:58 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT Alu
	PORT(
		entrada_1 : IN std_logic_vector(31 downto 0);
		entrada_2 : IN std_logic_vector(31 downto 0);
		operando : IN std_logic_vector(5 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_Alu: Alu PORT MAP(
		entrada_1 => ,
		entrada_2 => ,
		operando => ,
		salida => 
	);


