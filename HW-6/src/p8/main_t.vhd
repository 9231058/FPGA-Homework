--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   31-05-2016
-- Module Name:   main_t.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity main_t is
end entity;

architecture rtl of main_t is
	component main
		port (clk, a, b : in std_logic;
		     output : out std_logic_vector (3 downto 0));
	end component;

	signal clk, a, b : std_logic := '0';
	signal status : std_logic_vector (3 downto 0);
begin
	clk <= not clk after 25 ns;

	a <= '1' after 250 ns, '0' after 400 ns;
	b <= '1' after 300 ns, '0' after 450 ns;

	m : main port map (clk, a, b, status);
end architecture;
