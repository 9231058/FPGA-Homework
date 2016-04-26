--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   26-04-2016
-- Module Name:   p8_t.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity p8_t is
end entity;

architecture rtl of p8_t is
	component p8
		port (i1, i2 : in std_logic;
			o : out std_logic;
			clk, reset : in std_logic);
	end component;

	for all:p8 use entity work.p8(sequential);
	
	signal clk : std_logic := '0';
	signal reset, i1, i2, o : std_logic;
begin
	clk <= not clk after 50 ns;
	reset <= '1', '0' after 40 ns;
	i1 <= '1', '0' after 110 ns, '1' after 220 ns;
	i2 <= '0', '1' after 55 ns, '0' after 210 ns;
	m : p8 port map (i1, i2, o, reset, clk);
end architecture;
