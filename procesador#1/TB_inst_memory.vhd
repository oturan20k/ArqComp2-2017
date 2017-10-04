--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:45:04 10/02/2017
-- Design Name:   
-- Module Name:   D:/Procesador1/TB_reg_file.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg_file
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_reg_file IS
END TB_reg_file;
 
ARCHITECTURE behavior OF TB_reg_file IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg_file
    PORT(
         reset : IN  std_logic;
         reg_s_1 : IN  std_logic_vector(4 downto 0);
         reg_s_2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         dwr : IN  std_logic_vector(31 downto 0);
         salida_1 : OUT  std_logic_vector(31 downto 0);
         salida_2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal reg_s_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal reg_s_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida_1 : std_logic_vector(31 downto 0);
   signal salida_2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg_file PORT MAP (
          reset => reset,
          reg_s_1 => reg_s_1,
          reg_s_2 => reg_s_2,
          rd => rd,
          dwr => dwr,
          salida_1 => salida_1,
          salida_2 => salida_2
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		reg_s_1 <= "00001";
		reg_s_2 <= "00010";
		rd <= "00011";
		dwr <= x"00000101";
		

      

      -- insert stimulus here 

      wait;
   end process;

END;
