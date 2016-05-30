--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   30-05-2016
-- Module Name:   p6-2.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;


entity adder_1_mux is
	port (a, b, c : in std_logic;
		sel : in std_logic;
		o : out std_logic);
end entity;

architecture rtl of addr_1_mux is
	signal t : std_logic;
begin
	t <= a when sel = '0' else b;
	o <= c + t;
end architecture;
