--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   26-04-2016
-- Module Name:   p8.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity p8 is
	port (i1, i2 : in std_logic;
		o : out std_logic;
		clk, reset : in std_logic);
end entity;

architecture sequential of p8 is
	type state is (s0, s1, s2, s3, s4, s5);
	signal current_state, next_state : state;

	attribute fsm_encoding : string;
	attribute fsm_encoding of current_state : signal is "sequential";
begin
	process (clk, reset)
	begin
		if reset = '1' then
			current_state <= s0;
		elsif clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;

	process (current_state, i1, i2)
	begin
		case current_state is
			when s0 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s0;
					o <= '0';
				elsif i1 = '1' and i2 = '1' then
					next_state <= s0;
					o <= '0';
				elsif i1 = '0' and i2 = '1' then
					next_state <= s2;
					o <= '0';
				elsif i1 = '1' and i2 = '0' then
					next_state <= s4;
					o <= '0';
				end if;
			when s1 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s1;
					o <= '1';
				elsif i1 = '1' and i2 = '1' then
					next_state <= s1;
					o <= '1';
				elsif i1 = '0' and i2 = '1' then
					next_state <= s3;
					o <= '1';
				elsif i1 = '1' and i2 = '0' then
					next_state <= s5;
					o <= '1';
				end if;
			when s2 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s0;
					o <= '0';
				elsif i1 = '1' and i2 = '1' then
					next_state <= s0;
					o <= '0';
				elsif i1 = '0' and i2 = '1' then
					next_state <= s2;
					o <= '0';
				elsif i1 = '1' and i2 = '0' then
					next_state <= s4;
					o <= '0';
				end if;
			when s3 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s1;
					o <= '1';
				elsif i1 = '1' and i2 = '1' then
					next_state <= s0;
					o <= '0';
				elsif i1 = '0' and i2 = '1' then
					next_state <= s3;
					o <= '1';
				elsif i1 = '1' and i2 = '0' then
					next_state <= s5;
					o <= '1';
				end if;
			when s4 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s0;
					o <= '0';
				elsif i1 = '1' and i2 = '1' then
					next_state <= s1;
					o <= '1';
				elsif i1 = '0' and i2 = '1' then
					next_state <= s3;
					o <= '1';
				elsif i1 = '1' and i2 = '0' then
					next_state <= s4;
					o <= '0';
				end if;
			when s5 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s1;
					o <= '1';
				elsif i1 = '1' and i2 = '1' then
					next_state <= s1;
					o <= '1';
				elsif i1 = '0' and i2 = '1' then
					next_state <= s2;
					o <= '0';
				elsif i1 = '1' and i2 = '0' then
					next_state <= s5;
					o <= '1';
				end if;
			when others =>
				next_state <= s0;
				o <= '0';
		end case;
	end process;
end architecture;

architecture medvedev of p8 is
	constant s0 : std_logic_vector (2 downto 0) := "000";
	constant s1 : std_logic_vector (2 downto 0) := "100";
	constant s2 : std_logic_vector (2 downto 0) := "001";
	constant s3 : std_logic_vector (2 downto 0) := "101";
	constant s4 : std_logic_vector (2 downto 0) := "010";
	constant s5 : std_logic_vector (2 downto 0) := "110";

	signal current_state, next_state : std_logic_vector (2 downto 0);
begin
	process (clk, reset)
	begin
		if reset = '1' then
			current_state <= s0;
		elsif clk'event and clk = '1' then
			current_state <= next_state;
		end if;
	end process;

	o <= current_state(2);

	process (current_state, i1, i2)
	begin
		case current_state is
			when s0 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s0;
				elsif i1 = '1' and i2 = '1' then
					next_state <= s0;
				elsif i1 = '0' and i2 = '1' then
					next_state <= s2;
				elsif i1 = '1' and i2 = '0' then
					next_state <= s4;
				end if;
			when s1 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s1;
				elsif i1 = '1' and i2 = '1' then
					next_state <= s1;
				elsif i1 = '0' and i2 = '1' then
					next_state <= s3;
				elsif i1 = '1' and i2 = '0' then
					next_state <= s5;
				end if;
			when s2 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s0;
				elsif i1 = '1' and i2 = '1' then
					next_state <= s0;
				elsif i1 = '0' and i2 = '1' then
					next_state <= s2;
				elsif i1 = '1' and i2 = '0' then
					next_state <= s4;
				end if;
			when s3 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s1;
				elsif i1 = '1' and i2 = '1' then
					next_state <= s0;
				elsif i1 = '0' and i2 = '1' then
					next_state <= s3;
				elsif i1 = '1' and i2 = '0' then
					next_state <= s5;
				end if;
			when s4 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s0;
				elsif i1 = '1' and i2 = '1' then
					next_state <= s1;
				elsif i1 = '0' and i2 = '1' then
					next_state <= s3;
				elsif i1 = '1' and i2 = '0' then
					next_state <= s4;
				end if;
			when s5 =>
				if i1 = '0' and i2 = '0' then
					next_state <= s1;
				elsif i1 = '1' and i2 = '1' then
					next_state <= s1;
				elsif i1 = '0' and i2 = '1' then
					next_state <= s2;
				elsif i1 = '1' and i2 = '0' then
					next_state <= s5;
				end if;
			when others =>
				next_state <= s0;
		end case;
	end process;
end architecture;

