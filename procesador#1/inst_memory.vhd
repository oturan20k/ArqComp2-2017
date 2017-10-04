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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_file is
Port ( 
           reset : in  STD_LOGIC;
           reg_s_1 : in  STD_LOGIC_VECTOR (4 downto 0);
           reg_s_2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in STD_LOGIC_VECTOR (31 downto 0);
           salida_1 : out  STD_LOGIC_VECTOR (31 downto 0);
           salida_2 : out  STD_LOGIC_VECTOR (31 downto 0));
end reg_file;

architecture Behavioral of reg_file is

type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
signal rgs : ram_type :=(others => x"00000000");

begin

process(reset,reg_s_1,reg_s_2,rd,dwr)
	begin
	
			if(reset = '1')then
				salida_1 <= (others=>'0');
				salida_2 <= (others=>'0');

				rgs <= (others => x"00000000");
			else
				salida_1 <= rgs(conv_integer(reg_s_1));
				salida_2 <= rgs(conv_integer(reg_s_2));
				if(rd /= "000000")then
					rgs(conv_integer(rd)) <= dwr;
				end if;
			end if;

end process;


end Behavioral;
