module top_module (
    input clk,
    input reset,        
    output [3:0] q);

    /*
    This exercise has the same logic of exercise 2
    Change the 'q_reg = 0' to 'q_reg = 1' and 'q_reg' auto reset statement
    */

    reg [3:0]q_reg;
    always @(posedge clk) begin
        if(reset) q_reg = 1;
        else begin
            //this if statement reset 'q_reg' when it going to hit 11
            if(q_reg == 10) q_reg = 1;
            else q_reg = q_reg + 1;
        end
    end
    assign q = q_reg;

endmodule
