LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Proyecto2 IS
	PORT		(	clk			:	IN		STD_LOGIC;
					rst			:	IN		STD_LOGIC;
					BotonArribaJ1:	IN		STD_LOGIC;
					BotonAbajoJ1:	IN		STD_LOGIC;
					BotonArribaJ2:	IN		STD_LOGIC;
					BotonAbajoJ2:	IN		STD_LOGIC;
					PuntosJ1U	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
					PuntosJ1D	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
					PuntosJ2U	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
					PuntosJ2D	:	OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
					PoscXPintar	:	OUT	STD_LOGIC_VECTOR(15 DOWNTO 0);
					PoscYPintar	:	OUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;

ARCHITECTURE behaviour OF Proyecto2 IS
--	TYPE state IS (X1Y1,X2Y1,X3Y1,X4Y1,X5Y1,X6Y1,X7Y1,X8Y1,X9Y1,X10Y1,X11Y1,X12Y1,X13Y1,X14Y1,X15Y1,X16Y1,X1Y2,X2Y2,X3Y2,X4Y2,X5Y2,X6Y2,X7Y2,X8Y2,X9Y2,X10Y2,X11Y2,X12Y2,X13Y2,X14Y2,X15Y2,X16Y2,X1Y3,X2Y3,X3Y3,X4Y3,X5Y3,X6Y3,X7Y3,X8Y3,X9Y3,X10Y3,X11Y3,X12Y3,X13Y3,X14Y3,X15Y3,X16Y3,X1Y4,X2Y4,X3Y4,X4Y4,X5Y4,X6Y4,X7Y4,X8Y4,X9Y4,X10Y4,X11Y4,X12Y4,X13Y4,X14Y4,X15Y4,X16Y4,X1Y5,X2Y5,X3Y5,X4Y5,X5Y5,X6Y5,X7Y5,X8Y5,X9Y5,X10Y5,X11Y5,X12Y5,X13Y5,X14Y5,X15Y5,X16Y5,X1Y6,X2Y6,X3Y6,X4Y6,X5Y6,X6Y6,X7Y6,X8Y6,X9Y6,X10Y6,X11Y6,X12Y6,X13Y6,X14Y6,X15Y6,X16Y6,X1Y7,X2Y7,X3Y7,X4Y7,X5Y7,X6Y7,X7Y7,X8Y7,X9Y7,X10Y7,X11Y7,X12Y7,X13Y7,X14Y7,X15Y7,X16Y7,X1Y8,X2Y8,X3Y8,X4Y8,X5Y8,X6Y8,X7Y8,X8Y8,X9Y8,X10Y8,X11Y8,X12Y8,X13Y8,X14Y8,X15Y8,X16Y8,GolJ1,GolJ2);
--	SIGNAL pr_state, nx_state: state;
--	SIGNAL fil1_s, col1_s, fil2_s, col2_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
--	SIGNAL max_tick_timer : STD_LOGIC;
	SIGNAL	DireccionXAnt:			STD_LOGIC;---0 hacia la izquierda, 1 Hacia la derecha
	SIGNAL	DireccionYAnt:		STD_LOGIC;---0 hacia abajo, 1 Hacia arriba
	SIGNAL	LineaRectaAnt:		STD_LOGIC;---0 Diagonal, 1 RectoHorizontal
	SIGNAL	PoscJ1		:		STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	PoscJ2		:		STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	DireccionXNxt:	STD_LOGIC;---0 hacia la izquierda, 1 Hacia la derecha
	SIGNAL	DireccionYNxt:	STD_LOGIC;---0 hacia abajo, 1 Hacia arriba
	SIGNAL	LineaRectaNxt:	STD_LOGIC;---0 Diagonal, 1 RectoHorizontal
	SIGNAL	PuntoJ1		:	STD_LOGIC;
	SIGNAL	PuntoJ2		:	STD_LOGIC;
	SIGNAL	PoscXPintarBola:	STD_LOGIC_VECTOR(15 DOWNTO 0);
	SIGNAL	PoscYPintarBola:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SIGNAL	NumGolesJ1		:	STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL	NumGolesJ2		:	STD_LOGIC_VECTOR(3 downto 0);
	
	SIGNAL	NumGolesJ1BCD		:	STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL	NumGolesJ2BCD		:	STD_LOGIC_VECTOR(7 downto 0);
	
	SIGNAL	GolesJ1U		:	STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL	GolesJ1D		:	STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL	GolesJ2U		:	STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL	GolesJ2D		:	STD_LOGIC_VECTOR(3 downto 0);

	SIGNAL	PoscJ1Pintar:		STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL	PoscJ2Pintar:		STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SIGNAL 	syn_clr, clk_pintado, clk_pintado_1		:		STD_LOGIC;
	SIGNAL 	counter 		:		STD_LOGIC_VECTOR(22 DOWNTO 0);
	
	SIGNAL clk_mov, clk_mov_1			:		STD_LOGIC;
	
	
	
	BEGIN
	
	v_juego: ENTITY work.univ_bit_counter
	GENERIC MAP (N					=> 23)
	PORT MAP		(	clk    		=> clk,
						rst			=> rst,
						ena 			=> ena
						syn_clr		=> syn_clr,
						max_tick 	=> clk_pintado
						counter		=> counter);
						
	v_mov: ENTITY work.univ_bit_counter
	GENERIC MAP (N					=> 23)
	PORT MAP		(	clk    		=> clk,
						rst			=> rst,
						ena 			=> ena
						syn_clr		=> syn_clr,
						max_tick 	=> clk_mov,
						counter		=> counter);
						
	clk_mov_1 <= clk_mov;
	
	MovimientoJ1:	ENTITY work.MovimientoBarras
	PORT MAP		(	Rst			=> rst,
						Clk			=> clk_mov_1,
						Sube			=>	BotonArribaJ1,
						Baja			=> BotonAbajoJ1,
						Barra 		=> PoscJ1);
						
	PoscJ1Pintar<=NOT(PoscJ1);					
						
	MovimientoJ2:	ENTITY work.MovimientoBarras
	PORT MAP		(	Rst			=> rst,
						Clk			=> clk_mov_1,
						Sube			=>	BotonArribaJ2,
						Baja			=> BotonAbajoJ2,
						Barra 		=> PoscJ2);
						
	PoscJ2Pintar<=NOT(PoscJ2);
	
	MovBolaFcn:	ENTITY work.MovBola
	PORT MAP		(	rst				=> rst,
						DireccionXAnt	=> DireccionXAnt,
						DireccionYAnt  => DireccionYAnt,
						LineaRectaAnt  => LineaRectaAnt,
						PoscJ1			=> PoscJ1,
						PoscJ2 			=> PoscJ2,
						DireccionXNxt  => DireccionXNxt,
						DireccionYNxt  => DireccionYNxt,
						LineaRectaNxt  => LineaRectaNxt,
						clk				=> clk_mov_1,
						PuntoJ1			=> PuntoJ1,
						PuntoJ2			=> PuntoJ2,
						PoscXPintar		=> PoscXPintarBola,
						PoscYPintar 	=> PoscYPintarBola);
						
	DireccionXAnt<=DireccionXNxt;
	DireccionYAnt<=DireccionYNxt;
	LineaRectaAnt<=LineaRectaNxt;
	
GolesJ1:	ENTITY work.Goles
	PORT MAP		(	rst			=> rst,
						Gol			=> PuntoJ1,
						ena			=> '1',
						NumGoles 	=> NumGolesJ1);
						

GolesJ2:	ENTITY work.Goles
	PORT MAP		(	rst			=> rst,
						Gol			=> PuntoJ2,
						ena			=> '1',
						NumGoles 	=> NumGolesJ2);
						
GolesJ1Bcd:	ENTITY work.bin_bcd
	PORT MAP		(	X			=> "0000" & NumGolesJ1,
						Y 	=> NumGolesJ1BCD);
						
GolesJ1Split:	ENTITY work.Divisor
	PORT MAP		(	entrada	=> NumGolesJ1BCD,
						lsb		=> GolesJ1U,
						msb 		=> GolesJ1D);						
						
GolesJ2Bcd:	ENTITY work.bin_bcd
	PORT MAP		(	X			=> "0000" & NumGolesJ2,
						Y 	=> NumGolesJ2BCD);
						
GolesJ2Split:	ENTITY work.Divisor
	PORT MAP		(	entrada	=> NumGolesJ2BCD,
						lsb		=> GolesJ2U,
						msb 		=> GolesJ2D);	
						
						
GolesJ1Usseg:	ENTITY work.bin_to_sseg
	PORT MAP		(	bin	=> GolesJ1U,
						sseg 	=> PuntosJ1U);
						
GolesJ1Dsseg:	ENTITY work.bin_to_sseg
	PORT MAP		(	bin	=> GolesJ1D,
						sseg 	=> PuntosJ1D);
						
GolesJ2Usseg:	ENTITY work.bin_to_sseg
	PORT MAP		(	bin	=> GolesJ2U,
						sseg 	=> PuntosJ2U);
						
GolesJ2Dsseg:	ENTITY work.bin_to_sseg
	PORT MAP		(	bin	=> GolesJ2D,
						sseg 	=> PuntosJ2D);
	
clk_pintado_1 <= clk_pintado;

PoscicionAMatriz:	ENTITY work.Pintado
	PORT MAP		(	Rst	=> rst,
						Clk 	=> clk_pintado_1,
						J1		=> PoscJ1Pintar,
						J2 	=> PoscJ2Pintar,
						PoscXPintarBola	=> PoscXPintarBola,
						PoscYPintarBola 	=> PoscYPintarBola,
						PoscXPintar	=> PoscXPintar,
						PoscYPintar 	=> PoscYPintar);			
			
			
	

END ARCHITECTURE;