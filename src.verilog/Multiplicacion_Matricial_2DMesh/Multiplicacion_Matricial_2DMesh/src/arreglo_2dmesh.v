module Arreglo_2DMesh (
	input			RST,		//	Reset maestro
	input			CLK,		//	Reloj maestro
	input[3:0]		A00,A10,	//	Coef Matriz A
	input[3:0]		B00,B01,	//	Coef Matriz B
	input			ENp,		//	Habilitaciones Rp 
	input			ENq,		//	Habilitaciones Rp 11
	input[3:0]		ENa,		//	Habilitaciones Ra
	input[3:0]		ENr,		//	Habilitaciones Rr
	output[7:0]		MTX00,MTX01,//	Salida
	output[7:0]		MTX10,MTX11
	);	 
	
	wire[3:0]	Ar01,Ar10,Ar11;	 
	wire[3:0]	Br01,Br10,Br11;
	
	//	Coef OO	
	MAC				MAC00(RST,CLK,ENa[0],ENr[0],A00,B00,MTX00);
	
	//	Coef 01
	Registro_4b		RpA01(RST,CLK,ENp,A00,Ar01);
	Registro_4b		RpB01(RST,CLK,ENp,B01,Br01);
	MAC				MAC01(RST,CLK,ENa[1],ENr[1],Ar01,Br01,MTX01);
	
	//	Coef 10
	Registro_4b		RpA10(RST,CLK,ENp,A10,Ar10);
	Registro_4b		RpB10(RST,CLK,ENp,B00,Br10);  
	MAC				MAC10(RST,CLK,ENa[2],ENr[2],Ar10,Br10,MTX10);
	
	//	Coef 11
	Registro_4b		RpA11(RST,CLK,ENq,Ar10,Ar11);
	Registro_4b		RpB11(RST,CLK,ENq,Br01,Br11);
	MAC				MAC11(RST,CLK,ENa[3],ENr[3],Ar11,Br11,MTX11);
	
endmodule
