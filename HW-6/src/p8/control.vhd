--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   30-05-2016
-- Module Name:   control.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity control is
	port (ent, ext : out std_logic;
		a, b : in std_logic;
		clk : in std_logic);
end entity;

architecture mem of control is
	type state is array (natural range <>) of std_logic_vector (3 downto 0);
	
	signal next_state, current_state : std_logic_vector (1 downto 0);
	signal tt : state (15 downto 0) := (
		8 => "0001",
		12 => "0001",
		0 => "0000",
		4 => "0000",
		5 => "1010",
		13 => "1010",
		1 => "0001",
		9 => "0001",
		2 => "0011",
		6 => "0011",
		10 => "0010",
		14 => "0010",
		3 => "0100",
		11 => "0100",
		7 => "0011",
		15 => "0011"
	);
begin
	process (clk)
	begin
		if clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;
	process (current_state, a, b)
		variable addr : std_logic_vector (3 downto 0);
	begin
		addr := a & b & current_state;

		ent <= tt(to_integer(unsigned(addr)))(3);
		ext <= tt(to_integer(unsigned(addr)))(2);
		next_state <= tt(to_integer(unsigned(addr)))(1 downto 0);
	end process;
end architecture;

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
