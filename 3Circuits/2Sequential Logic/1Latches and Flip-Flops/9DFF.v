module top_module (
    input clk,
    input d, 
    input r,
    output q);

    /*
    This exercise work the same as exercise 3
    */

    reg q_reg;
    always @(posedge clk) begin
        if(r) q_reg <= 0;
        else q_reg <= d;
    end
    assign q = q_reg;

endmodule
