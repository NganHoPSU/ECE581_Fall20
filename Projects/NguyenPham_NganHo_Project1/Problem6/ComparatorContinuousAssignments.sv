//////////////////////////////////////////////////////////////
//ComparatorContinuousAssignments.sv
//
// Author:	Nguyen Pham (ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	13-Oct-2020
//
// Description:
// ------------
// This module is use for a 16-bit comparator determines if a 16 bit vector [15:0]
// is equal to 16 bit vector b[15:0] in dataflow model (continuous assignments)
// There are two 16-bit inputs and 1 bit output
// Output equals to 1 (True) when 2 inputs are equal, otherwise output equal zero
////////////////////////////////////////////////////////////////

module ComparatorContinuousAssignments
#(
parameter Nbits = 16						// 16 bits
)
(
	input logic[Nbits-1:0] a_in,			// first 16 bits input
	input logic[Nbits-1:0] b_in,			// second 16 bits input
	output logic out						// 1 bit output
);

	logic [Nbits:0] [1:0] temp;				// temporary array to hold value for output
	localparam True = 1;				
	localparam False = 0;
	
	genvar i;
	generate
		for (i = 0; i < Nbits; i++)			// For loop go through all bits of a_in and b_in
		begin
			assign temp [i] = ((a_in[i] != b_in[i]) ? False :temp[i+1]);	// When a_in[i] not equal value b_in[i] result will be false, 																				// otherwise, set temp[i] = temp[i+1] to check next bit
		end
	endgenerate
	assign temp[Nbits] = True;				// Assign the last array in temp equals True since we already checked all bits and they are equal 
	assign out = temp[0];					// Assign out = first array in temp as the condition for checking and getting value of out

endmodule