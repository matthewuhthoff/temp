`timescale 1ns / 10ps
module and_tb;

	reg [31:0] input_a;
	wire [31:0] not_result;
	
	not_32 not_instance(input_a, not_result);
	
	initial
		begin
			input_a <= 2;
			
			#200
			input_a <= 5;
	end
	
endmodule