--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   06-05-2016
-- Module Name:   p4-1.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity logic1 is
	port (A, B, C : in std_logic;
		F : out std_logic);
end logic1;

architecture behavioral of logic1 is
begin
	process(A,B,C) begin
		if A = '1' then
			F<= '1';
		elsif B = '1' and C = '1' then
			F <= '0';
		-- providing else clause in order to
		-- preventing from transparent latch
		-- creation.
		else
			F <= 'X';
		end if;
	end process;
end behavioral;

