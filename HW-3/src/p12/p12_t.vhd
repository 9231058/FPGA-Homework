--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   26-04-2016
-- Module Name:   p12_t.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity drawstring_t is
end entity;

architecture rtl of drawstring_t is
	component drawstring
		port (p1, p2 : in std_logic;
			clk, reset : in std_logic;
			led : out std_logic_vector (9 downto 1));
	end component;

	for all:drawstring use entity work.drawstring;
	
	signal reset, p1, p2 : std_logic;
	signal clk : std_logic := '0';
	signal led : std_logic_vector (9 downto 1);
begin
	reset <= '1', '0' after 50 ns;
	clk <= not clk after 50 ns;

	p1 <= '1' after 50 ns, '0' after 110 ns, '1' after 220 ns;
	p2 <= '0', '1' after 55 ns, '0' after 65 ns;

	m : drawstring port map (p1, p2, clk, reset, led);
end architecture;
