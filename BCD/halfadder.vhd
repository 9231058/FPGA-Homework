library IEEE;
use IEEE.std_logic_1164.all;

entity halfadder is
	port (a, b : in std_logic;
		s : out std_logic;
		c : out std_logic);
end entity;

architecture behavioral of halfadder is
begin
	process (a, b)
	begin
		if a = b then
			s <= '0';
			if (a = '1') then
				c <= '1';
			else
				c <= '0';
			end if;
		else
			s <= '1';
			c <= '0';
		end if;
	end process;
end architecture;
