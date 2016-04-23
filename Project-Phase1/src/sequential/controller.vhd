--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   23-04-2016
-- Module Name:   controller.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity controller is
	port (clk, reset : in std_logic;
		fitness_reset, fitness_clk : out std_logic;
		fitness_done : in std_logic;
		memory_rwbar, memory_en : out std_logic);
end entity controller;

architecture rtl of controller is
	type state is (reset, fitness_process, memory_read, memory_increase, memory_write);
	signal next_state, current_state : state;
begin
	-- next
	process (clk)
	begin
		if clk'event and clk = '1' then
			if reset = '1' then
				current_state = reset;
			else
				current_state = next_state;
			end if;
		end if;
	end process;
	-- outputs
	process (current_state)
	begin
		if current_state = reset then
			fitness_reset <= '1';
			fitness_clk = '0';
			memory_en = '0';
		elsif current_state = fitness_process then
			if fitness_done = '0' then
				fitness_clk = '1';
			end if;
			memory_en = '0';
		elsif current_state = memory_read then
			memory_rwbar = '1';
			fitness_clk = '0';
		elsif current_state = memory_write then
			memory_rwbar = '0';
		end if;
	end process;
	-- next_state
	process (current_state, fitness_done)
	begin
		if current_state = reset then
			next_state = fitness_process;
		elsif current_state = fitness_process then
			if fitness_done = '0' then
				next_state = memory_read;
			else
				next_state = reset;
			end if;
		elsif current_state = memory_read then
			next_state = increase;
		elsif current_state = increase then
			next_state = memory_write;
		elsif current_state = memory_write then
			next_state = fitness_process;
		end if;
	end process;
end architecture rtl;
