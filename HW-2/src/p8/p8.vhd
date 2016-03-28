--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   28-03-2016
-- Module Name:   p8.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_signed.all;

entity thermostat_ctrl is
	port (temp_needed, temp_sense : in integer;
		command : out boolean);
end entity thermostat_ctrl;

architecture rtl of thermostat_ctrl is
	signal temp_diff : integer;
begin
	temp_diff <= temp_sense - temp_needed;
	command <= false when temp_diff >= 2 else
		   true when temp_diff <= -2;
end architecture rtl;

architecture behavioral of thermostat_ctrl is
begin
	process (temp_needed, temp_sense)
	begin
		if temp_sense - temp_needed >= 2 then
			command <= false;
		elsif temp_needed - temp_sense >= 2 then
			command <= true;
		end if;
	end process;
end architecture behavioral;
