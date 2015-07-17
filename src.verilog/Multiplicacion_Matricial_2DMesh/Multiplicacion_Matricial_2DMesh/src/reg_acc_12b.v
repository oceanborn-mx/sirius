module Reg_Acc_12b (
	input			RST,	//	Reset maestro
	input			CLK,	//	Reloj maestro
	input			EN,		//	Habilitacion
	input[11:0]		D,		//	Entrada
	output reg[11:0]	Q		//	Salida
	);	
	
	reg[11:0] Qp, Qn; 
	
	always @ (Qp,EN,D)
	begin : Combinacional 
		if (EN)
			Qn = D;	//	Cargar
		else
			Qn = 0;	//	Borrar
		Q = Qp;
	end
	
	always @ (posedge RST or posedge CLK)
	begin : Secuencial
		if (RST)
			Qp <= 0;
		else
			Qp <= Qn;
	end
	
/*	always @ (posedge RST or posedge CLK)
	begin 
		if (RST)
			Q <= 0;
		else begin 
			if (EN)
				Q <= D;	//	Cargar
			else
				Q <= 0;	//	Borrar
		end
	end		  */
	
endmodule
