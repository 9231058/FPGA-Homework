--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   07-05-2016
-- Module Name:   p6-1-1.vhd
--------------------------------------------------------------------------------

process (clk)
	variable sum : integer;
begin
	sum := a + b;
	q <= sum;
end process;
