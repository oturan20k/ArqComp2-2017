
-- VHDL Instantiation Created from source file reg_file.vhd -- 00:43:58 10/09/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_reg_file: reg_file PORT MAP(
		reset => ,
		reg_s_1 => ,
		reg_s_2 => ,
		rd => ,
		dwr => ,
		salida_1 => ,
		salida_2 => 
	);


