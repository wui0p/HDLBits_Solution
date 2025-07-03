module top_module (
    input clk,
    input reset,        
    output [3:0] q);

    reg [3:0]q_reg;
    always @(posedge clk) begin
        if(reset) q_reg = 0;
        else begin
            //this if statement reset 'q_reg' when it going to hit 10
            //the priority is lower than reset (normally reset have highest priority)
            if(q_reg == 9) q_reg = 0;
            else q_reg = q_reg + 1;
        end
    end
    assign q = q_reg;

endmodule
