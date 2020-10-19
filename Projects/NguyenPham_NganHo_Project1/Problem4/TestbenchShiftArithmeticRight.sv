//////////////////////////////////////////////////////////////
//TestbenchShiftArithmeticRight.sv- This is testbench for ShiftArithmeticRight
//
// Author:	Nguyen Pham ((ngpham@pdx.edu)
//			Ngan Ho (hongan@pdx.edu)
// Date:	11-Oct-2020
//
// Description:
// ------------
// This module is use for testing  the ShiftArithmeticRight module using exhaust tests
////////////////////////////////////////////////////////////////

module TestbenchShiftArithmeticRight;

	parameter 					Nbits = 32;			// 32 bits			
	bit signed [Nbits-1:0] 		In;					// 32 bits input
	bit signed [Nbits-1:0] 		Out;				// 32 bits output
	integer 					Error;				// Error variable
		
	ShiftArithmeticRight # (Nbits) SAR(.*);			// Instantiate ShiftArithmeticRight module
	
	initial 
	Error = 0;										// Set initial value for zero
	
	initial 
	begin
	for (int i = 0; i < 2**Nbits; i++)				// using for loop to go through all input values
	begin
		In = i;										// Set input equals value of i
		#5;
		$display ("In = %b, Out = %b", In, Out);
		#5;
		if (Out != (In >>>3))						// Seft checking
		begin
			Error = Error + 1;						// Increasing error value
			$display ("Error found, In = %b with expected result = %b, however Out = %b", In, In >>> 3, Out);
		end
		else
		begin
			Error = Error;
		end
	end
	if (Error == 0)
		$display ("Good job, no error found");
	else
		$display ("Sorry, we found %d errors in your module", Error);
	end
		
endmodule
	
	
	
	