LIBRARY IEEE;
use ieee.std_logic_1164.all;

ENTITY bin_to_sseg IS

	PORT(		bin:	in	STD_LOGIC_VECTOR(3 downto 0);
				sseg:	out	STD_LOGIC_VECTOR(6 downto 0));
END ENTITY bin_to_sseg;

ARCHITECTURE behaviour OF bin_to_sseg IS

BEGIN


		sseg <=
		"1000000" WHEN bin = "0000" ELSE
		"1111001" WHEN bin = "0001" ELSE
		"0100100" WHEN bin = "0010" ELSE
		"0110000" WHEN bin = "0011" ELSE
		"0011001" WHEN bin = "0100" ELSE
		"0010010" WHEN bin = "0101" ELSE
		"0000010" WHEN bin = "0110" ELSE
		"1111000" WHEN bin = "0111" ELSE
		"0000000" WHEN bin = "1000" ELSE
		"0010000" WHEN bin = "1001";
		



END ARCHITECTURE behaviour;