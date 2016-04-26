--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   26-04-2016
-- Module Name:   p11-in.vhd
--------------------------------------------------------------------------------
library iEEE;
use IEEE.std_logic_1164.all;

entity p11_in is
end entity;

architecture rtl of p11_in is
	entity sevsegv is
		port (d0, d1, d2, d3 : in vlbit;
			a, b, c, d, e, f, g : out vlbit);
	end component;

	for sv1, sv2:sevsegv use entity work.sevsegv(behave1);
	for sv3, sv4:sevsegv use entity work.sevsegv(behave2);
begin
	sv1:sevsegv port map ();
	sv2:sevsegv port map ();
	sv3:sevsegv port map ();
	sv4:sevsegv port map ();
end architecture;
