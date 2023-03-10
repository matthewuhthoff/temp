`timescale 1ns / 10ps
module and_tb;

	reg [31:0] input_a, input_b;
	wire [31:0] or_result;

	or_32 or_instance(input_a, input_b, or_result);
	
	initial
		begin
			input_a <= 2;
			input_b <= 3;
			
			#200
			input_a <= 5;
			input_b <= 5;
	end
	
endmodule