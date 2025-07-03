module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 

    always @(posedge clk) begin
        //load 'data' to 'q' if 'load' is true
        if(load) q <= data;
        //we take the right bits and XOR with the left bits
        //you have to label the size of 0 when merging vectors
        else q <= ({1'b0,q[511:1]}) ^ ({q[510:0],1'b0});
    end

endmodule
