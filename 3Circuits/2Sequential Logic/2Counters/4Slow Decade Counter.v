module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    /*
    This exercise has the same logic as exercise 2
    */

    reg [3:0]q_reg;
    always @(posedge clk) begin
        if(reset) q_reg = 0;
        else begin
            //if statement so only when 'slowena' is 1 will count
            if(slowena) begin
                if(q_reg == 9) q_reg = 0;
                else q_reg = q_reg + 1;
            end
            //else it do not do anything, thus do not need to use else
        end
    end
    assign q = q_reg;

endmodule
