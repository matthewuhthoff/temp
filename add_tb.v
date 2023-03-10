`timescale 1ns / 10ps
module and_tb;

	reg [31:0] input_a;
	reg [31:0] input_b;
	reg [0:0] cin; // Should be a wire instead???!!!??? If so how do I assignment value of 0 to it??
	wire [31:0] add_result;
	wire cout;
	
	add_32 add_instance(input_a, input_b, cin, add_result, cout);
	
	initial
		begin
			input_a <= 2;
			input_b <= 1;
			cin <= 1;
			
			
			#200
			input_a <= 5;
			input_b <= 3;
			cin <= 0;
	end
	
endmodule