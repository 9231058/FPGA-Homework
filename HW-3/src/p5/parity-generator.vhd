--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   25-04-2016
-- Module Name:   parity-generator.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity parity_generator is
	port (w, clk, reset : in std_logic;
		p : out std_logic);
end entity parity_generator;

architecture rtl of parity_generator is
	type state is (even, odd);
	signal current_state, next_state : state;
begin
	process (clk)
	begin
		if clk'event and clk = '1' then
			if reset = '1' then
				current_state <= even;
			else
				current_state <= next_state;
			end if;
		end if;
	end process;

	process (current_state, w)
	begin
		if current_state = even then
			if w = '1' then
				next_state <= odd;
			else
				next_state <= even;
			end if;
		else
			if w = '1' then
				next_state <= even;
			else
				next_state <= odd;
			end if;
		end if;
	end process;

	process (current_state)
	begin
		if current_state = even then
			p <= '0';
		else
			p <= '1';
		end if;
	end process;
end architecture rtl;
