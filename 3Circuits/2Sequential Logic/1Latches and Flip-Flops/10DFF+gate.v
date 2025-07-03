module top_module (
    input clk,
    input in, 
    output out);

    //this is the code for gate and 'd' is the wire input for DFF
    wire d;
    assign d = out_reg ^ in;

    //use 'd' value from above for input
    reg out_reg;
    always @(posedge clk) begin
        out_reg <= d;
    end
    assign out = out_reg;

endmodule
