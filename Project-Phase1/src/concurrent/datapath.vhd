--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   23-04-2016
-- Module Name:   datapath.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity datapath is
	port (clk : in std_logic;
		str : in string (1 to 120);
		sel : in std_logic_vector(7 downto 0);
		memory_en, memory_rwbar, memory_reset : in std_logic);
end entity datapath;

architecture rtl of datapath is
	component fulladdr
		port (a, b : in std_logic_vector(3 downto 0);
			c_in : in std_logic;
			c_out : out std_logic;
			sum : out std_logic_vector(3 downto 0));
	end component;
	component memory
		port (address : in std_logic_vector;
			data_in : in std_logic_vector;
			data_out : out std_logic_vector;
			clk, rwbar, en, reset : in std_logic);
	end component;
	component fitness
		port (c1, c2 : in character;
			a, b : out std_logic_vector(4 downto 0));
	end component;

	for all:memory use entity work.memory;
	for all:fulladdr use entity work.fulladdr;
	for all:fitness use entity work.fitness;
	
	type fit_output is array (1 to 120) of std_logic_vector(4 downto 0);

	signal data_in, data_out : std_logic_vector(3 downto 0);
	signal c_out : std_logic;
	signal a, b : fit_output;
	signal address : std_logic_vector(9 downto 0);
begin
	fa:fulladdr port map (data_out, "0001", '0', c_out, data_in);
	mem:memory port map (address, data_in, data_out, clk, memory_rwbar, memory_en, memory_reset);
	fits: for I in 1 to 119 generate
		fit:fitness port map (str(I), str(I + 1), a(I), b(I));
	end generate;
	address <= a(to_integer(unsigned(sel))) & b(to_integer(unsigned(sel)));
end architecture rtl;
