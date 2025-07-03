module top_module (
    input clk,
    input d, 
    input ar, 
    output q);

    /*
    This exercise work the same as exercise 5
    */

    reg q_reg;
    always @(posedge clk or posedge ar) begin
        if(ar) q_reg <= 0;
        else q_reg <= d;
    end
    assign q = q_reg;

endmodule
