
///////////////////////////////////////////////////
// problem2a.sv - 2^n to n priority encoder
// Name: Nguyen Pham (ngpham@pdx.edu)
//		 Ngan Ho (hongan@pdx.edu)
// Date: Oct 11, 2020
// Description:
// Design a model of 2^n to n priority encoder 
// in the dataflow model (continuous assignments)
///////////////////////////////////////////////////
module problem2a
#(parameter N = 2)					// 2-bit
(input logic [(2**N)-1:0] sigIn,	// 4-bit input signal
 output logic [(N-1):0] sigOut		// 2-bit output signal
 );
 
// Initiate intances
timeunit 1ns/1ns;
logic [(2**N):0][(N-1):0] temp;	// temporary variable
 
 // if all inputs are 0 -> output is 'x'
 assign temp[0] = {N{1'bx}};	
 // Iteration
 for (genvar i = (2**N) - 1; i >= 0 ; i--) begin: loop
	// If high bit is x or z -> ouput is x, 
	// and if high bit is 1-> output is an equivalent binary code
	assign temp[i+1] = (sigIn[i]===1'bx || sigIn[i]===1'bz) ? 
							{N{1'bx}}: (sigIn[i])? 
							 i : temp[i];
 end: loop
 assign sigOut = temp[2**N];	
 
endmodule: problem2a