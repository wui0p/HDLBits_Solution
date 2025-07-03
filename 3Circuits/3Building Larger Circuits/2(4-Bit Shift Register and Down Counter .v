module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);

    /*
    This most-significant-bit is the leftmost bit
    Thus this exercise is asking to shift 'q' to the left by 1
    */

    //set reg 'q' for storing values
    reg [3:0]q_reg;

    always @(posedge clk) begin
        //after shifting we have to add 'data' value
        if(shift_ena) q_reg = (q << 1) + data;
        else if(count_ena) q_reg = q_reg - 1;
    end

    assign q = q_reg;

endmodule
