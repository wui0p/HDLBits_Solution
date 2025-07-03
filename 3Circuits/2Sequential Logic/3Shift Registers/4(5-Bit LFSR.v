module top_module(
    input clk,
    input reset,
    output [4:0] q
); 

    //this always block need to be in non-blocking
    //because it need to set together in an instant
    always @(posedge clk) begin
        if(reset) q <= 5'h1;
        else begin
            //all the circuits
            q[4] <= q[0] ^ 0;
            q[3] <= q[4];
            q[2] <= q[3] ^ q[0];
            q[1] <= q[2];
            q[0] <= q[1];
        end
    end

endmodule
