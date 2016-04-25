--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   25-04-2016
-- Module Name:   p10.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity alu is
	port (a, b : in std_logic_vector (3 downto 0);
		alucode : in std_logic_vector (2 downto 0);
		result : out std_logic_vector (3 downto 0);
		z, o : out std_logic);
end entity;

architecture rtl of alu is
begin
	process (alucode, a, b)
		variable im : std_logic_vector (4 downto 0);
	begin
		case alucode is
			-- ADD
			when "000" =>
				im := ('0' & a) + ('0' & b);
				result <= im(3 downto 0);
				z <= im(4);
			-- SUB
			when "001" =>
				im := ('0' & a) - ('0' & b);
				result <= im(3 downto 0);
				z <= im(4);
			-- AND
			when "010" =>
				im(3 downto 0) := (a(0) and b(0)) & (a(1) and b(1)) & (a(2) and b(2)) & (a(3) and b(3));
				if im(3 downto 0) = "111" then
					z <= '1';
				else
					z <= '0';
				end if;
				result <= im(3 downto 0);
			-- CMP
			when "011" =>
				if a < b then
					result <= a;
					z <= '0';
				elsif a = b then
					result <= a;
					z <= '1';
				else
					result <= b;
					z <= '0';
				end if;
			-- RT
			when "100" =>
				result <= '0' & a(2 downto 0);
				z <= a(3);
			-- RR
			when "101" =>
				result <= a(3 downto 1) & '0';
				z <= a(0);
			-- Parity
			when "110" =>
				result <= a;
				z <= a(0) xor a(1) xor a(2) xor a(3);
			when others =>
				result <= (others => '0');
				z <= '0';
				o <= '0';
		end case;
	end process;
end architecture;
