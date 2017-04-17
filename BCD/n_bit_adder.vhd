library IEEE;
use IEEE.std_logic_1164.all;

entity n_bit_adder is
	generic(N: integer);
	port(
		    a: in std_logic_vector(N - 1 downto 0);
		    b: in std_logic_vector(N - 1 downto 0);
		    cin: in std_logic;
		    res: out std_logic_vector(N - 1 downto 0);
		    cout: out std_logic
	    );
end entity;

architecture struct of n_bit_adder is
	component full_adder
		port(
			    a: in std_logic;
			    b: in std_logic;
			    c_in: in std_logic;
			    ssum: out std_logic;
			    c_out: out std_logic
		    );
	end component;

	signal intermediate: std_logic_vector(N - 1 downto 0);

begin
	full_adder_1: full_adder port map(a(0), b(0), cin, res(0),
	intermediate(0));

	generate_adder: for i in 1 to N - 1 generate
		full_adder_i: full_adder port map (a(i), b(i), intermediate(i - 1),
		res(i), intermediate(i));
	end generate generate_adder;

	cout <= intermediate(N - 1);
end architecture;
