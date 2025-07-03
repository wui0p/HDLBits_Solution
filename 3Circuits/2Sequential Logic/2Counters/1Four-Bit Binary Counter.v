module top_module (
    input clk,
    input reset,     
    output [3:0] q);

    reg [3:0]q_reg;
    always @(posedge clk) begin
        //reset have higher priority but synchronous
        if(reset) q_reg = 0;
        else begin
            //counter for 'q_reg'
            q_reg = q_reg + 1;
        end
    end
    assign q = q_reg;

endmodule
