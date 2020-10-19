//////////////////////////////////////////////////////////////
//CarryLookAheadAdderContinuousAssigment.sv
//
// Author:	Nguyen Pham (ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	11-Oct-2020
//
// Description:
// ------------
// This module is use for a 16-bit carrt look ahead adder in the dataflow model (continuous assignments)
// There are 2 16 bits inputs (a_in and b_in) and 1 bit carry_in (Cin)
// There are 1 16 bits output (sum) and 1 bit carry_out(Cout)
////////////////////////////////////////////////////////////////

module CarryLookAheadAdderContinuousAssigment
#(
parameter Nbits = 16														// 16 bits
)
(
	input logic[Nbits-1:0] a_in,											// first 16 bits input
	input logic[Nbits-1:0] b_in,											// second 16 bits input
	input bit Cin,															// 1 bit carry in input
	output logic [Nbits-1:0] sum,											// 16 bits sum
	output bit Cout															// 1 bit Cout
);

	logic [Nbits:0] C;														// internal  16 bits carry value
	logic [Nbits-1:0] S;													// internal 16 bits sum 

	assign C[0] = Cin;														// Set the bit 0 equals Carry in

	genvar i;
	generate
		for (i = 0; i < Nbits; i++)											// Using generate and for loop go through all bits of 2 inputs
		begin
			assign S[i] = a_in[i] ^ b_in[i] ^ C[i];							// Set S[i] = a_in[i] XOR b_in[i] XOR C[i]
			assign C[i+1] = (a_in[i]& b_in[i]) | ((a_in[i] ^ b_in[i])& C[i]); // Set C[i+1] = (a_in[i] AND b_in[i]) OR (a_in[i] XOR b_in[i] and C[i])
		end
	endgenerate
	
	assign sum = S;															// Set sum = S			
	assign Cout = C[Nbits];													// Set Cout equals MSB of C
 

endmodule