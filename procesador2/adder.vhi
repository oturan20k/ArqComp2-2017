
-- VHDL Instantiation Created from source file adder.vhd -- 00:07:06 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT adder
	PORT(
		entrada_a : IN std_logic_vector(31 downto 0);
		entrada_b : IN std_logic_vector(31 downto 0);          
		salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_adder: adder PORT MAP(
		entrada_a => ,
		entrada_b => ,
		salida => 
	);


