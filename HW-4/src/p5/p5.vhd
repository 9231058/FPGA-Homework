--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   07-05-2016
-- Module Name:   p5.vhd
--------------------------------------------------------------------------------


process (sel, sel_2, sel_3, a, b)
begin
	if sel = '1' then
		f <= a;
		if sel_2 = '1' then
			g <= not a;
		else
			g <= not b;
			if sel_3 = '1' then
				g <= a xor b;
			end if;
		end if;
	else
		if sel_2 = '1' then
			g <= a and b;
		else
			if sel_3 = '1' then
				g <= a nand b;
			-- preventing from transparent latch creation
			else
				g <= ...;
			end if;
		end if;
		f <= b;
	end if;
end process;
