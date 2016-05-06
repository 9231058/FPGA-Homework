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
		coin_return_100 : out std_logic_vector(7 downto 0));
end entity;

architecture rtl of vending_machine is
	signal coin_in_total : std_logic_vector(7 downto 0);
begin
	process (coin_in)
	begin
		if coin_in = '1' then
			coin_return <= '0';
			if coin_in_1 = '1' and coin_in_10 = '0' and coin_in_100 = '0' then
				coin_in_total = coin_in_total + "00000001";
			elsif coin_in_1 = '0' and coin_in_10 = '1' and coin_in_100 = '0' then
				coin_in_total = coin_in_total + "00001010";
			elsif coin_in_1 = '0' and coin_in_10 = '0' and coin_in_100 = '1' then
				coin_in_total = coin_in_total + "01100100";
			end if;
		end if;
	end process;
	process (buy_in)
		variable coin_return_total : std_logic_vector(7 downto 0);
		variable coin_return_100_var : std_logic_vector(7 downto 0);
		variable coin_return_10_var : std_logic_vector(7 downto 0);
		variable coin_return_1_var : std_logic_vector(7 downto 0);
	begin
		if buy_in = '1' then
			coin_return_total := coin_in_total - price;
			coin_return_100_var := "00000000";
			coin_return_10_var := "00000000";
			coin_return_1_var := "00000000";
			while coin_return_total > "01100100" loop
				coin_return_total := coin_return_total - "01100100";
				coin_return_100_var := coin_return_100_var + "00000001";
			end loop;
			while coin_return_total > "00001010" loop
				coin_return_total := coin_return_total - "00001010";
				coin_return_10_var := coin_return_10_var + "00000001";
			end loop;
			while coin_return_total > "00000001" loop
				coin_return_total := coin_return_total - "00000001";
				coin_return_1_var := coin_return_1_var + "00000001";
			end loop;
			coin_return <= '1';
			coin_return_1 <= coin_return_1_var;
			coin_return_10 <= coin_return_10_var;
			coin_return_100 <= coin_return_100_var;
		end if;
	end process;
end architecture;
