--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   28-03-2016
-- Module Name:   p11.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity n_shift_register is
	generic (N : integer := 32);
	port (serial_in : in std_logic;
		w_s : in std_logic;
		clk : in std_logic;
		serial_out : out std_logic;
		parallel_in : in std_logic_vector (N - 1 downto 0);
		parallel_out : out std_logic_vector (N - 1 downto 0));
end entity n_shift_register;

architecture rtl of n_shift_register is
	component d_register is
		port (d, clk : in std_logic;
			q : out std_logic);
	end component;
	for all:d_register use entity work.d_register;
begin
end architecture rtl;
