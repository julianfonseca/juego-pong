LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Goles IS
	PORT ( Gol			:	in		STD_LOGIC;
			 rst			:	in		STD_LOGIC;
			 ena			:	in		STD_LOGIC;
			 NumGoles  	:	out 	STD_LOGIC_VECTOR(3 downto 0));
	END Goles;

ARCHITECTURE rtl of Goles is
	signal	q0	: STD_LOGIC;
	signal	q1	: STD_LOGIC;
	signal	q2	: STD_LOGIC;
	signal	q3	: STD_LOGIC;
	
	signal	d0	: STD_LOGIC;
	signal	d1	: STD_LOGIC;
	signal	d2	: STD_LOGIC;
	signal	d3	: STD_LOGIC;
	
	signal  ena2: STD_LOGIC;
	signal  ena3: STD_LOGIC;
BEGIN
		d0<= NOT(q0);
		d1<= NOT(q1);
		d2<= NOT(q2);
		d3<= NOT(q3);
		
		ena2 <= q1 AND q0;
		ena3 <= q2 AND q1 AND q0;
		
		NumGoles <=	q3&q2&q1&q0;

		bit0: ENTITY work.FlipFlopD
		PORT MAP (	clk => Gol,
						rst => rst,
						ena => ena,
						d	 => d0,
						q	 => q0);
						
		bit1: ENTITY work.FlipFlopD
		PORT MAP (	clk => Gol,
						rst => rst,
						ena => q0,
						d	 => d1,
						q	 => q1);
						
		bit2: ENTITY work.FlipFlopD
		PORT MAP (	clk => Gol,
						rst => rst,
						ena => ena2,
						d	 => d2,
						q	 => q2);
						
		bit3: ENTITY work.FlipFlopD
		PORT MAP (	clk => Gol,
						rst => rst,
						ena => ena3,
						d	 => d3,
						q	 => q3);
		
END ARCHITECTURE;