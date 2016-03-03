--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   03-03-2016
-- Module Name:   p3.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity test is
	port (clk1, clk2 : in std_logic;
		out1 : out std_logic_vector(7 downto 0));
end entity test;

architecture RTL of test is
	signal out2 : std_logic_vector(7 downto 0);
begin
	out1 <= out2;

	process (clk1)
	begin
		if clk1'event and clk1 = '1' then
			out2 <= "00000001";
		end if;
	end process;

	process (clk2)
	begin
		if clk2'event and clk2 = '1' then
			out2 <= "00000011";
		end if;
	end process;

end RTL;
