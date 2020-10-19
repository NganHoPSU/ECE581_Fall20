//////////////////////////////////////////////////////////////
// problem5b.sv - 6-bit Gray-to-Binary code converter 
//			in the algorithmic model (always_comb).
// Name: Nguyen Pham (ngpham@pdx.edu)
//		 Ngan Ho (hongan@pdx.edu)
// Date: Oct 12, 2020
// Description:
// Design a module that convert 6 bit Gray code to Binary code
//////////////////////////////////////////////////////////////
module problem5b
#(parameter NUM = 6)	//6-bits
(input logic [(NUM-1):0] g_in,	// 6-bits input
output logic [(NUM-1):0] b_out	// 6-bits output
);

timeunit 1ns/1ns;

// Initiate instances
always_comb begin: combination
	b_out[NUM-1] = g_in[NUM-1];
	//Iteration
	for(int i = NUM-2; i >= 0; i--) begin: loop
		b_out[i] = b_out[i+1] ^ g_in[i];
	end: loop
end: combination
endmodule: problem5b