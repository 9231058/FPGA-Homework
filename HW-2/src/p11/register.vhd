--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   22-02-2016
-- Module Name:   register.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity d_register is
	port (d, clk : in std_logic;
		q : out std_logic);
end entity d_register;

architecture behavioral of d_register is
begin
	process (clk)
	begin
		if clk = '1' and clk'event then
			q <= d;
		end if;
	end process;
end architecture behavioral;
