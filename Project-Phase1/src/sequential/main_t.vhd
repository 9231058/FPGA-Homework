--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   24-04-2016
-- Module Name:   main_t.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity main_t is
end entity main_t;

architecture rtl of main_t is
	component main
		port (str : in string (1 to 120);
			clk, reset : in std_logic);
	end component;
	
	for all:main use entity work.main;

	signal clk, reset : std_logic := '0';
	signal str : string (1 to 120);
begin
	m : main port map (str, clk, reset);
	str <= (others => 'a');
	reset <= '1', '0' after 10 ns;
	clk <= not clk after 50 ns;
end architecture;
