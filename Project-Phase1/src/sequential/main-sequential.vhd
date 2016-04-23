--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   31-03-2016
-- Module Name:   fitness-sequential.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fitness_sequential is
	port (s : in string (1 to 120);
		clk, reset : in std_logic;
		a, b : out std_logic_vector (4 downto 0);
		done : out std_logic);
end entity fitness_sequential;

architecture rtl of fitness_sequential is
begin
	process (clk)
		variable I : integer := 1;
	begin
		if clk'event and clk = '1' then
			if I < 120 then
				if s(I) = ' ' then
					a <= "11010"; -- a = 26
				else
					a <= std_logic_vector(to_unsigned(character'pos(s(I)) - 96, 5)); -- a = s[i] - 'a'
				end if;
				if s(I + 1) = ' ' then
					b <= "11010"; -- b = 26
				else
					b <= std_logic_vector(to_unsigned(character'pos(s(I + 1)) - 96, 5)); -- b = s[i + 1] - 'a'
				end if;
				I := I + 1;
			end if;
		end if;
	end process;
end architecture rtl;
