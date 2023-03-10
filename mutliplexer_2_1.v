module multiplexer_2_1(
	input wire control,
	input [31:0] in1,
	input [31:0] in2,

	output reg [31:0] out);
	
	case (control)
		5'd0 : out <= in1[31:0];
		5'd1 : out <= in2[31:0];
	endcase
endmodule