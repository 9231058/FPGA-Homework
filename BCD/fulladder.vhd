library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder is
	port(a, b, c_in : in std_logic;
		sum, c_out : out std_logic);
end entity fulladder;

architecture structeral of fulladder is
begin
	sum <= a xor b xor c_in;
	c_out <= (a and b) or (a and c_in) or (b and c_in);
end architecture;
