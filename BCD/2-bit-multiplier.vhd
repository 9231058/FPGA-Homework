library IEEE;
use IEEE.std_logic_1164.all;

entity two_bit_multiplier is
	port (a, b : in std_logic_vector (1 downto 0);
	      	m : out std_logic_vector (3 downto 0));
end entity;

architecture structeral of two_bit_multiplier is
	component halfadder is
		port (a, b : in std_logic;
			s : out std_logic;
			c : out std_logic);
	end component;
	signal t: std_logic_vector (3 downto 0);
begin
    m(0) <= a(0) and b(0);
    t(0) <= a(0) and b(1);
    t(1) <= a(1) and b(0);
    t(2) <= a(1) and b(1);

    ha1: halfadder port map (t(0), t(1), m(1), t(3));
    ha2: halfadder port map (t(3), t(2), m(2), m(3));
end architecture;
