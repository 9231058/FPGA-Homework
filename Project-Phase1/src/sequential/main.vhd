--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   23-04-2016
-- Module Name:   main.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity main is
	port (str : in string (1 to 120);
		clk, reset : in std_logic);
end entity;

architecture rtl of main is
	component datapath
		port (clk : in std_logic;
			str : in string (1 to 120);
			fitness_clk, fitness_reset : in std_logic;
			fitness_done : out std_logic;
			memory_en, memory_rwbar, memory_reset : in std_logic);
	end component;
	component controller
		port (clk, reset : in std_logic;
			fitness_reset, fitness_clk : out std_logic;
			fitness_done : in std_logic;
			memory_rwbar, memory_en, memory_reset : out std_logic);
	end component;
	
	for all:datapath use entity work.datapath;
	for all:controller use entity work.controller;

	signal fitness_clk, fitness_reset, fitness_done : std_logic;
	signal memory_rwbar, memory_en, memory_reset : std_logic;
begin
	control:controller port map (clk, reset, fitness_reset, fitness_clk, fitness_done, memory_rwbar, memory_en, memory_reset);
	data:datapath port map (clk, str, fitness_clk, fitness_reset, fitness_done, memory_en, memory_rwbar, memory_reset);
end architecture;
