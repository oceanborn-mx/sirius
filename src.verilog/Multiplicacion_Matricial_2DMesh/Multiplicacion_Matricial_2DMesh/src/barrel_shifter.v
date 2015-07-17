module Barrel_Shifter (R,S,Y);	 
	input[11:0]		R;	//	Entrada
	input[2:0]		S;	//	Selector
	output[7:0]	Y;	//	Salida
	reg[7:0]		Y;	//	Salida
	
	always @ (R,S)
	begin
		case (S)
			3'h0	: Y = R[ 7:0]; 
			3'h1	: Y = R[ 8:1];
			3'h2	: Y = R[ 9:2];
			3'h3	: Y = R[10:3];
			default : Y = R[11:4];
		endcase
	end
	
endmodule
