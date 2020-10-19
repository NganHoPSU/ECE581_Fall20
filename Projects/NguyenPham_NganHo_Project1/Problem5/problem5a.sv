/////////////////////////////////////////////////////////////
// problem5a.sv - 6-bit Binary-to-Gray code converter 
//			in the dataflow model (continuous assign)
// Name: Nguyen Pham (ngpham@pdx.edu)
//		 Ngan Ho (hongan@pdx.edu)
// Date: Oct 12, 2020
// Description:
// Design a module that convert 6 bit Binary code to Gray code
//////////////////////////////////////////////////////////////

module problem5a
#(parameter NUM = 6)	//6-bits
(
	input logic [5:0] b_in, //binary input
    output wire [5:0] g_out	//gray code output
);

timeunit 1ns/1ns;

genvar i;
// Way 1
assign g_out[NUM-1] = b_in[NUM-1];

//Iteration
for(i = NUM-2; i >= 0; i--) begin: loop
	assign g_out[i] = b_in[i+1] ^ b_in[i];
end: loop

// Way 2
/*
assign g_out[5] = b_in[5];
assign g_out[4] = b_in[5] ^ b_in[4];
assign g_out[3] = b_in[4] ^ b_in[3];
assign g_out[2] = b_in[3] ^ b_in[2];
assign g_out[1] = b_in[2] ^ b_in[1];
assign g_out[0] = b_in[1] ^ b_in[0];
*/
endmodule: problem5a