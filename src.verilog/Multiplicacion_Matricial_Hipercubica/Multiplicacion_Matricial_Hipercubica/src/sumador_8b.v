module Sumador_8b (
	input[7:0]	A,B,	//	Operandos
	output[7:0]	SUM		//	Suma
	);	 
	
	assign	SUM = A + B;
	
endmodule
