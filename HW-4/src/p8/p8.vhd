--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   05-05-2016
-- Module Name:   p8.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity p8 is
	port (clk, reset_a, reset_s : in std_logic;
		d : in std_logic;
		q : out std_logic);
end entity p8;

architecture rtl of p8 is
begin
	-- the process sensitivity list must contain
	-- clock and asynchronous signals
	process (clk, reset_a)
	begin
		-- asynchronous reset, it must come
		-- before clock
		if reset_a = 1 then
			q <= '0';
		elsif clk'event and clk = '1' then
			-- synchronous reset
			if reset_s = '0' then
				q <= '0';
			else
				q <= d;
			end if;
		end if;
	end
end architecture;
