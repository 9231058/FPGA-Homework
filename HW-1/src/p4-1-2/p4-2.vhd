--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   04-03-2016
-- Module Name:   p4-2.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity sixteen_bit_comparator is
	port (a, b : in std_logic_vector(15 downto 0);
		l, g, e : in std_logic;
		eq, gt, lt : out std_logic);
end entity sixteen_bit_comparator;

architecture structural of sixteen_bit_comparator is
	signal a0_b0_eq, a0_b0_gt, a0_b0_lt : std_logic;
	signal a1_b1_eq, a1_b1_gt, a1_b1_lt : std_logic;
	signal a2_b2_eq, a2_b2_gt, a2_b2_lt : std_logic;
	signal a3_b3_eq, a3_b3_gt, a3_b3_lt : std_logic;

	entity four_bit_comparator is
		port (a, b : in std_logic_vector(3 downto 0);
			l, g, e : in std_logic;
			eq, gt, lt : out std_logic);
	end entity four_bit_comparator;


	for all:four_bit_comparator use entity work.four_bit_comparator;
begin
	c0: four_bit_comparator port map (a(3 downto 0), b(3 downto 0), open, open, open,
		a0_b0_eq, a0_b0_gt, a0_b0_lt);

	c1: four_bit_comparator port map (a(7 downto 4), b(7 downto 4), open, open, open,
		a1_b1_eq, a1_b1_gt, a1_b1_lt);

	c2: four_bit_comparator port map (a(11 downto 8), b(11 downto 8), open, open, open,
		a2_b2_eq, a2_b2_gt, a2_b2_lt);

	c3: four_bit_comparator port map (a(15 downto 12), b(15 downto 12), open, open, open,
		a3_b3_eq, a3_b3_gt, a3_b3_lt);

	eq <= a3_b3_eq and a2_b2_eq and a1_b1_eq and a0_b0_eq;
	gt <= a3_b3_gt or (a2_b2_gt and a3_b3_eq) or (a1_b1_gt and a2_b2_eq and a3_b3_eq)
	      or (a0_b0_gt and a1_b1_eq and a2_b2_eq and a3_b3_eq);
	lt <= a3_b3_lt or (a2_b2_lt and a3_b3_eq) or (a1_b1_lt and a2_b2_eq and a3_b3_eq)
	      or (a0_b0_lt and a1_b1_eq and a2_b2_eq and a3_b3_eq);
end architecture structural;
