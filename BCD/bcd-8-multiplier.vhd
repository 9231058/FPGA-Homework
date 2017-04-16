library ieee;
use ieee.std_logic_1164.all;

entity bcd_eight_multiplier is
	port (a: in std_logic_vector (31 downto 0);
		b: in std_logic_vector (3 downto 0);
		v: out std_logic_vector (35 downto 0));
end entity;

architecture structeral of bcd_eight_multiplier is
	component bcd_multiplier is
		port (a, b : in std_logic_vector (3 downto 0);
			v : out std_logic_vector (7 downto 0));
	end component;

	component bcd_adder is
		port (a, b: in std_logic_vector (3 downto 0);
			v: out std_logic_vector (7 downto 0));
	end component;

	signal sum : std_logic_vector (31 downto 0);
	signal c : std_logic_vector (35 downto 0);
begin
	c (3 downto 0) <= "0000";
	v (35 downto 32) <= c (35 downto 32);

	M: for I in 0 to 7 generate
		ms: bcd_multiplier port map (a => a(I * 4 + 3 downto I * 4), b => b, v(7 downto 4) => c(I * 4 + 7 downto I * 4 + 4), v(3 downto 0) => sum(I * 4 + 3 downto I * 4));
		as: bcd_adder port map (sum(I * 4 + 3 downto I * 4), c(I * 4 + 3 downto I * 4), v(I * 4 + 3 downto I * 4));
	end generate M;
end architecture;
