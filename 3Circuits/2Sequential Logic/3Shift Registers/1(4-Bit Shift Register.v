module top_module(
    input clk,
    input areset,  
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 

    //asynchronous, thus 'or posedge areset'
    always @(posedge clk or posedge areset) begin
        // 'areset' has the highest priority
        if(areset) q = 0;
        else begin
            // 'load' is place in if statement becuase it has higher priority
            if(load) q = data;
            // '>>' means shift right and the leftmost is 0 
            else if(ena) q = q>>1;
        end
    end

endmodule
