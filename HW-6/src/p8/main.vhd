--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   31-05-2016
-- Module Name:   main.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity main is
	port (clk, a, b : std_logic;
	     output : std_logic_vector (3 downto 0));
end entity;

architecture rtl of main is
	component datapath
		port (clk, ent, ext : in std_logic;
		     output : out std_logic_vector (3 downto 0));
	end component;

	component control
		port (ent, ext : out std_logic
			a, b : in std_logic;
			clk : in std_logic);
	end component;

	for all:control use entity work.control(rtl);
	for all:datapath use entity work.datapath;
	
	signal ent, ext : std_logic;
begin
	ctrl : control port map (ent, ext, a, b, clk);
	dp : datapath port map (clk, ent, ext, output);
end architecture;
