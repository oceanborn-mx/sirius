module Hipercubo (
	input			RST,		//	Reset maestro
	input			CLK,		//	Reloj maestro
	input[3:0]		A00,A01,	//	Coef Matriz A
	input[3:0]		A10,A11,   
	input[3:0]		B00,B01,	//	Coef Matriz B
	input[3:0]		B10,B11,
	input[7:0]		ENa,		//	Habilitaciones Ra 
	input[7:0]		ENb,		//	Habilitaciones Rb
	input[7:0]		ENc,		//	Habilitaciones Rc
	input[7:0]		SEL,		//	Selectores Mux
	output[7:0]		MTX00,MTX01,//	Salida
	output[7:0]		MTX10,MTX11
	);	  
	
	wire[3:0]	Ra000,Ra001,Ra010,Ra011;
	wire[3:0]	Ra100,Ra101,Ra110,Ra111;
	wire[3:0]	Rb000,Rb001,Rb010,Rb011;
	wire[3:0]	Rb100,Rb101,Rb110,Rb111;
	wire[7:0]	Rc000,Rc001,Rc010,Rc011;
	wire[7:0]	Rc100,Rc101,Rc110,Rc111;
	wire[3:0]	Ya001,Ya011,Ya100,Ya110; 
	wire[3:0]	Yb010,Yb011,Yb100,Yb101;
	wire[7:0]	M000,M001,M010,M011;
	wire[7:0]	M100,M101,M110,M111;
	
	Registro_4b			RA000(RST,CLK,ENa[0],A00,Ra000); 
	Registro_4b			RB000(RST,CLK,ENb[0],B00,Rb000);	
	Multiplicador_4x4	M1(Ra000,Rb000,M000);
	Registro_8b			RC000(RST,CLK,ENc[0],M000,Rc000);	
	
	Mux4_2_1			Mux1(A01,Ra000,SEL[0],Ya001);
	Registro_4b			RA001(RST,CLK,ENa[1],Ya001,Ra001); 
	Registro_4b			RB001(RST,CLK,ENb[1],B01,Rb001);
	Multiplicador_4x4	M2(Ra001,Rb001,M001); 
	Registro_8b			RC001(RST,CLK,ENc[1],M001,Rc001);
	
	Registro_4b			RA010(RST,CLK,ENa[2],A10,Ra010); 
	Mux4_2_1			Mux2(B10,Rb000,SEL[1],Yb010);
	Registro_4b			RB010(RST,CLK,ENb[2],Yb010,Rb010); 
	Multiplicador_4x4	M3(Ra010,Rb010,M010);
	Registro_8b			RC010(RST,CLK,ENc[2],M010,Rc010);
	
	Mux4_2_1			Mux3(A11,Ra010,SEL[2],Ya011);
	Registro_4b			RA011(RST,CLK,ENa[3],Ya011,Ra011); 
	Mux4_2_1			Mux4(B11,Rb001,SEL[3],Yb011);
	Registro_4b			RB011(RST,CLK,ENb[3],Yb011,Rb011);
	Multiplicador_4x4	M4(Ra011,Rb011,M011); 
	Registro_8b			RC011(RST,CLK,ENc[3],M011,Rc011);
	
	Mux4_2_1			Mux5(Ra000,Ra101,SEL[4],Ya100);
	Registro_4b			RA100(RST,CLK,ENa[4],Ya100,Ra100);
	Mux4_2_1			Mux6(Rb000,Rb110,SEL[5],Yb100);
	Registro_4b			RB100(RST,CLK,ENb[4],Yb100,Rb100); 
	Multiplicador_4x4	M5(Ra100,Rb100,M100);
	Registro_8b			RC100(RST,CLK,ENc[4],M100,Rc100);
	
	Registro_4b			RA101(RST,CLK,ENa[5],Ra001,Ra101);
	Mux4_2_1			Mux7(Rb001,Rb111,SEL[6],Yb101);
	Registro_4b			RB101(RST,CLK,ENb[5],Yb101,Rb101);
	Multiplicador_4x4	M6(Ra101,Rb101,M101); 
	Registro_8b			RC101(RST,CLK,ENc[5],M101,Rc101);
	
	Mux4_2_1			Mux8(Ra010,Ra111,SEL[7],Ya110);
	Registro_4b			RA110(RST,CLK,ENa[6],Ya110,Ra110); 
	Registro_4b			RB110(RST,CLK,ENb[6],Rb010,Rb110); 
	Multiplicador_4x4	M7(Ra110,Rb110,M110);
	Registro_8b			RC110(RST,CLK,ENc[6],M110,Rc110);
	
	Registro_4b			RA111(RST,CLK,ENa[7],Ra011,Ra111); 
	Registro_4b			RB111(RST,CLK,ENb[7],Rb011,Rb111);	
	Multiplicador_4x4	M8(Ra111,Rb111,M111); 
	Registro_8b			RC111(RST,CLK,ENc[7],M111,Rc111);
	
	Sumador_8b			SUM1(Rc000,Rc100,MTX00);
	Sumador_8b			SUM2(Rc001,Rc101,MTX01);	 
	Sumador_8b			SUM3(Rc010,Rc110,MTX10);
	Sumador_8b			SUM4(Rc011,Rc111,MTX11);
	
endmodule
