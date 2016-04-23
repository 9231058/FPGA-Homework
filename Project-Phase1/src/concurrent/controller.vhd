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
		sel : out std_logic_vector(7 downto 0);
		memory_rwbar, memory_en : out std_logic);
end entity controller;

architecture rtl of controller is
	type state is (rst, fitness_process, memory_read, increase, memory_write);
	signal next_state, current_state : state;
begin
	-- next
	process (clk)
	begin
		if clk'event and clk = '1' then
			if reset = '1' then
				current_state <= rst;
			else
				current_state <= next_state;
			end if;
		end if;
	end process;
	-- outputs
	process (current_state)
		variable I : std_logic_vector(7 downto 0) := (0 => '1', others => '0');
	begin
		if current_state = rst then
			I := (0 => '1', others => '0');
			fitness_reset <= '1';
			fitness_clk <= '0';
			memory_en <= '0';
		elsif current_state = fitness_process then
			memory_en <= '0';
		elsif current_state = memory_read then
			sel <= I;
			memory_rwbar <= '1';
			fitness_clk <= '0';
		elsif current_state = memory_write then
			memory_rwbar <= '0';
			I := I + 1;
		end if;
	end process;
	-- next_state
	process (current_state, fitness_done)
		variable I : integer := 1;
	begin
		if current_state = rst then
			I := 1;
			next_state <= fitness_process;
		elsif current_state = fitness_process then
			next_state <= memory_read;
		elsif current_state = memory_read then
			next_state <= increase;
		elsif current_state = increase then
			next_state <= memory_write;
		elsif current_state = memory_write then
			I := I + 1;
			if I < 120 then
				next_state <= fitness_process;
			else
				next_state <= rst;
			end if;
		end if;
	end process;
end architecture rtl;
