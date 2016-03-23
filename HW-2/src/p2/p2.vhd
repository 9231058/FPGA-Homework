--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   23-03-2016
-- Module Name:   p2.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity clk_dvdr is
	port (clk : in std_logic;
	     clk_2, clk_5 : out std_logic := '0');
end entity;

architecture BEHAVIORAL of clk_dvdr is
begin
	-- divide clock by 2:
	-- counter values: 0 ... 1;
	process (clk)
		variable clk_2_var : integer := 0;
	begin
		if clk'event and clk = '1' then
			clk_2_var := clk_2_var + 1;
			if clk_2_var = 1 then
				clk_2_var := 0;
				clk_2 <= not clk_2;
			end if;
		end if;
	end process;
end architecture BEHAVIORAL;
