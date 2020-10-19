//////////////////////////////////////////////////////////////
//ShiftArithmeticRight.sv
//
// Author:	Nguyen Pham (ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	11-Oct-2020
//
// Description:
// ------------
// This module is use for a circuit whose 32-bit output is formed by shifting its 32-bits input three positions
// to the right and filling the vacant positions with the bit that was in the MSB before the shift occurred (shift arithmetic right)
// There is 1 32 bits input (In) and 1 32 bits output (Out)
////////////////////////////////////////////////////////////////

module ShiftArithmeticRight
#(
	parameter Nbits = 32
)
(
	input logic signed 		[Nbits-1:0] In,				// 32 bits Input
	output logic signed 	[Nbits-1:0] Out				// 32 bits Output
);
	assign Out = In >>> 3;							// Using Shift Arithmetic Right to get the value for Output


endmodule