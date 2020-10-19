///////////////////////////////////////////////////
// problem2b.sv - 2^n to n priority encoder
// Name: Nguyen Pham (ngpham@pdx.edu)
//		 Ngan Ho (hongan@pdx.edu)
// Date: Oct 11, 2020
// Description:
// Design a model of 2^n to n priority encoder 
// in the algorithm model (always_comb)
///////////////////////////////////////////////////

module problem2b
#(
    parameter N = 2
)(
    input [2**N-1 : 0] sigIn,
    output reg [N-1 : 0] sigOut
);

timeunit 1ns/1ns;

always_comb begin: combination
		// default output value when all input bits are 0
		sigOut = {N{1'bx}};
		// traverse from highest-priority bit to the lowest one
		for (int i = (2**N) - 1; i > -1; i--) begin: loop
			// x or z signal -> output is don't care
			if(sigIn[i] === 1'bx || sigIn[i] === 1'bz) begin 
				sigOut = {N{1'bx}};
				break;
			end
			// priority bit is 1, output is number of bit
			if(sigIn[i]) begin
				sigOut = i;
				break;
			end
		end: loop
end: combination
endmodule: problem2b