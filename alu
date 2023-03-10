`timescale 1ns/10ps

module alu(
	input clk, clear, IncPC, branch_flag,
	
	input wire [31:0] A_reg,
	input wire [31:0] B_reg,
	input wire [31:0] Y_reg,

	input wire [4:0] opcode,

	output reg [63:0] C_reg 
);
    parameter load = 5'b00000, 
              loadi = 5'b00001,
              store = 5'b00010,
              add = 5'b00011,
              sub = 5'b00100,
              and_ = 5'b00101,
              or_ = 5'b00110,
              shr = 5'b00111,
              shra = 5'b01000,
              shl = 5'b01001,
              ror = 5'b01010,
              rol = 5'b01011,

              addi = 5'b01100,
              andi = 5'b01101,
              ori = 5'b01110,

              mul = 5'b01111,
              div = 5'b10000,
              neg = 5'b10001,
              not_ = 5'b10010,

              br = 5'b10011,

              jr = 5'b10100,
              jal = 5'b10101,

              in = 5'b10110,
              out = 5'b10111,
              mfhi = 5'b11000,
              mflo = 5'b11001,

              nop = 5'b11010,
              halt = 5'b11011;



	
	wire [31:0] IncPC_out, shr_out, shl_out, or_out, and_out, neg_out, not_out, adder_sum, adder_cout, sub_sum, sub_cout, rol_out, ror_out;
	wire [63:0] mul_out, div_out;

	
	always @(*)
		begin
			case (opcode)
				
				add: begin
					C_reg[31:0] <= adder_sum[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				sub: begin
					C_reg[31:0] <= sub_sum[31:0];	
					C_reg[63:32] <= 32'd0;
				end
				
				or_, ori: begin
					C_reg[31:0] <= lor_out[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				and_, andi: begin
					C_reg[31:0] <= land_out[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				neg: begin
					C_reg[31:0] <= neg_out[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				not_: begin
					C_reg[31:0] <= not_out[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				shr: begin
					C_reg[31:0] <= shr_out[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				shl: begin
					C_reg[31:0] <= shl_out[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				ror: begin
					C_reg[31:0] <= ror_out[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				rol: begin
					C_reg[31:0] <= rol_out[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				mul: begin
					C_reg[63:32] <= ~mul_out[63:32];
					C_reg[31:0] <= mul_out[31:0];
				end
				
				div: begin
					C_reg[63:0] <= div_out[63:0];
				end
				
				load, loadi, store, addi: begin
					C_reg[31:0] <= adder_sum[31:0];
					C_reg[63:32] <= 32'd0;
				end
				
				br: begin
					if(branch_flag==1) begin
						C_reg[31:0] <= adder_sum[31:0];
						C_reg[63:32] <= 32'd0;
					end 
					else begin
						C_reg[31:0] <= Y_reg[31:0];
						C_reg[63:32] <= 32'd0;
					end
				end
				
				halt: begin
					
				end
				
				nop: begin
					
				end
				
				default: begin
					C_reg[63:0] <= 64'd0;
				end

			endcase
	end
	
	or_32 lor(Y_reg,B_reg,lor_out);
	and_32 land(Y_reg,B_reg,land_out);
	negate_32_bit neg(B_reg,neg_out);
	not_32 not_module(B_reg,not_out);
	add_32 adder(.Ra(Y_reg), .Rb(B_reg),.cin({1'd0}),.sum(adder_sum),.cout(adder_cout));
	sub_32 subtractor(.Ra(Y_reg), .Rb(B_reg),.cin({1'd0}),.sum(sub_sum),.cout(sub_cout));
	ror_32 ror_op(Y_reg,B_reg,ror_out);
	rol_32 rol_op(Y_reg,B_reg,rol_out);
	shl_32 shl(Y_reg,B_reg,shl_out);
	shr_32 shr(Y_reg,B_reg,shr_out);
	div_32 div(Y_reg,B_reg, div_out);
	mul_32 mul(Y_reg,B_reg,mul_out);
	IncPC_32_bit pc_inc(A_reg, IncPC, IncPC_out);

endmodule