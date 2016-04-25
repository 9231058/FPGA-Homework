--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   26-04-2016
-- Module Name:   p12.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity drawstring is
	port (p1, p2 : in std_logic;
		clk, reset : in std_logic;
		led : out std_logic_vector (9 downto 1));
end entity;

architecture rtl of drawstring is
	type state is (led1, led2, led3, led4, led5, led6, led7, led8, led9);
	signal current_state, next_state : state := led5;
begin
	process (clk, reset)
	begin
		if reset = '1' then
			current_state <= led5;
		elsif clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;

	process (current_state, p1, p2)
	begin
		case current_state is
			when led1 =>
				if p1'event and p1 = '1' then
					next_state <= led2;
				elsif p2'event and p2 = '1' then
					next_state <= led1;
				end if;
			when led2 =>
				if p1'event and p1 = '1' then
					next_state <= led3;
				elsif p2'event and p2 = '1' then
					next_state <= led1;
				end if;
			when led3 =>
				if p1'event and p1 = '1' then
					next_state <= led4;
				elsif p2'event and p2 = '1' then
					next_state <= led2;
				end if;
			when led4 =>
				if p1'event and p1 = '1' then
					next_state <= led5;
				elsif p2'event and p2 = '1' then
					next_state <= led3;
				end if;
			when led5 =>
				if p1'event and p1 = '1' then
					next_state <= led6;
				elsif p2'event and p2 = '1' then
					next_state <= led4;
				end if;
			when led6 =>
				if p1'event and p1 = '1' then
					next_state <= led7;
				elsif p2'event and p2 = '1' then
					next_state <= led5;
				end if;
			when led7 =>
				if p1'event and p1 = '1' then
					next_state <= led8;
				elsif p2'event and p2 = '1' then
					next_state <= led6;
				end if;
			when led8 =>
				if p1'event and p1 = '1' then
					next_state <= led9;
				elsif p2'event and p2 = '1' then
					next_state <= led7;
				end if;
			when led9 =>
				if p1'event and p1 = '1' then
					next_state <= led9;
				elsif p2'event and p2 = '1' then
					next_state <= led8;
				end if;
		end case;
	end process;

	process (current_state)
	begin
		case current_state is
			when led1 => led <= (1 => '1', others => '0');
			when led2 => led <= (2 => '1', others => '0');
			when led3 => led <= (3 => '1', others => '0');
			when led4 => led <= (4 => '1', others => '0');
			when led5 => led <= (5 => '1', others => '0');
			when led6 => led <= (6 => '1', others => '0');
			when led7 => led <= (7 => '1', others => '0');
			when led8 => led <= (8 => '1', others => '0');
			when led9 => led <= (9 => '1', others => '0');
		end case;
	end process;
end architecture;
