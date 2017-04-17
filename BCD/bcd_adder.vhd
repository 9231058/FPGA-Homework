library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_adder is
	port (a, b: in std_logic_vector (3 downto 0);
		v: out std_logic_vector (7 downto 0));
end entity;

architecture structeral of bcd_adder is
	component fulladder is
		port(a, b, c_in : in std_logic;
			sum, c_out : out std_logic);
	end component fulladder;

	signal c : std_logic_vector (4 downto 0);
	signal sum : std_logic_vector (7 downto 0);
begin
	c(0) <= '0';
	sum(4) <= c(4);
	F: for I in 0 to 3 generate
		fs: fulladder port map(a(I), b(I), c(I), sum(I), c(I + 1));
	end generate F;
	v <= sum;
end architecture;
