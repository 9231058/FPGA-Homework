--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   05-05-2016
-- Module Name:   p7.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity p7 is
end entity;

architecture rtl of p7 is
	component ring_counter
		generic (N : integer := 4);
		port (clk, start : in std_logic;
			Q : out std_logic_vector(N - 1 downto 0));
	end component;

	for all:ring_counter use entity work.ring_counter;

	signal clk : std_logic := '0';
	signal start : std_logic := '1';
	signal Q : std_logic_vector(3 downto 0);
begin
	clk <= not clk after 50 ns;

	start <= '0' after 75 ns;

	m:ring_counter port map (clk, start, Q);
end architecture;
