module Mux4_2_1 (
	input[3:0]	I0,I1,	//	Entradas
	input		SEL,	//	Selector
	output[3:0]	Y		//	Salida
	); 
	
	assign	Y = SEL ? I1 : I0;
	
endmodule
