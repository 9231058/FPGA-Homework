library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_sixty_four_multiplier is
	port(
		    a: in std_logic_vector(31 downto 0);
		    b: in std_logic_vector(31 downto 0);
		    c: out std_logic_vector(63 downto 0)
	    );
end entity;

architecture struct of bcd_sixty_four_multiplier is
	component bcd_eight_multiplier is
		port (a: in std_logic_vector (31 downto 0);
			b: in std_logic_vector (3 downto 0);
			v: out std_logic_vector (35 downto 0));
	end component;

	component bcd_64_bit_adder is
		port(
			    a: in std_logic_vector(63 downto 0);
			    b: in std_logic_vector(63 downto 0);
			    res: out std_logic_vector(63 downto 0)
		    );
	end component;

	type multipication_result is array (7 downto 0) of std_logic_vector(63 downto 0);
	signal res: multipication_result := (others => (others => '0'));
	signal intermediate: multipication_result := (others => (others => '0'));
begin
	multiply_digit:
	for i in 0 to 7 generate
		digit_multiplier: bcd_eight_multiplier port map(a, b((i + 1) * 4 - 1 downto i * 4), res(i)((35 + i * 4) downto (0 + i * 4)));
	end generate multiply_digit;

	simple_adder: bcd_64_bit_adder port map(res(0), res(1), intermediate(0));

	add_digit:
	for i in 2 to 7 generate
		adder: bcd_64_bit_adder port map(res(i), intermediate(i - 2), intermediate(i - 1));
	end generate add_digit;

	c <= intermediate(6);
end architecture;
