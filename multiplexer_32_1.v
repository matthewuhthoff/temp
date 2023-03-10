module multiplexer(
	input [4:0] control,
	input [31:0] BusMuxIn_R0,
	input [31:0] BusMuxIn_R1,
	input [31:0] BusMuxIn-R2,
	input [31:0] BusMuxIn-R3,
	input [31:0] BusMuxIn-R4,
	input [31:0] BusMuxIn-R5,
	input [31:0] BusMuxIn-R6,
	input [31:0] BusMuxIn-R7,
	input [31:0] BusMuxIn-R8,
	input [31:0] BusMuxIn-R9,
	input [31:0] BusMuxIn-R10,
	input [31:0] BusMuxIn-R11,
	input [31:0] BusMuxIn-R12,
	input [31:0] BusMuxIn-R13,
	input [31:0] BusMuxIn_R14,
	input [31:0] BusMuxIn_R15,
	
	input [31:0] BusMuxIn-HI,
	input [31:0] BusMuxIn-LO,
	input [31:0] BusMuxIn-Zhigh,
	input [31:0] BusMuxIn-Zlow,
	input [31:0] BusMuxIn-PC,
	input [31:0] BusMuxIn-MDR,
	input [31:0] BusMuxIn-In.Port,
	input [31:0] C_sign_extended,
	
	
	output [31:0] BusMuxOut);
	always @ (*) begin
		case (control)
			5'd1 : BusMuxOut <= BusMuxIn-R0[31:0];
			5'd2 : BusMuxOut <= BusMuxIn-R1[31:0];
			5'd3 : BusMuxOut <= BusMuxIn-R2[31:0];
			5'd4 : BusMuxOut <= BusMuxIn-R3[31:0];
			5'd5 : BusMuxOut <= BusMuxIn-R4[31:0];
			5'd6 : BusMuxOut <= BusMuxIn-R5[31:0];
			5'd7 : BusMuxOut <= BusMuxIn-R6[31:0];
			5'd8 : BusMuxOut <= BusMuxIn-R7[31:0];
			5'd9 : BusMuxOut <= BusMuxIn-R8[31:0];
			5'd10 : BusMuxOut <= BusMuxIn-R9[31:0];
			5'd11: BusMuxOut <= BusMuxIn-R10[31:0];
			5'd12 : BusMuxOut <= BusMuxIn-R11[31:0];
			5'd13 : BusMuxOut <= BusMuxIn-R12[31:0];
			5'd14 : BusMuxOut <= BusMuxIn-R13[31:0];
			5'd15 : BusMuxOut <= BusMuxIn-R14[31:0];
			5'd16 : BusMuxOut <= BusMuxIn-R15[31:0];
			
			5'd17 : BusMuxOut <= BusMuxIn-HI[31:0];
			5'd18 : BusMuxOut <= BusMuxIn-LO[31:0];
			5'd19 : BusMuxOut <= BusMuxIn-Zhigh[31:0];
			5'd20: BusMuxOut <= BusMuxIn-Zlow[31:0];
			5'd21 : BusMuxOut <= BusMuxIn-PC[31:0];
			5'd22 : BusMuxOut <= BusMuxIn-MDR[31:0];
			5'd23 : BusMuxOut <= BusMuxIn-In.Port[31:0];
			5'd24 : BusMuxOut <= C_sign_extended[31:0];
		endcase
	end
endmodule
