module mul_32   (input signed [31:0] M,
    input signed [31:0] Q,
    output wire [63:0] result);

    reg [63:0] product; // Maybe Wire?
    reg [32:0] temp_q;

    temp_q[32:1] = Q;
    temp_q[0] = 0;
    wire [1:0] temp_control;
    wire useless;

    integer i;
    for (i = 0; i < 31; i = i + 1) begin // May need to be < 32 instead
        temp_control = {temp_q[1], temp_q[0]};
        case(temp_control)  
            2'b01 : add_32 adding(.a_reg(product), .b_reg(M), .cin(0), .sum(product), .cout(useless));
            2'b10 : sub_32 subing(.a_reg(product), .b_reg(M), .cin(0), .sum(product), .cout(useless));

            default : continue;
        endcase
        shr_32 shift(.data_in(temp_q), .shift(1), .data_out(temp_q));
    end
 
    assign result = product;



endmodule