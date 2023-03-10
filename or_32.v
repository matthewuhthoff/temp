module or_32(
    input [31:0] a_reg,
    input [31:0] b_reg,
    output [31:0] c_reg);

    //integer i;
    //for (i = 0; i < 32; i = i + 1)
    //    begin
    //        c_reg[i] = a_reg[i] | b_reg[i];
    //    end
    assign c_reg = a_reg | b_reg;

endmodule