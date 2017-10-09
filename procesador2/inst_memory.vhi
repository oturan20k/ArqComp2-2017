
-- VHDL Instantiation Created from source file inst_memory.vhd -- 00:33:31 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT inst_memory
	PORT(
		direccion : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		salida_instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_inst_memory: inst_memory PORT MAP(
		direccion => ,
		reset => ,
		salida_instruccion => 
	);


