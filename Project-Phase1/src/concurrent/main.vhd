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
			sel : in std_logic_vector (7 downto 0);
			memory_en, memory_rwbar, memory_reset : in std_logic);
	end component;
	component controller
		port (clk, reset : in std_logic;
			sel : out std_logic_vector (7 downto 0);
			memory_rwbar, memory_en, memory_reset : out std_logic);
	end component;

	for all:datapath use entity work.datapath;
	for all:controller use entity work.controller;

	signal sel : std_logic_vector (7 downto 0);
	signal memory_rwbar, memory_en, memory_reset : std_logic;
begin
	control:controller port map (clk, reset, sel, memory_rwbar, memory_en, memory_reset);
	data:datapath port map (clk, str, sel, memory_en, memory_rwbar, memory_reset);
end architecture;
