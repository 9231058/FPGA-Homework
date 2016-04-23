--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   08-02-2016
-- Module Name:   fulladdr.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity fulladdr is
	port(a, b : in std_logic_vector(3 downto 0);
	     	c_in : in std_logic;
		c_out : out std_logic;
		sum : out std_logic_vector(3 downto 0));
end entity fulladdr;

architecture rtl of fulladdr is
	signal im : std_logic_vector(4 downto 0);
begin
	im <= ('0'&a) + ('0'&b) + c_in;
	sum <= im(3 downto 0);
	c_out <= im(4);
end architecture rtl;
