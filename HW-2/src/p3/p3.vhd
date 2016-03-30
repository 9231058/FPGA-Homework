--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   30-03-2016
-- Module Name:   p2.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity eight_bin_to_bcd is
	port (data_in : in std_logic_vector (7 downto 0);
		clk : in std_logic;
		R0, R1, R2 : out std_logic_vector (3 downto 0));
end entity eight_bin_to_bcd;

architecture rtl of eight_bin_to_bcd is
	signal R_t0, R_t1, R_t2 : std_logic_vector (3 downto 0);
begin
	process (clk, data_in)
		variable data_buff : std_logic_vector (7 downto 0);
	begin
		if data_in'event then
			data_buff := data_in;
			R_t0 <= "0000";
			R_t1 <= "0000";
			R_t2 <= "0000";
		elsif clk'event and clk = '1' then
			if data_buff >= "01100100" then
				data_buff := data_buff - "01100100";
				R_t2 <= R_t2 + "0001";
			elsif data_buff >= "00001010" then
				data_buff := data_buff - "00001010";
				R_t1 <= R_t1 + "0001";
			elsif data_buff >= "00000001" then
				data_buff := data_buff - "00000001";
				R_t0 <= R_t0 + "0001";
			else
				R0 <= R_t0;
				R1 <= R_t1;
				R2 <= R_t2;
			end if;
		end if;
	end process;
end architecture rtl;
