--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   04-03-2016
-- Module Name:   t-flipflop.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity t_flipflop is
	port( t, clk : in std_logic;
		q, q_bar : out std_logic);
end entity;

architecture behavioral of t_flipflop is
	signal buff : std_logic := '0';
begin
	q <= buff;
	q_bar <= not buff;
	process (clk)
	begin
		if clk'event and clk = '1' and t = '1' then
			buff <= not buff;
		end if;
	end process;
end architecture;
