--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   25-04-2016
-- Module Name:   p5.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity main is
	port (clk, load : in std_logic;
		b : in std_logic_vector(7 downto 0);
		serial : out std_logic);
end entity;

architecture rtl of main is
	component counter
		generic (N : integer := 4);
		port (clk, reset : in std_logic;
			count : out std_logic_vector (N - 1 downto 0));
	end component;
	component parity_generator
		port (w, clk, reset : in std_logic;
			p : out std_logic);
	end component;
	component shift_register
		generic (N : integer := 8);
		port (data_in : in std_logic_vector (N - 1 downto 0);
			load, clk : in std_logic;
			data_out : out std_logic);
	end component;

	for all:counter use entity work.counter;
	for all:parity_generator use entity work.parity_generator;
	for all:shift_register use work.shift_register;

	signal w, p : std_logic;
	signal c : std_logic_vector(2 downto 0);
begin
	sr:shit_register port map (b, load, clk, w) generic map (8);
	pg:parity_generator port map (w, clk, load, p);
	cn:counter port map (clk, load, c) generic map (3);
	serial <= p when c = "111" else w;
end architecture rtl;
