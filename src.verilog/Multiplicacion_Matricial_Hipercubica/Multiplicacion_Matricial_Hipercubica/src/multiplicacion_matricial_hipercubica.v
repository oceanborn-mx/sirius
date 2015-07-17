module Multiplicacion_Matricial_Hipercubica (
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
	
	wire[7:0]		ENa;		//	Habilitaciones Ra 
	wire[7:0]		ENb;		//	Habilitaciones Rb
	wire[7:0]		ENc;		//	Habilitaciones Rc
	wire[7:0]		SEL;		//	Selectores Mux
	
	Hipercubo	U1(RST,CLK,A00,A01,A10,A11,B00,B01,B10,B11,
				   ENa,ENb,ENc,SEL,C00,C01,C10,C11);
	FSM_Ctrol	U2(RST,CLK,STM,ENa,ENb,ENc,SEL,EOM);
	
endmodule
