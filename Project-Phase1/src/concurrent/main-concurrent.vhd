--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   31-03-2016
-- Module Name:   main-concurrent.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity main_concurrent is
	port (c1, c2 : in character;
		a, b : out std_logic_vector (4 downto 0));
end entity main_concurrent;

architecture rtl of main_concurrent is
begin
	process (c1, c2)
	begin
		if c1 = ' ' then
			a <= "11010"; -- a = 26
		else
			a <= std_logic_vector(to_unsigned(character'pos(c1) - 96, 5)); -- a = s[i] - 'a'
		end if;
		if c2 = ' ' then
			b <= "11010"; -- b = 26
		else
			b <= std_logic_vector(to_unsigned(character'pos(c2) - 96, 5)); -- b = s[i + 1] - 'a'
		end if;
	end process;
end architecture rtl;
