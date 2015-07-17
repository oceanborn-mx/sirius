module Multiplicacion_Matricial_2DMesh (
	input			RST,		//	Reset maestro
	input			CLK,		//	Reloj maestro 
	input			STM,		//	Iniciar multiplicacion
	input[3:0]		A00,A10,	//	Coef Matriz A
	input[3:0]		B00,B01,	//	Coef Matriz B
	output[7:0]		MTX00,MTX01,//	Salida
	output[7:0]		MTX10,MTX11,
	output			EOM			//	Fin de multiplicacion
	); 	
	
	wire		ENp,ENq;	//	Habilitaciones Rp 
	wire[3:0]	ENa;		//	Habilitaciones Ra
	wire[3:0]	ENr;		//	Habilitaciones Rr
	
	Arreglo_2DMesh	U1(RST,CLK,A00,A10,B00,B01,ENp,ENq,ENa,
					   ENr,MTX00,MTX01,MTX10,MTX11);
	FSM_Ctrol		U2(RST,CLK,STM,ENp,ENq,ENa,ENr,EOM);
	
endmodule
