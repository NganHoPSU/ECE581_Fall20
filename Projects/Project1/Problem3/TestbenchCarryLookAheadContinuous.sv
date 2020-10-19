//////////////////////////////////////////////////////////////
//TestbenchCarryLookAheadContinuous.sv - This is testbench for CarryLookAheadAdderContinousAssigment modules
//
// Author:	Nguyen Pham ((ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	11-Oct-2020
//
// Description:
// ------------
// This module is use for testing CarryLookAheadAdderContinuousAssigment using exhaust tests
////////////////////////////////////////////////////////////////

module TestbenchCarryLookAheadContinuous;

	parameter 				Nbits = 16;						// 16 bits		
	bit [Nbits-1:0] 		a_in;							// first 16 bits input
	bit [Nbits-1:0]			b_in;							// second 16 bits input
	bit						Cin;							// 1 bit carry in input
	bit [Nbits-1:0]			sum;							// 16 bits sum
	bit						Cout;							// 1 bit Cout
	wire [Nbits-1:0] 		C;								// internal 16 bits carry value
	wire [Nbits-1:0] 		S;								// internal 16 bits sum 							
	integer Error;											// Error variable
	reg [Nbits:0] result;									//16 bits results use for compairing, checking the correctness of module
	
	CarryLookAheadAdderContinuousAssigment # (Nbits) CLAACA (.*); // Instantiate CarryLookAheadAdderContinuousAssigment module
	
	initial
	begin
		Cin = 0;												// Set initial value for Cin
		Error = 0;												// Set initial value for Error = 0
		repeat (2)
		begin
			for (int i = 0; i < 2**Nbits; i++)					// Go through all values of a_in
			begin
				a_in = i;										// Set a_in = i
				for (int j = 0; j < 2**Nbits; j++)				// Go through all values of b_in
				begin
					b_in = j;									// Set b_in = j
					result = a_in + b_in + Cin;					// Set result = a_in + b_in + Cin
					#50;
					if ({Cout,sum} != result)					// Check the yeld value with expected result
					begin
						Error = Error +1;						// Increase value of error when the result is not correct
						$display ("Error founded, adding %b + %b + %b, we expeced Cout is %b, sum is %b, however we got Cout is %b, sum is %b", a_in, b_in,Cin, result[Nbits], result[Nbits-1:0], Cout, sum);
					end
					else
					begin
					$display("Adding %b + %b + %b, Sum = %b, Cout = %b", a_in, b_in, Cin, sum, Cout);
					end
				end
			end
			Cin = !Cin;										// Getting inverse value of Cin for second run
		end
		if (Error == 0)
		$display("Congratulation, your module correctly");
	end
	


endmodule