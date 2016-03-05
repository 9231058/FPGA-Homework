--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   04-03-2016
-- Module Name:   p4-1.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity four_bit_comparator is
	port (a, b : in std_logic_vector(3 downto 0);
		l, g, e : in std_logic;
		eq, gt, lt : out std_logic);
end entity four_bit_comparator;

architecture structural of four_bit_comparator is
	signal a0_b0_eq, a0_b0_gt, a0_b0_lt : std_logic;
	signal a1_b1_eq, a1_b1_gt, a1_b1_lt : std_logic;
	signal a2_b2_eq, a2_b2_gt, a2_b2_lt : std_logic;
	signal a3_b3_eq, a3_b3_gt, a3_b3_lt : std_logic;
begin
	a0_b0_gt <= a(0) and (not b(0));
	a0_b0_lt <= (not a(0)) and b(0);
	a0_b0_eq <= a(0) xor b(0);

	a1_b1_gt <= a(1) and (not b(1));
	a1_b1_lt <= (not a(1)) and b(1);
	a1_b1_eq <= a(1) xor b(1);

	a2_b2_gt <= a(2) and (not b(2));
	a2_b2_lt <= (not a(2)) and b(2);
	a2_b2_eq <= a(2) xor b(2);

	a3_b3_gt <= a(3) and (not b(3));
	a3_b3_lt <= (not a(3)) and b(3);
	a3_b3_eq <= a(3) xor b(3);

	eq <= a3_b3_eq and a2_b2_eq and a1_b1_eq and a0_b0_eq;
	gt <= a3_b3_gt or (a2_b2_gt and a3_b3_eq) or (a1_b1_gt and a2_b2_eq and a3_b3_eq)
	      or (a0_b0_gt and a1_b1_eq and a2_b2_eq and a3_b3_eq);
	lt <= a3_b3_lt or (a2_b2_lt and a3_b3_eq) or (a1_b1_lt and a2_b2_eq and a3_b3_eq)
	      or (a0_b0_lt and a1_b1_eq and a2_b2_eq and a3_b3_eq);
end architecture structural;
