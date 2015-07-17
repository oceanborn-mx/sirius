module MAC ( 
	input			RST,	//	Reset maestro
	input			CLK,	//	Reloj maestro
	input			ENa,	//	Habilitaciones Ra
	input			ENr,	//	Habilitaciones Rr
	input[3:0]		A,		//	Coef Matriz A
	input[3:0]		B,		//	Coef Matriz B 
	output[7:0]		MTX		//	Salida
	);	
	
	wire[2:0]	BSEL;
	wire[7:0]	M;
	wire[11:0]	M_S,SUM,ACC,RES;
	
	//	Extension de signo
	assign M_S[11:8] = {4{M[7]}};
	assign M_S[ 7:0] = M;
	
	Multiplicador_4x4	M3(A,B,M);
	Sumador_12b			S3(ACC,M_S,SUM);
	Reg_Acc_12b			Ra10(RST,CLK,ENa,SUM,ACC);
	Reg_Res_12b			Rr10(RST,CLK,ENr,SUM,RES);
	Barrel_Shifter		BS(RES,BSEL,MTX);
	
	assign BSEL = 3'h0;

endmodule
