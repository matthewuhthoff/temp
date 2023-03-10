/*
code from the internet, used as a reference

`timescale 1ns / 1ps

module divide(dividend, divider, ready, quotient, remainder, sign, clk);

   input         clk;
   input         sign;
   input [31:0]  dividend, divider;
   output [31:0] quotient, remainder;
   output        ready;

   reg [31:0]    quotient, quotient_temp;
   reg [63:0]    dividend_copy, divider_copy, diff;
   reg           negative_output;
   
   wire [31:0]   remainder = (!negative_output) ?  dividend_copy[31:0] : ~dividend_copy[31:0] + 1'b1;

   reg [5:0]     bit; 
   wire          ready = !bit;

   initial bit = 0;
   initial negative_output = 0;

   always @( posedge clk ) 

     if( ready ) begin

        bit = 6'd32;
        quotient = 0;
        quotient_temp = 0;
        dividend_copy = (!sign || !dividend[31]) ? {32'd0,dividend} : {32'd0,~dividend + 1'b1};
        divider_copy = (!sign || !divider[31]) ? {1'b0,divider,31'd0} : {1'b0,~divider + 1'b1,31'd0};

        negative_output = sign && ((divider[31] && !dividend[31]) || (!divider[31] && dividend[31]));  
     end 
     else if ( bit > 0 ) begin

        diff = dividend_copy - divider_copy;

        quotient_temp = quotient_temp << 1;

        if( !diff[63] ) begin

           dividend_copy = diff;
           quotient_temp[0] = 1'd1;

        end

        quotient = (!negative_output) ? quotient_temp : ~quotient_temp + 1'b1;

        divider_copy = divider_copy >> 1;
        bit = bit - 1'b1;

     end
endmodule

*/

module div_32(dividend, divisor, quotient, remainder, clk);
    input clk;
    input[31:0] devidend, devisor;
    
    output[31:0] quotient, remainder;

    reg[32:0] M, A, Q;
    reg[31:0] inv_M, temp_inv_M, temp1;
    temp1 <= 32'h00000001;
    wire useless;
    not_32 comp1 (.a_reg(devisor), .out(temp_inv_M));
    add_32 comp2 (.a_reg(temp_inv_M), .b_reg(temp1), .cin(0), .sum(inv_M), .cout(useless));

    A = 32'd0;
    M[31:0] = devisor;
    case(M[31])
        1'b1 : M[32] = 1;
        default : M[32] = 0;
    endcase

    Q[31:0] = devidend;
    case(Q[31])
        1'b1 : Q[32] = 1;
        default : Q[32] = 0;
    endcase



    integer i;
    for (i = 0; i < 32; i = i + 1) begin



    end
    



endmodule