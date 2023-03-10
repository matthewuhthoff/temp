`timescale 1ns / 1ps

module IncPC #(parameter qInit = 0)(
	input clk, IncPC, enable,
	input [31:0] inputPC,
	output reg[31:0] tempPC
	);
	
initial tempPC = qInit;
	
always @ (posedge clk)
	begin
		if(IncPC == 1 && enable ==1)
			tempPC <= newPC + 1;
		else if (enable == 1)
			tempPC <= inputPC;
	end
				
endmodule