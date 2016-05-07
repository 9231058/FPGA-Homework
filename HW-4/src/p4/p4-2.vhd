--------------------------------------------------------------------------------
-- Author:        Parham Alvani (parham.alvani@gmail.com)
--
-- Create Date:   07-05-2016
-- Module Name:   p4-2.vhd
--------------------------------------------------------------------------------


-- next state logic for a FSM
process (state, a, b, c, d, e)
begin
	case state is
		when IDLE =>
			if a = '0' then
				next_state <= INITIAL;
			-- preventing from transparent latch creation
			else
				next_state <= IDLE;
			end if;
		when INITIAL =>
			if a = '1' then
				next_state <= ERROR_FLAG;
			else
				next_state <= SCANNING;
			end if;
		when SCANNING =>
			if b = '1' then
				next_state <= LOCKED;
			elsif b = '0' then
				if c = '0' then
					next_state <= TIME_OUT;
				else
					next_state <= RELEASE;
				end if;
			-- following statement never happening ...
			else
				next_state <= CAPTURE;
			end if;
		when CAPTURE =>
			next_state <= ...
		when LOCKED =>
			next_state <= ...
		when TIME_OUT =>
			next_state <= ...
		when RELEASE =>
			next_state <= ...
		when ERROR_FLAG =>
			next_state <= some_function(a, d, e);
	end case;
end process;
