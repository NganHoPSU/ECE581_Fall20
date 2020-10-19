///////////////////////////////////////////////////
// tb_problem5a.sv - Test bench of 6-bit Binary-to-Gray code converter
// Name: Nguyen Pham (ngpham@pdx.edu)
//		 Ngan Ho (hongan@pdx.edu)
// Date: Oct 11, 2020
///////////////////////////////////////////////////
module tb_problem5a (b_in ,g_out);	
parameter NUM = 6;				// 6-bits
input logic [(NUM -1):0] b_in;	// 6-bits input
output wire [(NUM -1):0] g_out;	// 6-bits output

timeunit 1ns/1ns;   
// Instantiate the unit
	problem5a #(NUM) b2g(.*);
   
//monitor
initial begin
    $monitor($time, "\t\t Binary: %b \t\t Gray: %b", b_in, g_out);
end
    // Test common combinations
initial begin
    $display("Test for problem 5a:\n");
	// stimulus 000000 -> 111111
	for (int i = 0; i< 2**NUM; i++) begin: loop
      b_in <= i; 
	  #1;   
	end: loop
   #5 $stop;
end
endmodule: tb_problem5a