--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   28-03-2016
-- Module Name:   p9.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter is
	generic (N : integer := 4);
	port (clk, reset : in std_logic;
		count : out std_logic_vector (N - 1 downto 0));
end entity;

architecture behavioral of counter is
begin
	process (clk, reset)
		variable count_buff : std_logic_vector (N - 1 downto 0) := (others => '0');
	begin
		if clk'event and clk = '1' then
			count_buff := count_buff + '1';
			count <= count_buff;
		end if;
		if reset = '1' then
			count_buff := (others => '0');
			count <= count_buff;
		end if;
	end process;
end architecture behavioral;
