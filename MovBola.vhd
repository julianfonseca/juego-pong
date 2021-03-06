LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MovBola IS
	PORT		(	clk			:	IN		STD_LOGIC;
					rst			:	IN		STD_LOGIC;
					DireccionXAnt:	IN		STD_LOGIC;---0 hacia la izquierda, 1 Hacia la derecha
					DireccionYAnt:	IN		STD_LOGIC;---0 hacia abajo, 1 Hacia arriba
					LineaRectaAnt:	IN		STD_LOGIC;---0 Diagonal, 1 RectoHorizontal
					PoscJ1		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
					PoscJ2		:	IN		STD_LOGIC_VECTOR(7 DOWNTO 0);
					DireccionXNxt:	OUT	STD_LOGIC;---0 hacia la izquierda, 1 Hacia la derecha
					DireccionYNxt:	OUT	STD_LOGIC;---0 hacia abajo, 1 Hacia arriba
					LineaRectaNxt:	OUT	STD_LOGIC;---0 Diagonal, 1 RectoHorizontal
					PuntoJ1		:	OUT	STD_LOGIC;
					PuntoJ2		:	OUT	STD_LOGIC;
					PoscXPintar	:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0);
					PoscYPintar	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;

ARCHITECTURE state_machine OF MovBola IS
	TYPE state IS (X1Y1,X2Y1,X3Y1,X4Y1,X5Y1,X6Y1,X7Y1,X8Y1,X9Y1,X10Y1,X11Y1,X12Y1,X13Y1,X14Y1,X15Y1,X16Y1,X1Y2,X2Y2,X3Y2,X4Y2,X5Y2,X6Y2,X7Y2,X8Y2,X9Y2,X10Y2,X11Y2,X12Y2,X13Y2,X14Y2,X15Y2,X16Y2,X1Y3,X2Y3,X3Y3,X4Y3,X5Y3,X6Y3,X7Y3,X8Y3,X9Y3,X10Y3,X11Y3,X12Y3,X13Y3,X14Y3,X15Y3,X16Y3,X1Y4,X2Y4,X3Y4,X4Y4,X5Y4,X6Y4,X7Y4,X8Y4,X9Y4,X10Y4,X11Y4,X12Y4,X13Y4,X14Y4,X15Y4,X16Y4,X1Y5,X2Y5,X3Y5,X4Y5,X5Y5,X6Y5,X7Y5,X8Y5,X9Y5,X10Y5,X11Y5,X12Y5,X13Y5,X14Y5,X15Y5,X16Y5,X1Y6,X2Y6,X3Y6,X4Y6,X5Y6,X6Y6,X7Y6,X8Y6,X9Y6,X10Y6,X11Y6,X12Y6,X13Y6,X14Y6,X15Y6,X16Y6,X1Y7,X2Y7,X3Y7,X4Y7,X5Y7,X6Y7,X7Y7,X8Y7,X9Y7,X10Y7,X11Y7,X12Y7,X13Y7,X14Y7,X15Y7,X16Y7,X1Y8,X2Y8,X3Y8,X4Y8,X5Y8,X6Y8,X7Y8,X8Y8,X9Y8,X10Y8,X11Y8,X12Y8,X13Y8,X14Y8,X15Y8,X16Y8,GolJ1,GolJ2);
	SIGNAL pr_state, nx_state: state;
	SIGNAL fil1_s, col1_s, fil2_s, col2_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL max_tick_timer : STD_LOGIC;
