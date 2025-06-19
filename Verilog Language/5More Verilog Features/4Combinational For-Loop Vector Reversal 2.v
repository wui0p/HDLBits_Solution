module top_module( 
    input [99:0] in,
    output [99:0] out
);

    integer i;
    always @(*) begin
        //use for loop to complete things that are repetitive
        //this loop below work a i from 0~99, which will repeat 100 time
        for(i=0 ; i<100 ; i=i+1)
            out[i] = in[99-i];
    end
    
endmodule