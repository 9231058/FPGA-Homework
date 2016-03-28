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
		w_s : in std_logic := '1';
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
	signal Q : std_logic_vector (N downto 0);
	signal D : std_logic_vector (N downto 1);
begin
	Q(0) <= serial_in;
	serial_out <= Q(N);
	registers: for I in 1 to N generate
		D(I) <= Q(I - 1) when w_s = '1' else parallel_in(I - 1);
		ds : d_register port map (D(I), clk, Q(I));
		parallel_out(I - 1) <= Q(I);
	end generate registers;
end architecture rtl;
