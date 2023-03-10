
module add_32(input [31:0] a_reg, input [31:0] b_reg, input [0:0] cin,
              output wire [31:0] sum, output wire cout); 
    wire firstCout;

    carryLA16 carryLA1(.a_reg(a_reg[15:0]), .b_reg(b_reg[15:0]), .cin(cin), .sum(sum[15:0]), .cout(firstCout));
    
    carryLA16 carryLA2(.a_reg(a_reg[31:16]), .b_reg(b_reg[31:16]), .cin(firstCout), .sum(sum[31:16]), .cout(cout));

endmodule



module carryLA16(input wire[15:0] a_reg, input wire[15:0] b_reg, input wire cin,
                 output wire[15:0] sum, output wire cout);
    wire firstCout;
    wire secondCout;
    wire thirdCout;
    
    carryLA4 carryLA1(.a_reg(a_reg[3:0]), .b_reg(b_reg[3:0]), .cin(cin), .sum(sum[3:0]), .cout(firstCout));
    carryLA4 carryLA2(.a_reg(a_reg[7:4]), .b_reg(b_reg[7:4]), .cin(firstCout), .sum(sum[7:4]), .cout(secondCout));

    carryLA4 carryLA3(.a_reg(a_reg[11:8]), .b_reg(b_reg[11:8]), .cin(secondCout), .sum(sum[11:8]), .cout(thirdCout));


    carryLA4 carryLA4(.a_reg(a_reg[15:12]), .b_reg(b_reg[15:12]), .cin(thirdCout), .sum(sum[15:12]), .cout(cout));


endmodule


module carryLA4(input wire [3:0] a_reg, input wire [3:0] b_reg, input wire cin, output wire[3:0] sum, output wire cout);

    wire [3:0] prop, gen, carry;

    assign prop = a_reg ^ b_reg;
    assign gen = a_reg & b_reg;
    assign carry[0] = cin;
    assign carry[1] = gen[0] | (prop[0] & carry[0]);
    assign carry[2] = gen[1] | (prop[1] & gen[0]) | prop[1] | prop[0] & carry[0];
    assign carry[3] = gen[2] | (prop[2] & gen[1]) | prop[2] & prop[1] & gen[0] | prop[2] & prop[1] & prop[0] & carry[0];
    assign cout = gen[3] | (prop[3] & gen[2]) | prop[3] & prop[2] & gen[1] | prop[3] & prop[2] & prop[1] & gen[0] | prop[3] & prop[2] & prop[1] & prop[0] & carry[0];
	assign sum[3:0] = prop ^ carry;

    

endmodule