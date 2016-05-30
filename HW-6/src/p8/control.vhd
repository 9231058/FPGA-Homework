--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   30-05-2016
-- Module Name:   control.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity control is
	port (ent, ext : out std_logic;
		a, b : in std_logic;
		clk : in std_logic);
end entity;

architecture rtl of control is
	type state is (S0, S1, S2, S3);
	signal current_state, next_state : state;
begin
	process (clk)
	begin
		if clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;
	process (current_state, a, b)
	begin
		case current_state is
			when S0 =>
				if a = '1' then
					next_state <= S1;
				end if;
				ent <= '0';
				ext <= '0';
			when S1 =>
				if b = '1' then
					next_state <= S2;
					ent <= '1';
					ext <= '0';
				end if;
			when S2 =>
				if a = '0' then
					next_state <= S3;
				end if;
				ent <= '0';
				ext <= '0';
			when S3 =>
				if b = '0' then
					next_state <= S0;
					ent <= '0';
					ext <= '1';
				end if;
			when others =>
				next_state <= S0;
				ent <= '0';
				ext <= '0';
		end case;
	end process;
end architecture;
