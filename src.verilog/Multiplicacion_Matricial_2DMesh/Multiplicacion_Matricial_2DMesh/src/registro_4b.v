module Registro_4b (
	input			RST,	//	Reset maestro
	input			CLK,	//	Reloj maestro
	input			EN,		//	Habilitacion
	input[3:0]		D,		//	Entrada
	output reg[3:0]	Q		//	Salida
	);
	
	reg[3:0] Qp, Qn; 
	
	always @ (Qp,EN,D)
	begin : Combinacional 
		if (EN)
			Qn = D;		//	Cargar
		else
			Qn = Qp;	//	Sostener
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
				Q <= Q;	//	Sostener
		end
	end		 */
	
endmodule
