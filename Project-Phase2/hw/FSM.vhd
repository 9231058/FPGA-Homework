--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   13-05-2016
-- Module Name:   FSM.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numberic_std.all;

entity FSM is
	port (start_state : in std_logic_vector(3 downto 0);
		end_state : out std_logic_vector(3 downto 0);
		str : in std_logic_vector(31 downto 0);
		enable, clk : in std_logic;
		done : out std_logic);
end entity;

architecture rtl of FSM is
	type state is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9);
	signal current_state, next_state : state;
	signal index : std_logic_vector(5 downto 0);
	signal str_buff : std_logic_vector(31 downto 0);
begin
	process(clk)
	begin
		if clk'event and clk = '1' then
			if enable = '1' then
				index <= "000000";
				str_buff <= str;
				case start_state is
					when "0000" => current_state <= S0;
					when "0001" => current_state <= S1;
					when "0010" => current_state <= S2;
					when "0011" => current_state <= S3;
					when "0100" => current_state <= S4;
					when "0101" => current_state <= S5;
					when "0110" => current_state <= S6;
					when "0111" => current_state <= S7;
					when "1000" => current_state <= S8;
					when "1001" => current_state <= S9;
					when others => current_state <= S0;
				end case;
			else
				current_state <= next_state;
			end if;
		end if;
	end process;

	process(current_state)
	begin
		if index = "100000" then
			done <= '1';
		else
		case current_state is
			when S0 => end_state <= "0000";
			when S1 => end_state <= "0001";
			when S2 => end_state <= "0010";
			when S3 => end_state <= "0011";
			when S4 => end_state <= "0100";
			when S5 => end_state <= "0101";
			when S6 => end_state <= "0110";
			when S7 => end_state <= "0111";
			when S8 => end_state <= "1000";
			when S9 => end_state <= "1001";
			when others => end_state <= "0000";
	end process;

	process(current_state)
	begin
		if index = "100000" then
			next_state <= current_state;
		else
			case current_state is
				when S0 =>
					if str(to_integer(index)) = '1' then
						next_state <= S5;
					else
						next_state <= S1;
					end if;
				when S1 =>
					if str(to_integer(index)) = '1' then
						next_state <= S2;
					else
						next_state <= S7;
					end if;
				when S2 =>
					if str(to_integer(index)) = '1' then
						next_state <= S8;
					else
						next_state <= S3;
					end if;
				when S3 =>
					if str(to_integer(index)) = '1' then
						next_state <= S0;
					else
						next_state <= S7;
					end if;
				when S4 =>
					if str(to_integer(index)) = '1' then
						next_state <= S4;
					else
						next_state <= S9;
					end if;
				when S5 =>
					if str(to_integer(index)) = '1' then
						next_state <= S0;
					else
						next_state <= S6;
					end if;
				when S6 =>
					if str(to_integer(index)) = '1' then
						next_state <= S1;
					else
						next_state <= S7;
					end if;
				when S7 =>
					if str(to_integer(index)) = '1' then
						next_state <= S9;
					else
						next_state <= S2;
					end if;
				when S8 =>
					if str(to_integer(index)) = '1' then
						next_state <= S4;
					else
						next_state <= S3;
					end if;
				when S9 =>
					if str(to_integer(index)) = '1' then
						next_state <= S3;
					else
						next_state <= S8;
					end if;
				when others =>
					next_state <= S0;
			end case;
			index <= index + "000001";
	end process;
end architecture;
