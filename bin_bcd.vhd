LIBRARY IEEE;
use ieee.std_logic_1164.all;

ENTITY bin_bcd IS

	PORT(		X:	in	STD_LOGIC_VECTOR(7 downto 0);
				Y:	out	STD_LOGIC_VECTOR(7 downto 0));
END ENTITY bin_bcd;

ARCHITECTURE behaviour OF bin_bcd IS
		signal C1:	STD_LOGIC_VECTOR(3 downto 0);
		signal C2:	STD_LOGIC_VECTOR(3 downto 0);
		signal C3:	STD_LOGIC_VECTOR(3 downto 0);
		signal C4:	STD_LOGIC_VECTOR(3 downto 0);
		signal C5:	STD_LOGIC_VECTOR(3 downto 0);
		signal C6:	STD_LOGIC_VECTOR(3 downto 0);
		signal C7:	STD_LOGIC_VECTOR(3 downto 0);
		
		signal Co1:	STD_LOGIC_VECTOR(3 downto 0);
		signal Co2:	STD_LOGIC_VECTOR(3 downto 0);
		signal Co3:	STD_LOGIC_VECTOR(3 downto 0);
		signal Co4:	STD_LOGIC_VECTOR(3 downto 0);
		signal Co5:	STD_LOGIC_VECTOR(3 downto 0);
		signal Co6:	STD_LOGIC_VECTOR(2 downto 0);
		signal Co7:	STD_LOGIC_VECTOR(2 downto 0);

BEGIN

C1(0)<=X(5);
C1(1)<=X(6);
C1(2)<=X(7);
C1(3)<='0';

Co1(0)<=((C1(3)) AND (( (NOT (C1(2))) AND (C1(0)) ) OR ( (C1(2)) AND (C1(1)) AND (NOT(C1(0))) ))) OR ( (C1(3)) AND (NOT (C1(0))));
Co1(1)<=(( (C1(3)) AND (C1(1)) ) AND ( (NOT(C1(2))) OR ((C1(2)) AND (C1(0))))) OR ( (C1(3)) AND (NOT (C1(0))));
Co1(2)<=( (NOT(C1(3))) AND (C1(2)) AND (NOT(C1(1))) AND (NOT(C1(0))) ) OR ((C1(3)) AND (C1(0)));
Co1(3)<=(C1(3)) OR (NOT(C1(3)) AND (C1(0) OR C1(1)));

C2(0)<=X(4);
C2(1)<=Co1(0);
C2(2)<=Co1(1);
C2(3)<=Co1(2);

Co2(0)<=((C2(3)) AND (( (NOT (C2(2))) AND (C2(0)) ) OR ( (C2(2)) AND (C2(1)) AND (NOT(C2(0))) ))) OR ( (C2(3)) AND (NOT (C2(0))));
Co2(1)<=(( (C2(3)) AND (C2(1)) ) AND ( (NOT(C2(2))) OR ((C2(2)) AND (C2(0))))) OR ( (C2(3)) AND (NOT (C2(0))));
Co2(2)<=( (NOT(C2(3))) AND (C2(2)) AND (NOT(C2(1))) AND (NOT(C2(0))) ) OR ((C2(3)) AND (C2(0)));
Co2(3)<=(C2(3)) OR (NOT(C2(3)) AND (C2(0) OR C2(1)));

C3(0)<=X(3);
C3(1)<=Co2(0);
C3(2)<=Co2(1);
C3(3)<=Co2(2);

Co3(0)<=((C3(3)) AND (( (NOT (C3(2))) AND (C3(0)) ) OR ( (C3(2)) AND (C3(1)) AND (NOT(C3(0))) ))) OR ( (C3(3)) AND (NOT (C3(0))));
Co3(1)<=(( (C3(3)) AND (C3(1)) ) AND ( (NOT(C3(2))) OR ((C3(2)) AND (C3(0))))) OR ( (C3(3)) AND (NOT (C3(0))));
Co3(2)<=( (NOT(C3(3))) AND (C3(2)) AND (NOT(C3(1))) AND (NOT(C3(0))) ) OR ((C3(3)) AND (C3(0)));
Co3(3)<=(C3(3)) OR (NOT(C3(3)) AND (C3(0) OR C3(1)));

