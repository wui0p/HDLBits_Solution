module top_module (
    input clk,
    input areset,  
    input [7:0] d,
    output [7:0] q
);

    reg [7:0]q_reg;

    //we add a condition for asynchronouse
    //exercise require 'areset' to be high, therefore posedge (0 to 1) of 'areset'
    //use 'or' and not '||' in always block conditions
    always @(posedge clk or posedge areset) begin
        if(areset) q_reg <= 0;
        else q_reg <= d;
    end

    assign q = q_reg;

endmodule
