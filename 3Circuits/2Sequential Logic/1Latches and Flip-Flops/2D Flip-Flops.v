module top_module (
    input clk,
    input [7:0] d,
    output [7:0] q
);

    //this exercise they set output as wire, therefore can not store values
    //hence we need to set a output reg, for storing the output value
    reg [7:0]q_reg;
    
    always @(posedge clk) begin
        q_reg <= d;
    end

    //remember to assign the reg to output wire
    assign q = q_reg;

endmodule
