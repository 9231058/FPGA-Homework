--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   05-05-2016
-- Module Name:   ring-counter.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity ring_counter is
	generic (N : integer := 4);
	port (clk, start : in std_logic;
		Q : out std_logic_vector(N - 1 downto 0));
end entity ring_counter;

architecture rtl of ring_counter is
	component d_flipflop
		port ( clk, reset, preset : in std_logic;
			d : in std_logic;
			q, qbar : out std_logic);
	end component;

	for all:d_flipflop use entity work.d_flipflop;

	signal b : std_logic_vector (N - 1 downto 0);
	signal bbar : std_logic_vector (N - 1 downto 0);
begin
	dff:d_flipflop port map (clk, '0', start, b(N - 1), b(0), bbar(0));
	dffsg: for I in 1 to N - 1 generate
		dffs:d_flipflop port map (clk, start, '0', b(I - 1), b(I), bbar(I));
	end generate;
	Q <= b;
end architecture;
