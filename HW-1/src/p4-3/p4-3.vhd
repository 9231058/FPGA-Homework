--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   03-03-2016
-- Module Name:   p4-3.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity decoder_2_4 is
	port (i0, i1 : in std_logic;
		o0, o1, o2, o3 : out std_logic);
end entity decoder_2_4;

architecture structural of decoder_2_4 is
begin
	out0 <= (not i0) and (not i1);
	out1 <= i0 and (not i1);
	out2 <= (not i0) and i1;
	out3 <= i0 and i1;
end architecture structural;
