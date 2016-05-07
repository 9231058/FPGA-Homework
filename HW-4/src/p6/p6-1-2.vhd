--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   07-05-2016
-- Module Name:   p6-1-2.vhd
--------------------------------------------------------------------------------

process (clk)
	variable sum : integer;
begin
	q <= sum;
	sum := a + b;
end process;
