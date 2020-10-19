//////////////////////////////////////////////////////////////
//ShiftLogicalLeft.sv
//
// Author:	Nguyen Pham (ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	11-Oct-2020
//
// Description:
// ------------
// This module is use for a circuit whose 32-bit output is formed by shifting its 32-bits input three positions
// to the left and filling the vacant positions with 0(shift logical left)
// There is 1 32 bits input (In) and 1 32 bits output (Out)
////////////////////////////////////////////////////////////////


module ShiftLogicalLeft
#(
	parameter Nbits = 32
)
(
	input logic signed 		[Nbits-1:0] In,				// 32 bits Input
	output logic signed 	[Nbits-1:0] Out				// 32 bits Output
);
	assign Out = In << 3;							// Using Shift Logical Left to get the value for Output


endmodule