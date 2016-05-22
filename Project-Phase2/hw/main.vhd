--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   22-05-2016
-- Module Name:   main.vhd
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity main is
	port ();
end entity main;

architecture structural of main is
	component base_zynq_design_wrapper
		port (DDR_addr : inout STD_LOGIC_VECTOR (14 downto 0);
			DDR_ba : inout STD_LOGIC_VECTOR (2 downto 0);
		      	DDR_cas_n : inout STD_LOGIC;
			DDR_ck_n : inout STD_LOGIC;
		     	DDR_ck_p : inout STD_LOGIC;
		     	DDR_cke : inout STD_LOGIC;
		     	DDR_cs_n : inout STD_LOGIC;
		     	DDR_dm : inout STD_LOGIC_VECTOR (3 downto 0);
		     	DDR_dq : inout STD_LOGIC_VECTOR (31 downto 0);
		     	DDR_dqs_n : inout STD_LOGIC_VECTOR (3 downto 0);
		     	DDR_dqs_p : inout STD_LOGIC_VECTOR (3 downto 0);
		     	DDR_odt : inout STD_LOGIC;
		     	DDR_ras_n : inout STD_LOGIC;
		     	DDR_reset_n : inout STD_LOGIC;
		     	DDR_we_n : inout STD_LOGIC;
		     	FIXED_IO_ddr_vrn : inout STD_LOGIC;
		     	FIXED_IO_ddr_vrp : inout STD_LOGIC;
		     	FIXED_IO_mio : inout STD_LOGIC_VECTOR (53 downto 0);
		     	FIXED_IO_ps_clk : inout STD_LOGIC;
		     	FIXED_IO_ps_porb : inout STD_LOGIC;
		     	FIXED_IO_ps_srstb : inout STD_LOGIC;
		     	gpio_rtl_0_tri_io : inout STD_LOGIC_VECTOR (31 downto 0);
		     	gpio_rtl_tri_o : out STD_LOGIC_VECTOR (31 downto 0));
	end component;
begin
end architecture;
