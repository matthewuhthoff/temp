module Register(
   input clock,
   input clear, 
   input enable,
   input [31:0] data_in,
   output [31:0] data_out);
	
	reg [31:0] q;
	
	always @(posedge clock)
		begin
			if (clear) begin
				q <= 32'b0;
			end
			else if (enable) begin
				q <= data_in;
			end
	assign data_out = q;
	
endmodule