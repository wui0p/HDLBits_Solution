module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);

    //set reg version of output to store value
    reg [7:0]q_reg;

    //synchronous reset, therefore execute condition only use posedge clk
    always @(posedge clk) begin
        if(reset) q_reg <= 0;
        else q_reg <= d;
    end

    //remeber to assign reg value to output wire
    assign q = q_reg;

endmodule
