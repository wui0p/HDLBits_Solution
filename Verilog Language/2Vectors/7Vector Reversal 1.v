module top_module( 
    input [7:0] in,
    output [7:0] out
);
    
    //create integer for for loop
    integer i;
    always @(*) begin
        //using for loop to reverse input to link to output
        for(i=0;i<8;i=i+1)
            out[i] = in[7-i];
    end

endmodule