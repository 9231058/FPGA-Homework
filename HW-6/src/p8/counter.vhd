--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   30-05-2016
-- Module Name:   counter.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter is
	generic (N : integer := 4);
	port (inc, dec : in std_logic;
		output : out std_logic_vector (N - 1 downto 0);
		clk : in std_logic);
end entity;

architecture rtl of counter is
	signal count : std_logic_vector (N - 1 downto 0) := (others => '0');
begin
	output <= count;
	process (clk)
	begin
		if clk'event and clk = '1' then
			if inc = '1' then
				count <= count + (0 => '1');
			elsif dec = '1' then
				count <= count - (0 => '1');
			end if;
		end if;
	end process;
end architecture;
