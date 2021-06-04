LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FlipFlopD IS
	PORT ( clk	:	in		STD_LOGIC;
			 rst	:	in		STD_LOGIC;
			 ena	:	in		STD_LOGIC;
			 d  	:	in		STD_LOGIC;			 
			 q	   :	out 	STD_LOGIC);
	END FlipFlopD;

ARCHITECTURE rtl of FlipFlopD is
BEGIN

		dff: process(clk,rst,d)
		BEGIN
		
			if(rst = '1') THEN
			q<='0';
			elsif (rising_edge(clk)) THEN
				if (ena = '1') THEN
				q<=d;
				END IF;
			END IF;
		END PROCESS;
		
END ARCHITECTURE;