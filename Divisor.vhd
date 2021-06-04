LIBRARY IEEE;
use ieee.std_logic_1164.all;

ENTITY Divisor IS

	PORT(		entrada:	in	STD_LOGIC_VECTOR(7 downto 0);
				lsb:	out	STD_LOGIC_VECTOR(3 downto 0);
				msb:	out	STD_LOGIC_VECTOR(3 downto 0));
END ENTITY Divisor;

ARCHITECTURE behaviour OF Divisor IS

BEGIN

lsb(0)<=entrada(0);
lsb(1)<=entrada(1);
lsb(2)<=entrada(2);
lsb(3)<=entrada(3);
		
msb(0)<=entrada(4);
msb(1)<=entrada(5);
msb(2)<=entrada(6);
msb(3)<=entrada(7);
		


END ARCHITECTURE behaviour;