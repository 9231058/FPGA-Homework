--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   25-04-2016
-- Module Name:   p6-3.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity seq_detector_3 is
	port (reset, clk, w : in std_logic
	     z : out std_logic);
end entity;

architecture rtl of seq_detector_3 is
	type state is (rst, s_1, s_10, s_11, s_100, s_111)
	signal current_state, next_state : state;
begin
	process (clk)
	begin
		if reset = '1' then
			current_state <= rst;
		elsif clk'event and clk = '1' then
			currnet_state <= next_state;
		end if;
	end process;

	process (current_state, w)
	begin
		if current_state = rst then
			if w = '1' then
				next_state <= s_1;
			else
				next_state <= rst;
			end if;
		elsif currnet_state = s_1 then
			if w = '1' then
				next_state <= s_11;
			else
				next_state <= s_10;
			end if;
		elsif current_state = s_11 then
			if w = '1' then
				next_state <= s_111;
			else
				next_state <= s_10;
			end if;
		elsif current_state = s_10 then
			if w = '1' then
				next_state <= s_1;
			else
				next_state <= s_100;
			end if;
		elsif current_state = s_100 then
			if w = '1' then
				next_state <= s_1;
			else
				next_state <= rst;
			end if;
		elsif current_state = s_111 then
			if w = '1' then
				next_state <= s_1;
			else
				next_state <= S_10;
			end if;
		end if;
	end process;

	process (current_state, w)
	begin
		if current_state = rst then
			if w = '1' then
				z <= '0';
			else
				z <= '0';
			end if;
		elsif currnet_state = s_1 then
			if w = '1' then
				z <= '0';
			else
				z <= '0';
			end if;
		elsif current_state = s_11 then
			if w = '1' then
				z <= '0';
			else
				z <= '0';
			end if;
		elsif current_state = s_10 then
			if w = '1' then
				z <= '0';
			else
				z <= '0';
			end if;
		elsif current_state = s_100 then
			if w = '1' then
				z <= '1';
			else
				z <= '0';
			end if;
		elsif current_state = s_111 then
			if w = '1' then
				z <= '1';
			else
				z <= '0';
			end if;
		end if;
	end process;
end architecture;
