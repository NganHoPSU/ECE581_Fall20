//////////////////////////////////////////////////////////////
//ComparatorAlwaysComb.sv
//
// Author:	Nguyen Pham (ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	13-Oct-2020
//
// Description:
// ------------
// This module is use for a 16-bit comparator determines if a 16 bit vector [15:0]
// is equal to 16 bit vector b[15:0] in the algorithmic model
// There are two 16-bit inputs and 1 bit output
// Output equals to 1 (True) when 2 inputs are equal, otherwise output equal zero
////////////////////////////////////////////////////////////////

module ComparatorAlwaysComb
#(
parameter Nbits = 16						// 16 bits
)
(
	input logic[Nbits-1:0] a_in,			// first 16 bits input
	input logic[Nbits-1:0] b_in,			// second 16 bits input
	output logic out						// 1 bit output
);

	localparam True = 1;					// Set True equals 1
	localparam False = 0;					// Set False equals 0
	
	
	always_comb
	begin
		for (int i = 0; i < Nbits; i++)		// Go through all bits of a_in and b_in
		begin
			if (a_in[i] != b_in[i])			// When bit a_in[i] not equal b_in[i]
			begin
				out = False;				// Set output equals False and exit from for loop
				break;
			end
			else
				out = True;					// Else set out equals True and continue until the last bit
		end
	end


endmodule