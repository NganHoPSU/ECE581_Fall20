//////////////////////////////////////////////////////////////
//TestbenchComparatorAlwaysComb.sv - This is testbench for TestbenchComparatorAlwaysComb modules
//
// Author:	Nguyen Pham ((ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	13-Oct-2020
//
// Description:
// ------------
// This module is use for testing TestbenchComparatorAlwaysComb using exhausted tests
////////////////////////////////////////////////////////////////

module TestbenchComparatorAlwaysComb;

	parameter 				Nbits = 16;						// 16 bits		
	parameter				True = 1;
	parameter				False = 0;
	bit [Nbits-1:0] 		a_in;							// first 16 bits input
	bit [Nbits-1:0]			b_in;							// second 16 bits input
	bit						out;							// 1 bit output
	reg						Error = 0;						// Error variable
	bit						result;							// 1 bit result
		
	 ComparatorAlwaysComb # (Nbits) CAC(.*); 		// Instantiate TestbenchComparatorAlwaysComb module
	
	

	initial
	begin												
		begin
			for (int i = 0; i < 2**Nbits; i++)				// Go through all values of a_in
			begin
				a_in = i;									// Set a_in = i
				for (int j = 0; j < 2**Nbits; j++)			// Go through all values of b_in
				begin
					b_in = j;								// Set b_in = j
					#10
					if (a_in > b_in | b_in > a_in )
						result = False;
					else
						result = True;	
					#10;
					if (out!= result)						// Check the yeld value with expected result
					begin
						Error = Error +1;					// Increase value of error when the result is not correct
						$display ("Error founded,Compare %b with %b, out = %b, result = %b", a_in, b_in, out, result);
					end
					else
					begin
						Error = Error;
						$display("Compare %b with %b, out = %b", a_in, b_in, out);
					end
				end
			end
		end
		if (Error == 0)
		$display("Congratulation, your module correctly");
	end
	


endmodule