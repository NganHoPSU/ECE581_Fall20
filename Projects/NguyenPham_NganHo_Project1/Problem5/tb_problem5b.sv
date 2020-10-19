///////////////////////////////////////////////////
// tb_problem5b.sv - Test bench of 6-bit Gray-to-Binary code converter
// Name: Nguyen Pham (ngpham@pdx.edu)
//		 Ngan Ho (hongan@pdx.edu)
// Date: Oct 11, 2020
///////////////////////////////////////////////////
module tb_problem5b(g_in, b_out);
parameter NUM = 6;		// 6-bits
input logic [(NUM -1):0] g_in;
output logic [(NUM-1):0] b_out;

timeunit 1ns/1ns;

// Initiate unit
problem5b #(NUM) g2b (.*);

// monitor
initial begin: monitor
	$monitor($time, "\t Gray: %b \t\t Binary: %b", g_in, b_out);
end: monitor

// Test common combinations
initial begin
	$display("Test Gray code to Binary: \n");
	// stimulus 000000 -> 111111
	for(int i = 0; i < 2**NUM; i++) begin:loop
		g_in <= i;
	#1;
	end:loop
	#5 $stop;
end
endmodule: tb_problem5b

