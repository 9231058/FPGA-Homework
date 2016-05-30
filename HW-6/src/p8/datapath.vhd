--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   30-05-2016
-- Module Name:   datapath.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;


entity datapath is
	port (clk, a, b : in std_logic;
	     output : out std_logic_vector (3 downto 0));
end entity;

architecture rtl of datapath is
	component control
		port (ent, ext : out std_logic
			a, b : in std_logic;
			clk : in std_logic);
	end component;
	
	component counter
		generic (N : integer := 4);
		port (inc, dec : in std_logic;
			output : out std_logic_vector (N - 1 downto 0);
			clk : in std_logic);
	end component;

	for all:control use entity work.control(rtl);
	for all:counter use entity work.counter;

	signal ent, ext : std_logic;
begin
	ctrl : control port map (ent, ext, a, b, clk);
	cntr : counter port map (ent, ext, output, clk);
end architecture;
