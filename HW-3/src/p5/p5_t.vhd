--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   25-04-2016
-- Module Name:   p5_t.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity main_t is
end entity;

architecture behavioral of main_t is
	component main
		port (clk, load : in std_logic;
			b : in std_logic_vector(7 downto 0);
			serial : out std_logic);
	end component;

	for all:main use entity work.main;

	signal clk, reset : std_logic := '0';
	signal data : std_logic_vector(7 downto 0);
	signal serial : std_logic;
begin
	reset <= '1', '0' after 100 ns;
	clk <= not clk after 50 ns;
	data <= "10101010";

	m : main port map (clk, reset, data, serial);
end architecture;