C4(0)<=X(2);
C4(1)<=Co3(0);
C4(2)<=Co3(1);
C4(3)<=Co3(2);

Co4(0)<=((C4(3)) AND (( (NOT (C4(2))) AND (C4(0)) ) OR ( (C4(2)) AND (C4(1)) AND (NOT(C4(0))) ))) OR ( (C4(3)) AND (NOT (C4(0))));
Co4(1)<=(( (C4(3)) AND (C4(1)) ) AND ( (NOT(C4(2))) OR ((C4(2)) AND (C4(0))))) OR ( (C4(3)) AND (NOT (C4(0))));
Co4(2)<=( (NOT(C4(3))) AND (C4(2)) AND (NOT(C4(1))) AND (NOT(C4(0))) ) OR ((C4(3)) AND (C4(0)));
Co4(3)<=(C4(3)) OR (NOT(C4(3)) AND (C4(0) OR C4(1)));

C5(0)<=X(1);
C5(1)<=Co4(0);
C5(2)<=Co4(1);
C5(3)<=Co4(2);

Co5(0)<=((C5(3)) AND (( (NOT (C5(2))) AND (C5(0)) ) OR ( (C5(2)) AND (C5(1)) AND (NOT(C5(0))) ))) OR ( (C5(3)) AND (NOT (C5(0))));
Co5(1)<=(( (C5(3)) AND (C5(1)) ) AND ( (NOT(C5(2))) OR ((C5(2)) AND (C5(0))))) OR ( (C5(3)) AND (NOT (C5(0))));
Co5(2)<=( (NOT(C5(3))) AND (C5(2)) AND (NOT(C5(1))) AND (NOT(C5(0))) ) OR ((C5(3)) AND (C5(0)));
Co5(3)<=(C5(3)) OR (NOT(C5(3)) AND (C5(0) OR C5(1)));

C6(0)<=Co3(3);
C6(1)<=Co2(3);
C6(2)<=Co1(3);
C6(3)<='0';

Co6(0)<=((C6(3)) AND (( (NOT (C6(2))) AND (C6(0)) ) OR ( (C6(2)) AND (C6(1)) AND (NOT(C6(0))) ))) OR ( (C6(3)) AND (NOT (C6(0))));
Co6(1)<=(( (C6(3)) AND (C6(1)) ) AND ( (NOT(C6(2))) OR ((C6(2)) AND (C6(0))))) OR ( (C6(3)) AND (NOT (C6(0))));
Co6(2)<=( (NOT(C6(3))) AND (C6(2)) AND (NOT(C6(1))) AND (NOT(C6(0))) ) OR ((C6(3)) AND (C6(0)));

C7(0)<=Co4(3);
C7(1)<=Co6(0);
C7(2)<=Co6(1);
C7(3)<=Co6(2);

Co7(0)<=((C7(3)) AND (( (NOT (C7(2))) AND (C7(0)) ) OR ( (C7(2)) AND (C7(1)) AND (NOT(C7(0))) ))) OR ( (C7(3)) AND (NOT (C7(0))));
Co7(1)<=(( (C7(3)) AND (C7(1)) ) AND ( (NOT(C7(2))) OR ((C7(2)) AND (C7(0))))) OR ( (C7(3)) AND (NOT (C7(0))));
Co7(2)<=( (NOT(C7(3))) AND (C7(2)) AND (NOT(C7(1))) AND (NOT(C7(0))) ) OR ((C7(3)) AND (C7(0)));

Y(0) <= X(0);
Y(1) <= Co5(0);
Y(2) <= Co5(1);
Y(3) <= Co5(2);
Y(4) <= Co5(3);
Y(5) <= Co7(0);
Y(6) <= Co7(1);
Y(7) <= Co7(2);

END ARCHITECTURE behaviour;