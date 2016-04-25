--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   25-04-2016
-- Module Name:   p9.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity robot is
	port (key1, key2, key3, clk : in std_logic);
end entity;

architecture rtl of robot is
	type state is (stop, move_forward_slowly, move_forward_fast,
		move_backward_fast, move_backward_slowly, turn_right,
		turn_left);
	signal current_state, next_state : state;
	signal command : std_logic_vector (2 downto 0);
begin
	command <= key1 & key2 & key3;
	process (command)
	begin
		case command is
			when "000" => next_state <= stop;
			when "001" => next_state <= move_forward_slowly;
			when "010" => next_state <= move_forward_fast;
			when "011" => next_state <= move_backward_slowly;
			when "100" => next_state <= move_backward_fast;
			when "101" => next_state <= turn_right;
			when "110" => next_state <= turn_left;
			when "111" => next_state <= current_state;
			when others => next_state <= stop;
		end case;
	end process;
	process (clk)
	begin
		if clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;
end architecture;
