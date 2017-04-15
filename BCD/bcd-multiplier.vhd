library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_multiplier is
    port (a, b : in std_logic_vector (3 downto 0);
	  	v : out std_logic_vector (7 downto 0));
end entity;

architecture structeral of bcd_multiplier is
	component two_bit_multiplier is
		port (a, b : in std_logic_vector (1 downto 0);
		      	m : out std_logic_vector (3 downto 0));
	end component;
	
	component fulladder is
		port(a, b, c_in : in std_logic;
			sum, c_out : out std_logic);
	end component fulladder;

	component halfadder is
		port (a, b : in std_logic;
			s : out std_logic;
			c : out std_logic);
	end component;

	signal tmp : std_logic_vector (27 downto 0);
begin
    V(0) <= tmp(0);
    V(1) <= tmp(1);

    m0: two_bit_multiplier port map (A(1 downto 0), B(1 downto 0), tmp(3 downto 0));
    m1: two_bit_multiplier port map (A(3 downto 2), B(1 downto 0), tmp(7 downto 4));
    m2: two_bit_multiplier port map (A(1 downto 0), B(3 downto 2), tmp(11 downto 8));
    m3: two_bit_multiplier port map (A(3 downto 2), B(3 downto 2), tmp(15 downto 12));

    F0: fulladder port map(tmp(2), tmp(4), tmp(8), V(2), tmp(16));
    F1: fulladder port map(tmp(3), tmp(5), tmp(9), tmp(17), tmp(18));
    F2: fulladder port map(tmp(18), tmp(6), tmp(10), tmp(19), tmp(20));

    F3: fulladder port map(tmp(21), tmp(19), tmp(12), V(4), tmp(22));
    F4: fulladder port map(tmp(20), tmp(7), tmp(11), tmp(23), tmp(24));
    F5: fulladder port map(tmp(24), tmp(26), tmp(14), V(6), tmp(25));

    F6: fulladder port map(tmp(22), tmp(23), tmp(13), V(5), tmp(26));

    H0: halfadder port map(tmp(16), tmp(17), V(3), tmp(21));

    H1: halfadder port map(tmp(25), tmp(15), V(7), tmp(27));
end architecture;
