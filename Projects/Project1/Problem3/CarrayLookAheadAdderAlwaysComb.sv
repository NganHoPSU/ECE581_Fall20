//////////////////////////////////////////////////////////////
//CarryLookAheadAdderAlwaysComb.sv
//
// Author:	Nguyen Pham (ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	11-Oct-2020
//
// Description:
// ------------
// This module is use for a 16-bit carrt look ahead adder in the algorithmic model (always_comb)
// There are 2 16 bits inputs (a_in and b_in) and 1 bit carry_in (Cin)
// There are 1 16 bits output (sum) and 1 bit carry_out(Cout)
// Call G is a carry generate which is dependent upon current stage's ability to generate a carry
// Call P is a carry propagate which is dependent upon current (and prior) stage's ability to propagate carry
////////////////////////////////////////////////////////////////

module CarryLookAheadAdderAlwaysComb
#(
parameter Nbits = 16						// 16 bits
)
(
	input logic[Nbits-1:0] a_in,			// first 16 bits input
	input logic[Nbits-1:0] b_in,			// second 16 bits input
	input bit Cin,							// 1 bit carry in input
	output logic [Nbits-1:0] sum,			// 16 bits sum
	output bit Cout							// 1 bit Cout
);

	logic [Nbits:0] C;						// internal  16 bits carry value
	logic[Nbits-1:0] G;						// internal 16 bits  carry generate
	logic [Nbits-1:0] P;					// internal 16 bits carry propagate
	logic [Nbits-1:0] S;					// internal 16 bits sum 

	always_comb 
		begin
			C[0] = Cin;						// Set the bit 0 equals Carry in
			P = 'b0;						// Set 16 bits carry generate equals zero for preventing latch
			G = 'b0;						// Set 16 bits carry propagate equals zero for preventing latch
			S = 'b0;						// Set internal sum equals zero for preventing latch
			sum = 'b0;						// Set sum equals zero for preventing latch
			Cout = 0;						// Set Cout equals zero
			for (int i = 0; i < Nbits; i++)	// Go through all bits of 2 inputs
			begin
				P[i] = a_in[i] ^ b_in[i];	// Pi = ai XOR bi
				G[i] = a_in[i] & b_in[i];	// Gi = ai AND bi
				S[i] = P[i] ^ C[i];			// Si = pi XOR cin_i
				C[i+1] = G[i] | (C[i] & P[i]); //C[i+1] = Gi OR (C[i] AND P[i]
			
			end
		sum = S;								// Set sum = S
		Cout = C[Nbits];						// Set Cout equals MSB of C
	end

endmodule