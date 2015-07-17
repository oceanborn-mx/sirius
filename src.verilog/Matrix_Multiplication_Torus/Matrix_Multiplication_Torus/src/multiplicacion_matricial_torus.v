module Multiplicacion_Matricial_Torus (
	input			RST,		//	Reset maestro
	input			CLK,		//	Reloj maestro
	input			STM,		//	Iniciar multiplicacion
	input[3:0]		A00,A01,	//	Coef Matriz A
	input[3:0]		A10,A11,   
	input[3:0]		B00,B01,	//	Coef Matriz B
	input[3:0]		B10,B11,
	output[7:0]		C00,C01,//	Salida
	output[7:0]		C10,C11,
	output			EOM			//	Fin de multiplicacion
	);	
	
	wire		ENpH;	//	Habilitaciones Rp Alto 
	wire		ENpL;	//	Habilitaciones Rp Bajo
	wire		ENa;	//	Habilitaciones Rb
	wire		ENr;	//	Habilitaciones Rc
	wire		SEL;	//	Selectores Mux
	
	Arreglo_Torus	U1(RST,CLK,A00,A01,A10,A11,B00,B01,B10,B11,
				   	   ENpH,ENpL,ENa,ENr,SEL,C00,C01,C10,C11);
	FSM_Ctrol		U2(RST,CLK,STM,ENpH,ENpL,ENa,ENr,SEL,EOM);
	
endmodule
