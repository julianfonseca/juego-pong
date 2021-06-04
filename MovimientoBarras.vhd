LIBRARY IEEE;
use ieee.std_logic_1164.all;

ENTITY MovimientoBarras IS

	PORT(		Rst:	in	STD_LOGIC;
				Clk:	in	STD_LOGIC;
				Sube:	in	STD_LOGIC;
				Baja:	in	STD_LOGIC;
				Barra:	Out	STD_LOGIC_VECTOR(7 downto 0));
END ENTITY MovimientoBarras;

ARCHITECTURE my_arch OF MovimientoBarras IS
		TYPE state IS (zero, one, two,three,four,five);
		SIGNAL pr_state, nx_state:state;
BEGIN
		-------- COMBINACIONAL
		Process (rst,Clk)
		begin
			if (rst='1') then
			pr_state<=three;
			elsif (rising_edge(Clk)) then
			pr_state <= nx_state;
			End if;
		End Process;
		-------- SECUENCIAL --
		Process (Sube,Baja,pr_state)
		begin
			case  pr_state IS
		--------------------
				when zero =>
				
				Barra <= "00000111";				
				If (Sube = '1' AND Baja = '0') then
					nx_state <= one;
				else
					nx_state <= zero;
				end if;
		----------------------
				when one =>
				
				Barra <= "00001110";	
				If (Sube = '1' AND Baja = '0') then
					nx_state <= two;
				Elsif (Sube = '0' AND Baja = '1') then
					nx_state <= zero;
				else
					nx_state <= one;
				end if;
		----------------------
				when two =>
				
				Barra <= "00011100";
				If (Sube = '1' AND Baja = '0') then
					nx_state <= three;
				Elsif (Sube = '0' AND Baja = '1') then
					nx_state <= one;
				else
					nx_state <= two;
				end if;
		----------------------
				when three =>
				
				Barra <= "00111000";
				If (Sube = '1' AND Baja = '0') then
					nx_state <= four;
				Elsif (Sube = '0' AND Baja = '1') then
					nx_state <= two;
				else
					nx_state <= three;
				end if;
		----------------------
				when four =>
				
				Barra <= "01110000";
				If (Sube = '1' AND Baja = '0') then
					nx_state <= five;
				Elsif (Sube = '0' AND Baja = '1') then
					nx_state <= three;
				else
					nx_state <= four;
				end if;
		----------------------
				when five =>
				
				Barra <= "11100000";
				If (Sube = '0' AND Baja = '1') then
					nx_state <= four;
				else
					nx_state <= five;
				end if;
		----------------------
		
			end Case;
		End Process;
END ARCHITECTURE;