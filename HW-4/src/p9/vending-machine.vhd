--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   05-05-2016
-- Module Name:   vending-machine.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

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
