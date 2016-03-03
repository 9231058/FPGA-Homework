--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   03-03-2016
-- Module Name:   p5-2.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity p5_2 is
	port (a, b, c, d : in std_logic;
		f : out std_logic);
end entity;

architecture structural of p5_2 is
begin
	f <= (a and b) or ((b and c) and (not d)) or (c and (not a));
end architecture structural;
