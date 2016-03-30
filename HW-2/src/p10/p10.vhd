--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   29-03-2016
-- Module Name:   p10.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity squart is
	generic (N : integer := 8);
	port (clk : in std_logic;
		data_in : in std_logic_vector (N - 1 downto 0);
		data_out : out std_logic_vector (N - 1 downto 0));
end squart;

architecture rtl of squart is
	signal result : std_logic_vector (N - 1 downto 0);
	signal mask : std_logic_vector (N - 1 downto 0);
begin
	process (clk, data_in)
		variable data_buff : std_logic_vector (N - 1 downto 0);
	begin
		if data_in'event then
			data_buff := data_in;
			mask <= ((N - 2) => '1', others => '0');
			result <= (others => '0');
		elsif clk'event and clk = '1' then
			if mask > data_in then
				mask <= std_logic_vector(shift_right(unsigned(mask), 2));
			elsif unsigned(mask) /= 0 then
				if data_buff >= result + mask then
					data_buff := data_buff - (result + mask);
					result <= std_logic_vector(shift_right(unsigned(result), 1)) + mask;
				else
					result <= std_logic_vector(shift_right(unsigned(result), 1));
				end if;
				mask <= std_logic_vector(shift_right(unsigned(mask), 2));
			else
				data_out <= result;
			end if;
		end if;
	end process;
end architecture rtl;
