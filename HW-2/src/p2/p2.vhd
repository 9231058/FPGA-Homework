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
	     clk_2, clk_5 : out std_logic);
end entity;

architecture BEHAVIORAL of clk_dvdr is
	signal clk_2_tmp : std_logic := '0';
	signal clk_5_tmp : std_logic := '0';
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
				clk_2_tmp <= not clk_2_tmp;
			end if;
		end if;
	end process;

	-- divide clock by 5:
	-- counter values: 0 ... 3; toggle: true;
	-- counter values: 0 ... 2; toggle: false;
	process (clk)
		variable clk_5_var : integer := 0;
		variable clk_5_toggle : boolean := false;
	begin
		if clk'event then
			clk_5_var := clk_5_var + 1;
			if clk_5_var = 3 and clk_5_toggle then
				clk_5_var := 0;
				clk_5_tmp <= not clk_5_tmp;
				clk_5_toggle := not clk_5_toggle;
			elsif clk_5_var = 2 and not clk_5_toggle then
				clk_5_var := 0;
				clk_5_tmp <= not clk_5_tmp;
				clk_5_toggle := not clk_5_toggle;
			end if;
		end if;
	end process;
			
	clk_2 <= clk_2_tmp;
	clk_5 <= clk_5_tmp;
end architecture BEHAVIORAL;
