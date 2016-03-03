--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   03-03-2016
-- Module Name:   p4-4.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity carry_look_ahead_adder is
	generic (N : natural := 4);
	port (a, b : in std_logic_vector(N - 1 downto 0);
		s : out std_logic_vector(N - 1 downto 0);
		cin : in std_logic;
		cout : out std_logic);
end entity carry_look_ahead_adder;

architecture structural of carry_look_ahead_adder is
	signal P, G : std_logic_vector(N - 1 downto 0);
	signal C : std_logic_vector(N downto 0);
begin
	C(0) <= cin;
	cout <= C(N);

	carry: for I in 1 to N generate
		C(I) <= G(I - 1) or (P(I - 1) and C(I - 1));
	end generate carry;

	p_and_g: for I in 0 to N - 1 generate
		P(I) <= a(I) xor b(I);
		G(I) <= a(I) and b(I);
	end generate p_and_g;
	
	sum: for I in 0 to N - 1 generate
		s(I) <= a(I) xor b(I) xor C(I);
	end generate sum;
end architecture structural;
