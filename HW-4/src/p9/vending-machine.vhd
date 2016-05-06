--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   05-05-2016
-- Module Name:   vending-machine.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity vending_machine is
	port(coin_in : in std_logic;
		coin_in_1 : in std_logic;
		coin_in_10 : in std_logic;
		coin_in_100 : in std_logic;
		buy_in : in std_logic;
		price : in std_logic_vector(7 downto 0);
		coin_return : out std_logic;
		coin_return_1 : out std_logic_vector(7 downto 0);
		coin_return_10 : out std_logic_vector(7 downto 0);
		coin_return_100 : out std_logic_vector(7 downto 0);
		clk : in std_logic);
end entity;

architecture rtl of vending_machine is
	type state is (COIN_IN, COIN_RETURN_100, COIN_RETURN_10, COIN_RETURN_1);

	signal coin_in_total : std_logic_vector(7 downto 0);
	signal current_state, next_state : state;
begin
	process (clk)
	begin
		if clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;
	process (coin_in, buy_in, current_state)
		variable coin_return_total : std_logic_vector(7 downto 0);
		variable coin_return_100_var : std_logic_vector(7 downto 0);
		variable coin_return_10_var : std_logic_vector(7 downto 0);
		variable coin_return_1_var : std_logic_vector(7 downto 0);
	begin
		case current_state is
			when COIN_IN =>
				if coin_in = '1' then
					coin_return <= '0';
					next_state <= COIN_IN;
					if coin_in_1 = '1' and coin_in_10 = '0' and coin_in_100 = '0' then
						coin_in_total <= coin_in_total + "00000001";
					elsif coin_in_1 = '0' and coin_in_10 = '1' and coin_in_100 = '0' then
						coin_in_total <= coin_in_total + "00001010";
					elsif coin_in_1 = '0' and coin_in_10 = '0' and coin_in_100 = '1' then
						coin_in_total <= coin_in_total + "01100100";
					end if;
				end if;
				if buy_in = '1' then
					coin_return_total := coin_in_total - price;
					coin_return_100_var := "00000000";
					coin_return_10_var := "00000000";
					coin_return_1_var := "00000000";
					next_state <= COIN_RETURN_100;
				end if;
			when COIN_RETURN_100 =>
				if coin_return_total >= "01100100" then
					coin_return_total := coin_return_total - "01100100";
					coin_return_100_var := coin_return_100_var + "00000001";
					next_state <= COIN_RETURN_100;
				else
					next_state <= COIN_RETURN_10;
				end if;
			when COIN_RETURN_10 =>
				if coin_return_total >= "00001010" then
					coin_return_total := coin_return_total - "00001010";
					coin_return_10_var := coin_return_10_var + "00000001";
					next_state <= COIN_RETURN_10;
				else
					next_state <= COIN_RETURN_1;
				end if;
			when COIN_RETURN_1 =>
				if coin_return_total >= "00000001" then
					coin_return_total := coin_return_total - "00000001";
					coin_return_1_var := coin_return_1_var + "00000001";
					next_state <= COIN_RETURN_1;
				else
					next_state <= COIN_IN;
					coin_return <= '1';
					coin_return_1 <= coin_return_1_var;
					coin_return_10 <= coin_return_10_var;
					coin_return_100 <= coin_return_100_var;
				end if;
		end case;
	end process;
end architecture;
