--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   05-05-2016
-- Module Name:   d-flipflop.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity d_flipflop is
	port ( clk, reset, preset : in std_logic;
		d : in std_logic;
		q, qbar : out std_logic);
end entity d_flipflop;

architecture rtl of d_flipflop is
	signal b : std_logic;
begin
	process (clk)
	begin
		if clk = '1' and clk'event then
			if reset = '1' then
				b <= '0';
			elsif preset <= '1' then
				b <= '1';
			else
				b <= d;
			end if;
		end if;
	end process;
	q <= b;
	qbar <= not b;
end architecture;
