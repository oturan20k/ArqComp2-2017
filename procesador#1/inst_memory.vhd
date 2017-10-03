----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:28:07 10/02/2017 
-- Design Name: 
-- Module Name:    inst_memory - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
    Port ( entrada_a : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_b : in  STD_LOGIC_VECTOR (31 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end adder;

architecture Behavioral of adder is

begin
process(entrada_a, entrada_b)
	begin
		salida <= std_logic_vector(UNSIGNED(entrada_a) + UNSIGNED(entrada_b));
	end process ;


end Behavioral;
