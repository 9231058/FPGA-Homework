--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   04-03-2016
-- Module Name:   p4-5.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity counter is
	generic (N : natural := 4);
	port (clk : in std_logic;
		d : out std_logic_vector(N - 1 downto 0));
end entity counter;

architecture structural of counter is
	component t_flipflop is
		port( t, clk : in std_logic;
			q, q_bar : out std_logic);
	end component;

	signal C : std_logic_vector(N - 1 downto 0);
	signal B : std_logic_vector(N - 1 downto 0) := (others => '0');

	for all:t_flipflop use entity work.t_flipflop;
begin
	C(0) <= '1';
	c0: t_flipflop port map ('1', clk, B(0), open);
	
	cs: for I in 1 to N - 1 generate
		C(I) <= C(I - 1) and B(I - 1);
		cI: t_flipflop port map (C(I), clk, B(I), open);
	end generate;

	Bs: for I in 0 to N - 1 generate
		d(I) <= B(I);
	end generate;
end architecture structural;
