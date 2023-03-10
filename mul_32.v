module BoothMultiplier(
    input clk,
    input wire [31:0] a,
    input wire [31:0] b,
    output wire [63:0] result
);
    reg [31:0] m1, m2;
    reg [31:0] p;
    reg [63:0] product;
    reg [2:0] state;
    reg [4:0] counter;

    always @(*) begin
        m1 = (b[0]) ? ~b : b;
        m2 = (b[0]) ? -a-1 : a;
        p = (b[0]) ? m2 : m2 >> 1;
        state = 2'b00;
        product = 64'b0;
        counter = 5'b0;
    end

    always @(posedge clk) begin
        if (counter == 5'b11111) begin
            result[31:0] <= product[63:32]; // potential for error
        end else begin
            case (state)
            2'b00: begin
                if (b[counter+1]) begin
                product = product + p;
                state = 2'b10;
                end;
                counter = counter + 1;
            end
            2'b10: begin
                product = product + m1;
                state = 2'b00;
            end
            2'b01: begin
                product = product + m2;
                state = 2'b00;
            end
            default: begin
                state = 2'b00;
            end
            endcase
        end
    end
endmodule