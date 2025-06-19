module top_module (
    input [7:0] in,
    output parity); 
	
    //XOR of all bit to the next bit
    //it means in[n]^in[n-1] and so on, until it hit the last bit
    //this can check the parity of a value
    assign parity = ^in[7:0];
    
endmodule