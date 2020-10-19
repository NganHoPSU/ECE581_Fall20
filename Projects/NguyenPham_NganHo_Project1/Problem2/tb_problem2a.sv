///////////////////////////////////////////////////
// tb_problem2a.sv - Test bench of 2^n to n priority encoder
//                              in continous assignment
// Name: Nguyen Pham (ngpham@pdx.edu)
//		 Ngan Ho (hongan@pdx.edu)
// Date: Oct 11, 2020
///////////////////////////////////////////////////
module tb_problem2a (sigIn, sigOut);
  
timeunit 1ns/1ns;

parameter NUM_BITS = 3;	//4-bits
parameter CASE = 10;	// 10 Random cases
input logic [(2**NUM_BITS)-1:0] sigIn;
output logic [(NUM_BITS-1):0] sigOut;

// Initiate instances
problem2a #(NUM_BITS) p_2a(sigIn, sigOut);
logic [(2**NUM_BITS)-1:0]temp = 4'bxz01;	//temp array

initial begin
    $monitor($time, "\t input: %b \t output: %b", sigIn, sigOut);

    // Test 01: test common combinations
    $display("Test for problem 2b:\n\n");
	//time 0, input is 0
	sigIn = {NUM_BITS{1'b0}};
    #5;
	// next time unit
    for (int k = 0; k < 2**NUM_BITS; k++) begin
        sigIn = {NUM_BITS{1'b0}};
        sigIn[k] = 1'b1;
        #5;
	end	
	
	// Test random cases
	 $display("Test random cases:");
    for (int i = 0; i < CASE; i++) begin: i_loop
        for (int j = 0; j < 2**NUM_BITS; j++) begin: j_loop
            sigIn[j] = temp[$urandom() % 4];
        end: j_loop
        #5;	
    end: i_loop
	#5 $stop;
end
endmodule: tb_problem2a