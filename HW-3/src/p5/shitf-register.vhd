--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   25-04-2016
-- Module Name:   shitf-register.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity shift_register is
	generic (N : integer := 8);
	port (data_in : in std_logic_vector (N - 1 downto 0);
		load, clk : in std_logic;
		data_out : out std_logic);
end entity shitf_register;

architecture rtl of shift_register is
	signal reg : std_logic_vector (N - 1 downto 0);
begin
	process (clk)
		variable I : integer;
	begin
		if clk'event and clk = '1' then
			if load = '1' then
				reg <= data_in;
				I := 0;
			else
				data_out <= reg(I);
				I := I + 1;
			end if;
		end if;
	end process;
end architecture rtl;
