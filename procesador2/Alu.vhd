----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:49:17 10/08/2017 
-- Design Name: 
-- Module Name:    Alu - Behavioral 
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

entity Alu is
end Alu;

architecture Behavioral of Alu is

begin


end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( entrada_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           entrada_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
         
end Alu;

architecture Behavioral of Alu is

begin
process(entrada_1,entrada_2,operando)
	begin
	case (operando) is
	when "000000" =>salida<=entrada_1+entrada_2;
	when "000001" =>salida<=entrada_1-entrada_2;
	
	
	when others => 
   salida <= (others=>'0');

	end case;
	end process;


end Behavioral;