BEGIN
	PROCESS (rst, clk)
	BEGIN
		IF (rst = '1') THEN
			pr_state <= X8Y4;
		ELSIF (rising_edge(clk)) THEN
			pr_state <= nx_state;
		END IF;
	END PROCESS;
	
	--Timer:	ENTITY work.univ_bit_counter
	--GENERIC MAP	(	N			=> 8);
	--PORT MAP		(	rst				=> rst,
	--					ena				=> '1',
	--					sync_clr			=> '0',
	--					clk				=> clk,
	--					max_tick_timer	=> max_tick_timer);


	-- Maquina de estados para hacer barrido de vectores:
	PROCESS (pr_state, DireccionXAnt,DireccionYAnt,LineaRectaAnt,PoscJ1,PoscJ2)
	BEGIN
		CASE pr_state IS
			WHEN GolJ1 =>
				PoscXPintar <= "0000000000000000";
				PoscYPintar <= "00000000";
				PuntoJ1<='1';
				PuntoJ2<='0';
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='0';
				nx_state <= X8Y4;
				
			WHEN GolJ2 =>
				PoscXPintar <= "0000000000000000";
				PoscYPintar <= "00000000";
				PuntoJ1<='0';
				PuntoJ2<='1';
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='0';
				nx_state <= X9Y5;
		
			WHEN X1Y1 =>
				PoscXPintar <= "1000000000000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ1;
				
			WHEN X1Y2 =>
				PoscXPintar <= "1000000000000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ1;
				
			WHEN X1Y3 =>
				PoscXPintar <= "1000000000000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ1;
			
			WHEN X1Y4 =>
				PoscXPintar <= "1000000000000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ1;
				
			WHEN X1Y5 =>
				PoscXPintar <= "1000000000000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ1;
				
			WHEN X1Y6 =>
				PoscXPintar <= "1000000000000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ1;
				
			WHEN X1Y7 =>
				PoscXPintar <= "1000000000000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ1;
				
			WHEN X1Y8 =>
				PoscXPintar <= "1000000000000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ1;
				
			WHEN X2Y1 =>
				PoscXPintar <= "0100000000000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(PoscJ1(0)='0') then
				nx_state <= X1Y1;
				DireccionXNxt<=DireccionXAnt;
				else
				nx_state <= X3Y2;
				DireccionXNxt<=NOT(DireccionXAnt);
				end if;
				
			WHEN X2Y2 =>
				PoscXPintar <= "0100000000000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ1(1)='0') then
				nx_state <= X1Y2;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ1(1)='1' AND PoscJ1(0)='0') then
				nx_state <= X3Y1;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='0';
				elsif(PoscJ1(0)='1' AND PoscJ1(1)='1') then
				nx_state <= X3Y2;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='1';
				else
				nx_state<=X2Y2;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;				
				end if;
				
			WHEN X2Y3 =>
				PoscXPintar <= "0100000000000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ1(2)='0') then
				nx_state <= X1Y3;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ1(0)='1' AND PoscJ1(1)='1' AND PoscJ1(2)='1') then
				nx_state <= X3Y4;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='0';
				LineaRectaNxt<='0';
				elsif(PoscJ1(1)='1' AND PoscJ1(2)='1' AND PoscJ1(3)='1') then
				nx_state <= X3Y3;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='1';
				elsif(PoscJ1(2)='1' AND PoscJ1(3)='1' AND PoscJ1(4)='1') then
				nx_state <= X3Y2;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='0';
				else
				nx_state<=X2Y3;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;	
				end if;
			
			WHEN X2Y4 =>
				PoscXPintar <= "0100000000000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ1(3)='0') then
				nx_state <= X1Y4;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ1(1)='1' AND PoscJ1(2)='1' AND PoscJ1(3)='1') then
				nx_state <= X3Y5;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='0';
				LineaRectaNxt<='0';
				elsif(PoscJ1(2)='1' AND PoscJ1(3)='1' AND PoscJ1(4)='1') then
				nx_state <= X3Y4;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='1';
				elsif(PoscJ1(3)='1' AND PoscJ1(4)='1' AND PoscJ1(5)='1') then
				nx_state <= X3Y3;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='0';
				else
				nx_state<=X2Y4;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;	
				end if;
				
			WHEN X2Y5 =>
				PoscXPintar <= "0100000000000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ1(4)='0') then
				nx_state <= X1Y5;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ1(2)='1' AND PoscJ1(3)='1' AND PoscJ1(4)='1') then
				nx_state <= X3Y6;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='0';
				LineaRectaNxt<='0';
				elsif(PoscJ1(3)='1' AND PoscJ1(4)='1' AND PoscJ1(5)='1') then
				nx_state <= X3Y5;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='1';
				elsif(PoscJ1(4)='1' AND PoscJ1(5)='1' AND PoscJ1(6)='1') then
				nx_state <= X3Y4;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='0';
				else
				nx_state<=X2Y5;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;	
				end if;
				
			WHEN X2Y6 =>
				PoscXPintar <= "0100000000000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ1(5)='0') then
				nx_state <= X1Y6;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ1(3)='1' AND PoscJ1(4)='1' AND PoscJ1(5)='1') then
				nx_state <= X3Y7;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='0';
				LineaRectaNxt<='0';
				elsif(PoscJ1(4)='1' AND PoscJ1(5)='1' AND PoscJ1(6)='1') then
				nx_state <= X3Y6;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='1';
				elsif(PoscJ1(5)='1' AND PoscJ1(6)='1' AND PoscJ1(7)='1') then
				nx_state <= X3Y5;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='0';
				else
				nx_state<=X2Y6;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;	
				end if;
				
			WHEN X2Y7 =>
				PoscXPintar <= "0100000000000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ1(6)='0') then
				nx_state <= X1Y7;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ1(6)='1' AND PoscJ1(7)='0') then
				nx_state <= X3Y8;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='0';
				elsif(PoscJ1(6)='1' AND PoscJ1(7)='1') then
				nx_state <= X3Y7;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='1';
				else
				nx_state<=X2Y7;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;	
				end if;
				
			WHEN X2Y8 =>
				PoscXPintar <= "0100000000000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(PoscJ1(7)='0') then
				nx_state <= X1Y8;
				DireccionXNxt<=DireccionXAnt;
				else
				nx_state <= X3Y7;
				DireccionXNxt<=NOT(DireccionXAnt);
				end if;
				
			WHEN X3Y1 =>
				PoscXPintar <= "0010000000000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<='0';
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X2Y2;
				else
				nx_state <= X4Y2;
				end if;
				
				
			WHEN X3Y2 =>
				PoscXPintar <= "0010000000000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X2Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X2Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X2Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X4Y2;
				else
				nx_state <= X4Y3;
				end if;
				
			WHEN X3Y3 =>
				PoscXPintar <= "0010000000000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X2Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X2Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X2Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X4Y3;
				else
				nx_state <= X4Y4;
				end if;
			
			WHEN X3Y4 =>
				PoscXPintar <= "0010000000000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X2Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X2Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X2Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X4Y4;
				else
				nx_state <= X4Y5;
				end if;
				
			WHEN X3Y5 =>
				PoscXPintar <= "0010000000000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X2Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X2Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X2Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X4Y5;
				else
				nx_state <= X4Y6;
				end if;
				
			WHEN X3Y6 =>
				PoscXPintar <= "0010000000000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X2Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X2Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X2Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X4Y6;
				else
				nx_state <= X4Y7;
				end if;
				
			WHEN X3Y7 =>
				PoscXPintar <= "0010000000000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X2Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X2Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X2Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X4Y7;
				else
				nx_state <= X4Y8;
				end if;
				
			WHEN X3Y8 =>
				PoscXPintar <= "0010000000000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X2Y7;
				else
				nx_state <= X4Y7;
				end if;	
	
			WHEN X4Y1 =>
				PoscXPintar <= "0001000000000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X3Y2;
				else
				nx_state <= X5Y2;
				end if;
				
			WHEN X4Y2 =>
				PoscXPintar <= "0001000000000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X3Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X3Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X3Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X5Y2;
				else
				nx_state <= X5Y3;
				end if;
				
			WHEN X4Y3 =>
				PoscXPintar <= "0001000000000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X3Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X3Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X3Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X5Y3;
				else
				nx_state <= X5Y4;
				end if;
			
			WHEN X4Y4 =>
				PoscXPintar <= "0001000000000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X3Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X3Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X3Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X5Y4;
				else
				nx_state <= X5Y5;
				end if;
				
			WHEN X4Y5 =>
				PoscXPintar <= "0001000000000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X3Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X3Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X3Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X5Y5;
				else
				nx_state <= X5Y6;
				end if;
				
			WHEN X4Y6 =>
				PoscXPintar <= "0001000000000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X3Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X3Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X3Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X5Y6;
				else
				nx_state <= X5Y7;
				end if;
				
			WHEN X4Y7 =>
				PoscXPintar <= "0001000000000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X3Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X3Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X3Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X5Y7;
				else
				nx_state <= X5Y8;
				end if;
				
			WHEN X4Y8 =>
				PoscXPintar <= "0001000000000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X3Y7;
				else
				nx_state <= X5Y7;
				end if;	
			
			WHEN X5Y1 =>
				PoscXPintar <= "0000100000000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X4Y2;
				else
				nx_state <= X6Y2;
				end if;
				
			WHEN X5Y2 =>
				PoscXPintar <= "0000100000000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X4Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X4Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X6Y2;
				else
				nx_state <= X6Y3;
				end if;
				
			WHEN X5Y3 =>
				PoscXPintar <= "0000100000000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X4Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X4Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X6Y3;
				else
				nx_state <= X6Y4;
				end if;
			
			WHEN X5Y4 =>
				PoscXPintar <= "0000100000000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X4Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X4Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X6Y4;
				else
				nx_state <= X6Y5;
				end if;
				
			WHEN X5Y5 =>
				PoscXPintar <= "0000100000000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X4Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X4Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X6Y5;
				else
				nx_state <= X6Y6;
				end if;
				
			WHEN X5Y6 =>
				PoscXPintar <= "0000100000000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X4Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X4Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X6Y6;
				else
				nx_state <= X6Y7;
				end if;
				
			WHEN X5Y7 =>
				PoscXPintar <= "0000100000000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X4Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X4Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X4Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X6Y7;
				else
				nx_state <= X6Y8;
				end if;
				
			WHEN X5Y8 =>
				PoscXPintar <= "0000100000000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X4Y7;
				else
				nx_state <= X6Y7;
				end if;	
			
			WHEN X6Y1 =>
				PoscXPintar <= "0000010000000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X5Y2;
				else
				nx_state <= X7Y2;
				end if;
				
				
			WHEN X6Y2 =>
				PoscXPintar <= "0000010000000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X5Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X5Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X7Y2;
				else
				nx_state <= X7Y3;
				end if;
				
			WHEN X6Y3 =>
				PoscXPintar <= "0000010000000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X5Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X5Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X7Y3;
				else
				nx_state <= X7Y4;
				end if;
			
			WHEN X6Y4 =>
				PoscXPintar <= "0000010000000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X5Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X5Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X7Y4;
				else
				nx_state <= X7Y5;
				end if;
				
			WHEN X6Y5 =>
				PoscXPintar <= "0000010000000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X5Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X5Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X7Y5;
				else
				nx_state <= X7Y6;
				end if;
				
			WHEN X6Y6 =>
				PoscXPintar <= "0000010000000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X5Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X5Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X7Y6;
				else
				nx_state <= X7Y7;
				end if;
				
			WHEN X6Y7 =>
				PoscXPintar <= "0000010000000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X5Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X5Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X5Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X7Y7;
				else
				nx_state <= X7Y8;
				end if;
				
			WHEN X6Y8 =>
				PoscXPintar <= "0000010000000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X5Y7;
				else
				nx_state <= X7Y7;
				end if;	
				
			WHEN X7Y1 =>
				PoscXPintar <= "0000001000000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X6Y2;
				else
				nx_state <= X8Y2;
				end if;
				
			WHEN X7Y2 =>
				PoscXPintar <= "0000001000000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X6Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X6Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X8Y2;
				else
				nx_state <= X8Y3;
				end if;
				
			WHEN X7Y3 =>
				PoscXPintar <= "0000001000000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X6Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X6Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X8Y3;
				else
				nx_state <= X8Y4;
				end if;
			
			WHEN X7Y4 =>
				PoscXPintar <= "0000001000000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X6Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X6Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X8Y4;
				else
				nx_state <= X8Y5;
				end if;
				
			WHEN X7Y5 =>
				PoscXPintar <= "0000001000000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X6Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X6Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X8Y5;
				else
				nx_state <= X8Y6;
				end if;
				
			WHEN X7Y6 =>
				PoscXPintar <= "0000001000000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X6Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X6Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X8Y6;
				else
				nx_state <= X8Y7;
				end if;
				
			WHEN X7Y7 =>
				PoscXPintar <= "0000001000000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X6Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X6Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X6Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X8Y7;
				else
				nx_state <= X8Y8;
				end if;
				
			WHEN X7Y8 =>
				PoscXPintar <= "0000001000000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X6Y7;
				else
				nx_state <= X8Y7;
				end if;				
		
			WHEN X8Y1 =>
				PoscXPintar <= "0000000100000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X7Y2;
				else
				nx_state <= X9Y2;
				end if;
				
			WHEN X8Y2 =>
				PoscXPintar <= "0000000100000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X7Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X7Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X9Y2;
				else
				nx_state <= X9Y3;
				end if;
				
			WHEN X8Y3 =>
				PoscXPintar <= "0000000100000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X7Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X7Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X9Y3;
				else
				nx_state <= X9Y4;
				end if;
			
			WHEN X8Y4 =>
				PoscXPintar <= "0000000100000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X7Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X7Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X9Y4;
				else
				nx_state <= X9Y5;
				end if;
				
			WHEN X8Y5 =>
				PoscXPintar <= "0000000100000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X7Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X7Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X9Y5;
				else
				nx_state <= X9Y6;
				end if;
				
			WHEN X8Y6 =>
				PoscXPintar <= "0000000100000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X7Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X7Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X9Y6;
				else
				nx_state <= X9Y7;
				end if;
				
			WHEN X8Y7 =>
				PoscXPintar <= "0000000100000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X7Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X7Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X7Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X9Y7;
				else
				nx_state <= X9Y8;
				end if;
				
			WHEN X8Y8 =>
				PoscXPintar <= "0000000100000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X7Y7;
				else
				nx_state <= X9Y7;
				end if;	
		
			WHEN X9Y1 =>
				PoscXPintar <= "0000000010000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X8Y2;
				else
				nx_state <= X10Y2;
				end if;
				
			WHEN X9Y2 =>
				PoscXPintar <= "0000000010000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X8Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X8Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X10Y2;
				else
				nx_state <= X10Y3;
				end if;
				
			WHEN X9Y3 =>
				PoscXPintar <= "0000000010000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X8Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X8Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X10Y3;
				else
				nx_state <= X10Y4;
				end if;
			
			WHEN X9Y4 =>
				PoscXPintar <= "0000000010000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X8Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X8Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X10Y4;
				else
				nx_state <= X10Y5;
				end if;
				
			WHEN X9Y5 =>
				PoscXPintar <= "0000000010000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X8Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X8Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X10Y5;
				else
				nx_state <= X10Y6;
				end if;
				
			WHEN X9Y6 =>
				PoscXPintar <= "0000000010000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X8Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X8Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X10Y6;
				else
				nx_state <= X10Y7;
				end if;
				
			WHEN X9Y7 =>
				PoscXPintar <= "0000000010000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X8Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X8Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X8Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X10Y7;
				else
				nx_state <= X10Y8;
				end if;
				
			WHEN X9Y8 =>
				PoscXPintar <= "0000000010000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X8Y7;
				else
				nx_state <= X10Y7;
				end if;	
		
			WHEN X10Y1 =>
				PoscXPintar <= "0000000001000000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X9Y2;
				else
				nx_state <= X11Y2;
				end if;
				
			WHEN X10Y2 =>
				PoscXPintar <= "0000000001000000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X9Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X9Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X11Y2;
				else
				nx_state <= X11Y3;
				end if;
				
			WHEN X10Y3 =>
				PoscXPintar <= "0000000001000000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X9Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X9Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X11Y3;
				else
				nx_state <= X11Y4;
				end if;
			
			WHEN X10Y4 =>
				PoscXPintar <= "0000000001000000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X9Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X9Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X11Y4;
				else
				nx_state <= X11Y5;
				end if;
				
			WHEN X10Y5 =>
				PoscXPintar <= "0000000001000000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X9Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X9Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X11Y5;
				else
				nx_state <= X11Y6;
				end if;
				
			WHEN X10Y6 =>
				PoscXPintar <= "0000000001000000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X9Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X9Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X11Y6;
				else
				nx_state <= X11Y7;
				end if;
				
			WHEN X10Y7 =>
				PoscXPintar <= "0000000001000000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X9Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X9Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X9Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X11Y7;
				else
				nx_state <= X11Y8;
				end if;
				
			WHEN X10Y8 =>
				PoscXPintar <= "0000000001000000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X9Y7;
				else
				nx_state <= X11Y7;
				end if;	
				
			WHEN X11Y1 =>
				PoscXPintar <= "0000000000100000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X10Y2;
				else
				nx_state <= X12Y2;
				end if;
				
			WHEN X11Y2 =>
				PoscXPintar <= "0000000000100000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X10Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X10Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X12Y2;
				else
				nx_state <= X12Y3;
				end if;
				
			WHEN X11Y3 =>
				PoscXPintar <= "0000000000100000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X10Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X10Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X12Y3;
				else
				nx_state <= X12Y4;
				end if;
			
			WHEN X11Y4 =>
				PoscXPintar <= "0000000000100000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X10Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X10Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X12Y4;
				else
				nx_state <= X12Y5;
				end if;
				
			WHEN X11Y5 =>
				PoscXPintar <= "0000000000100000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X10Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X10Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X12Y5;
				else
				nx_state <= X12Y6;
				end if;
				
			WHEN X11Y6 =>
				PoscXPintar <= "0000000000100000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X10Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X10Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X12Y6;
				else
				nx_state <= X12Y7;
				end if;
				
			WHEN X11Y7 =>
				PoscXPintar <= "0000000000100000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X10Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X10Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X10Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X12Y7;
				else
				nx_state <= X12Y8;
				end if;
				
			WHEN X11Y8 =>
				PoscXPintar <= "0000000000100000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X10Y7;
				else
				nx_state <= X12Y7;
				end if;	
				
			WHEN X12Y1 =>
				PoscXPintar <= "0000000000010000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X11Y2;
				else
				nx_state <= X13Y2;
				end if;
				
			WHEN X12Y2 =>
				PoscXPintar <= "0000000000010000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X11Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X11Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X13Y2;
				else
				nx_state <= X13Y3;
				end if;
				
			WHEN X12Y3 =>
				PoscXPintar <= "0000000000010000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X11Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X11Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X13Y3;
				else
				nx_state <= X13Y4;
				end if;
			
			WHEN X12Y4 =>
				PoscXPintar <= "0000000000010000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X11Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X11Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X13Y4;
				else
				nx_state <= X13Y5;
				end if;
				
			WHEN X12Y5 =>
				PoscXPintar <= "0000000000010000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X11Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X11Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X13Y5;
				else
				nx_state <= X13Y6;
				end if;
				
			WHEN X12Y6 =>
				PoscXPintar <= "0000000000010000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X11Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X11Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X13Y6;
				else
				nx_state <= X13Y7;
				end if;
				
			WHEN X12Y7 =>
				PoscXPintar <= "0000000000010000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X11Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X11Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X11Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X13Y7;
				else
				nx_state <= X13Y8;
				end if;
				
			WHEN X12Y8 =>
				PoscXPintar <= "0000000000010000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X11Y7;
				else
				nx_state <= X13Y7;
				end if;	
				
			WHEN X13Y1 =>
				PoscXPintar <= "0000000000001000";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X12Y2;
				else
				nx_state <= X14Y2;
				end if;
				
			WHEN X13Y2 =>
				PoscXPintar <= "0000000000001000";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X12Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X12Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X14Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X14Y2;
				else
				nx_state <= X14Y3;
				end if;
				
			WHEN X13Y3 =>
				PoscXPintar <= "0000000000001000";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X12Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X12Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X14Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X14Y3;
				else
				nx_state <= X14Y4;
				end if;
			
			WHEN X13Y4 =>
				PoscXPintar <= "0000000000001000";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X12Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X12Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X14Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X14Y4;
				else
				nx_state <= X14Y5;
				end if;
				
			WHEN X13Y5 =>
				PoscXPintar <= "0000000000001000";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X12Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X12Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X14Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X14Y5;
				else
				nx_state <= X14Y6;
				end if;
				
			WHEN X13Y6 =>
				PoscXPintar <= "0000000000001000";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X12Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X12Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X14Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X14Y6;
				else
				nx_state <= X14Y7;
				end if;
				
			WHEN X13Y7 =>
				PoscXPintar <= "0000000000001000";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X12Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X12Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X12Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X14Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X14Y7;
				else
				nx_state <= X14Y8;
				end if;
				
			WHEN X13Y8 =>
				PoscXPintar <= "0000000000001000";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X12Y7;
				else
				nx_state <= X14Y7;
				end if;	
				
			WHEN X14Y1 =>
				PoscXPintar <= "0000000000000100";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X13Y2;
				else
				nx_state <= X15Y2;
				end if;
				
			WHEN X14Y2 =>
				PoscXPintar <= "0000000000000100";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y1;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X13Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X13Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X15Y1;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X15Y2;
				else
				nx_state <= X15Y3;
				end if;
				
			WHEN X14Y3 =>
				PoscXPintar <= "0000000000000100";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y2;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X13Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X13Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X15Y2;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X15Y3;
				else
				nx_state <= X15Y4;
				end if;
			
			WHEN X14Y4 =>
				PoscXPintar <= "0000000000000100";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y3;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X13Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X13Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X15Y3;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X15Y4;
				else
				nx_state <= X15Y5;
				end if;
				
			WHEN X14Y5 =>
				PoscXPintar <= "0000000000000100";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y4;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X13Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X13Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X15Y4;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X15Y5;
				else
				nx_state <= X15Y6;
				end if;
				
			WHEN X14Y6 =>
				PoscXPintar <= "0000000000000100";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y5;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X13Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X13Y7;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X15Y5;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X15Y6;
				else
				nx_state <= X15Y7;
				end if;
				
			WHEN X14Y7 =>
				PoscXPintar <= "0000000000000100";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X13Y6;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='1') then
				nx_state <= X13Y7;
				elsif (DireccionXAnt='0' AND LineaRectaAnt ='0' AND DireccionYAnt='0') then
				nx_state <= X13Y8;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='0' AND DireccionYAnt='1') then
				nx_state <= X15Y6;
				elsif (DireccionXAnt='1' AND LineaRectaAnt ='1') then
				nx_state <= X15Y7;
				else
				nx_state <= X15Y8;
				end if;
				
			WHEN X14Y8 =>
				PoscXPintar <= "0000000000000100";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=NOT(DireccionYAnt);
				DireccionXNxt<=DireccionXAnt;
				LineaRectaNxt<='0';
				if(DireccionXAnt='0') then
				nx_state <= X13Y7;
				else
				nx_state <= X15Y7;
				end if;	
				
			WHEN X15Y1 =>
				PoscXPintar <= "0000000000000010";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(PoscJ2(0)='0') then
				nx_state <= X16Y1;
				DireccionXNxt<=DireccionXAnt;
				else
				nx_state <= X14Y2;
				DireccionXNxt<=NOT(DireccionXAnt);
				end if;
				
			WHEN X15Y2 =>
				PoscXPintar <= "0000000000000010";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ2(1)='0') then
				nx_state <= X16Y2;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ2(1)='1' AND PoscJ2(0)='0') then
				nx_state <= X14Y1;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='0';
				elsif(PoscJ2(0)='1' AND PoscJ2(1)='1') then
				nx_state <= X14Y2;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='1';
				else
				nx_state<=X15Y2;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;				
				end if;
				
			WHEN X15Y3 =>
				PoscXPintar <= "0000000000000010";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ2(2)='0') then
				nx_state <= X16Y3;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ2(0)='1' AND PoscJ2(1)='1' AND PoscJ2(2)='1') then
				nx_state <= X14Y4;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='0';
				LineaRectaNxt<='0';
				elsif(PoscJ2(1)='1' AND PoscJ2(2)='1' AND PoscJ2(3)='1') then
				nx_state <= X14Y3;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='1';
				elsif(PoscJ2(2)='1' AND PoscJ2(3)='1' AND PoscJ2(4)='1') then
				nx_state <= X14Y2;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='0';
				else
				nx_state<=X15Y3;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;				
				end if;
			
			WHEN X15Y4 =>
				PoscXPintar <= "0000000000000010";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ2(3)='0') then
				nx_state <= X16Y4;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ2(1)='1' AND PoscJ2(2)='1' AND PoscJ2(3)='1') then
				nx_state <= X14Y5;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='0';
				LineaRectaNxt<='0';
				elsif(PoscJ2(2)='1' AND PoscJ2(3)='1' AND PoscJ2(4)='1') then
				nx_state <= X14Y4;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='1';
				elsif(PoscJ2(3)='1' AND PoscJ2(4)='1' AND PoscJ2(5)='1') then
				nx_state <= X14Y3;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='0';
				else
				nx_state<=X15Y4;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;				
				end if;
				
			WHEN X15Y5 =>
				PoscXPintar <= "0000000000000010";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ2(4)='0') then
				nx_state <= X16Y5;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ2(2)='1' AND PoscJ2(3)='1' AND PoscJ2(4)='1') then
				nx_state <= X14Y6;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='0';
				LineaRectaNxt<='0';
				elsif(PoscJ2(3)='1' AND PoscJ2(4)='1' AND PoscJ2(5)='1') then
				nx_state <= X14Y5;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='1';
				elsif(PoscJ2(4)='1' AND PoscJ2(5)='1' AND PoscJ2(6)='1') then
				nx_state <= X14Y4;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='0';
				else
				nx_state<=X15Y5;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;				
				end if;
				
			WHEN X15Y6 =>
				PoscXPintar <= "0000000000000010";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ2(5)='0') then
				nx_state <= X16Y6;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ2(3)='1' AND PoscJ2(4)='1' AND PoscJ2(5)='1') then
				nx_state <= X14Y7;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='0';
				LineaRectaNxt<='0';
				elsif(PoscJ2(4)='1' AND PoscJ2(5)='1' AND PoscJ2(6)='1') then
				nx_state <= X14Y6;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='1';
				elsif(PoscJ2(5)='1' AND PoscJ2(6)='1' AND PoscJ2(7)='1') then
				nx_state <= X14Y5;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<='1';
				LineaRectaNxt<='0';
				else
				nx_state<=X15Y6;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;				
				end if;
				
			WHEN X15Y7 =>
				PoscXPintar <= "0000000000000010";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				if(PoscJ2(6)='0') then
				nx_state <= X16Y7;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				elsif(PoscJ2(6)='1' AND PoscJ2(7)='0') then
				nx_state <= X14Y8;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='0';
				elsif(PoscJ2(6)='1' AND PoscJ2(7)='1') then
				nx_state <= X14Y7;
				DireccionXNxt<=NOT(DireccionXAnt);
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<='1';
				else
				nx_state<=X15Y7;
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				end if;
				
			WHEN X15Y8 =>
				PoscXPintar <= "0000000000000010";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				if(PoscJ2(7)='0') then
				nx_state <= X16Y8;
				DireccionXNxt<=DireccionXAnt;
				else
				nx_state <= X14Y7;
				DireccionXNxt<=NOT(DireccionXAnt);
				end if;
				
			WHEN X16Y1 =>
				PoscXPintar <= "0000000000000001";
				PoscYPintar <= "01111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ2;
				
			WHEN X16Y2 =>
				PoscXPintar <= "0000000000000001";
				PoscYPintar <= "10111111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ2;
				
			WHEN X16Y3 =>
				PoscXPintar <= "0000000000000001";
				PoscYPintar <= "11011111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ2;
			
			WHEN X16Y4 =>
				PoscXPintar <= "0000000000000001";
				PoscYPintar <= "11101111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ2;
				
			WHEN X16Y5 =>
				PoscXPintar <= "0000000000000001";
				PoscYPintar <= "11110111";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ2;
				
			WHEN X16Y6 =>
				PoscXPintar <= "0000000000000001";
				PoscYPintar <= "11111011";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ2;
				
			WHEN X16Y7 =>
				PoscXPintar <= "0000000000000001";
				PoscYPintar <= "11111101";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ2;
				
			WHEN X16Y8 =>
				PoscXPintar <= "0000000000000001";
				PoscYPintar <= "11111110";
				PuntoJ1<='0';
				PuntoJ2<='0';
				DireccionXNxt<=DireccionXAnt;
				DireccionYNxt<=DireccionYAnt;
				LineaRectaNxt<=LineaRectaAnt;
				nx_state <= GolJ2;
		
		END CASE;
	END PROCESS;
END ARCHITECTURE;