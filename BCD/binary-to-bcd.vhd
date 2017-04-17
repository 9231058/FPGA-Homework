library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity binary_to_bcd is
	port(
		    binary: in std_logic_vector(7 downto 0);
		    bcd: out std_logic_vector(7 downto 0)
	    );
end entity;

architecture struct of binary_to_bcd is
	component n_bit_adder
		generic(N: integer);
		port(
			    a: in std_logic_vector(N - 1 downto 0);
			    b: in std_logic_vector(N - 1 downto 0);
			    cin: in std_logic;
			    res: out std_logic_vector(N - 1 downto 0);
			    cout: out std_logic
		    );
	end component;

	signal binary_s_1: std_logic_vector(7 downto 0);
	signal binary_s_2: std_logic_vector(7 downto 0);
	signal binary_s_3: std_logic_vector(7 downto 0);
	signal binary_s_4: std_logic_vector(7 downto 0);
	signal binary_s_5: std_logic_vector(7 downto 0);
	signal binary_s_6: std_logic_vector(7 downto 0);
	signal binary_s_7: std_logic_vector(7 downto 0);
	signal binary_s_8: std_logic_vector(7 downto 0);
	signal binary_s_9: std_logic_vector(7 downto 0);

	signal fully_fake_signal: std_logic_vector(8 downto 0);

begin
	subtractor_1: n_bit_adder generic map(8)
	port map(binary, "00000101", '1', binary_s_1, fully_fake_signal(0));

	subtractor_2: n_bit_adder generic map(8)
	port map(binary_s_1, "00000101", '1', binary_s_2, fully_fake_signal(1));

	subtractor_3: n_bit_adder generic map(8)
	port map(binary_s_2, "00000101", '1', binary_s_3, fully_fake_signal(2));

	subtractor_4: n_bit_adder generic map(8)
	port map(binary_s_3, "00000101", '1', binary_s_4, fully_fake_signal(3));

	subtractor_5: n_bit_adder generic map(8)
	port map(binary_s_4, "00000101", '1', binary_s_5, fully_fake_signal(4));

	subtractor_6: n_bit_adder generic map(8)
	port map(binary_s_5, "00000101", '1', binary_s_6, fully_fake_signal(5));

	subtractor_7: n_bit_adder generic map(8)
	port map(binary_s_6, "00000101", '1', binary_s_7, fully_fake_signal(6));

	subtractor_8: n_bit_adder generic map(8)
	port map(binary_s_7, "00000101", '1', binary_s_8, fully_fake_signal(7));

	subtractor_9: n_bit_adder generic map(8)
	port map(binary_s_8, "00000101", '1', binary_s_9, fully_fake_signal(8));

	bcd <= binary when to_integer(unsigned(binary)) < 10 else
	       binary_s_1 when to_integer(unsigned(binary)) < 20 else
	       binary_s_2 when to_integer(unsigned(binary)) < 30 else
	       binary_s_3 when to_integer(unsigned(binary)) < 40 else
	       binary_s_4 when to_integer(unsigned(binary)) < 50 else
	       binary_s_5 when to_integer(unsigned(binary)) < 60 else
	       binary_s_6 when to_integer(unsigned(binary)) < 70 else
	       binary_s_7 when to_integer(unsigned(binary)) < 80 else
	       binary_s_8 when to_integer(unsigned(binary)) < 90 else
	       binary_s_9 when to_integer(unsigned(binary)) < 100 else
	       "XXXXXXXX";

end struct;
