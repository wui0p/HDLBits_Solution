module top_module (
    input clk,
    input reset,
    input [7:0] d,
    output [7:0] q
);

    reg [7:0]q_reg;

    //execute condition is negedge of clk
    //negedge means from 1 to 0
    always @(negedge clk) begin
        //the exercise require it to reset to 0x34
        //which is hexidecimal 34, represented as 8'h34 in Verilog
        if(reset) q_reg <= 8'h34;
        else q_reg <= d;
    end

    assign q = q_reg;

endmodule
