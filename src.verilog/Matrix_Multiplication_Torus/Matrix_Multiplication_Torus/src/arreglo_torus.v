module Arreglo_Torus (
	input			RST,		//	Reset maestro
	input			CLK,		//	Reloj maestro
	input[3:0]		A00,A01,	//	Coef Matriz A
	input[3:0]		A10,A11,   
	input[3:0]		B00,B01,	//	Coef Matriz B
	input[3:0]		B10,B11,
	input			ENpH,		//	Habilitaciones Rp Alto 
	input			ENpL,		//	Habilitaciones Rp Bajo
	input			ENa,		//	Habilitaciones Ra 
	input			ENr,		//	Habilitaciones Rb
	input			SEL,		//	Selectores Mux
	output[7:0]		MTX00,MTX01,//	Salida
	output[7:0]		MTX10,MTX11
	); 
	
	wire[3:0]	Aq00,Aq01,Aq10,Aq11;
	wire[3:0]	RaQ00,RaQ01,RaQ10,RaQ11;
	wire[3:0]	Ya00,Ya01,Ya10,Ya11;  
	wire[3:0]	Bq00,Bq01,Bq10,Bq11;
	wire[3:0]	RbQ00,RbQ01,RbQ10,RbQ11;
	wire[3:0]	Yb00,Yb01,Yb10,Yb11;
	
	Registro_4b		Ra00(RST,CLK,ENpH,A01,Aq01);
	Registro_4b		RaM00(RST,CLK,ENpL,Aq00,RaQ01);
	Mux4_2_1		MuxA00(Aq01,RaQ01,SEL,Ya00);
	Registro_4b		Rb00(RST,CLK,ENpH,B10,Bq10);
	Registro_4b		RbM00(RST,CLK,ENpL,Bq00,RbQ10);
	Mux4_2_1		MuxB00(Bq10,RbQ10,SEL,Yb00);
	MAC				MAC00(RST,CLK,ENa,ENr,Ya00,Yb00,MTX00);	
	
	Registro_4b		Ra01(RST,CLK,ENpH,A10,Aq10);
	Registro_4b		RaM01(RST,CLK,ENpL,Aq11,RaQ10);
	Mux4_2_1		MuxA01(Aq10,RaQ10,SEL,Ya01);
	Registro_4b		Rb01(RST,CLK,ENpH,B00,Bq00);
	Registro_4b		RbM01(RST,CLK,ENpL,Bq10,RbQ00);
	Mux4_2_1		MuxB01(Bq00,RbQ00,SEL,Yb01);
	MAC				MAC01(RST,CLK,ENa,ENr,Ya01,Yb01,MTX10);
	
	Registro_4b		Ra10(RST,CLK,ENpH,A00,Aq00);
	Registro_4b		RaM10(RST,CLK,ENpL,Aq01,RaQ00);
	Mux4_2_1		MuxA10(Aq00,RaQ00,SEL,Ya10);
	Registro_4b		Rb10(RST,CLK,ENpH,B01,Bq01);
	Registro_4b		RbM10(RST,CLK,ENpL,Bq11,RbQ01);
	Mux4_2_1		MuxB10(Bq01,RbQ01,SEL,Yb10);
	MAC				MAC10(RST,CLK,ENa,ENr,Ya10,Yb10,MTX01);
	
	Registro_4b		Ra11(RST,CLK,ENpH,A11,Aq11);
	Registro_4b		RaM11(RST,CLK,ENpL,Aq10,RaQ11);
	Mux4_2_1		MuxA11(Aq11,RaQ11,SEL,Ya11);
	Registro_4b		Rb11(RST,CLK,ENpH,B11,Bq11);
	Registro_4b		RbM11(RST,CLK,ENpL,Bq01,RbQ11);
	Mux4_2_1		MuxB11(Bq11,RbQ11,SEL,Yb11);
	MAC				MAC11(RST,CLK,ENa,ENr,Ya11,Yb11,MTX11);
	
endmodule
