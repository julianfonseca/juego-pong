LIBRARY IEEE;
use ieee.std_logic_1164.all;

ENTITY Pintado IS

	PORT(		Rst:	in	STD_LOGIC;
				Clk:	in	STD_LOGIC;
				J1:	in	STD_LOGIC_VECTOR(7 downto 0);
				J2:	in	STD_LOGIC_VECTOR(7 downto 0);
				PoscXPintarBola: 	in	STD_LOGIC_VECTOR(15 DOWNTO 0);
				PoscYPintarBola:	in	STD_LOGIC_VECTOR(7 DOWNTO 0);
				PoscXPintar	:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0);
				PoscYPintar	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY Pintado;

ARCHITECTURE my_arch OF Pintado IS
		TYPE state IS (Borra1,PintaJ1,Borra2,PintaJ2,Borra3,PintaBola);
		SIGNAL pr_state, nx_state:state;
BEGIN
		-------- COMBINACIONAL
		Process (rst,Clk)
		begin
			if (rst='1') then
			pr_state<=Borra1;
			elsif (rising_edge(Clk)) then
			pr_state <= nx_state;
			End if;
		End Process;
		-------- SECUENCIAL --
		Process (J1,J2,PoscXPintarBola,PoscYPintarBola)
		begin
			case  pr_state IS
		--------------------
				when Borra1 =>
				
				PoscXPintar <= "0000000000000000";				
				PoscYPintar <= "00000000";
					nx_state <= PintaJ1;

		----------------------
				when PintaJ1 =>
				
				PoscXPintar <= "1000000000000000";				
				PoscYPintar <= J1;
				nx_state <= Borra2;
				
		----------------------
				when Borra2 =>
				
				PoscXPintar <= "0000000000000000";				
				PoscYPintar <= "00000000";
					nx_state <= PintaJ2;
					
		----------------------
				when PintaJ2 =>
				
				PoscXPintar <= "0000000000000001";				
				PoscYPintar <= J2;
				nx_state <= Borra3;
				
		----------------------
				when Borra3 =>
				
				PoscXPintar <= "0000000000000000";				
				PoscYPintar <= "00000000";
					nx_state <= PintaBola;
					
		----------------------
				when PintaBola =>
				
				PoscXPintar <= PoscXPintarBola;				
				PoscYPintar <= PoscYPintarBola;
				nx_state 	<= Borra1;
				
		----------------------
		
			end Case;
		End Process;
END ARCHITECTURE;