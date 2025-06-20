module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    //place variable in vector's indicator '[]', which can work as multiplexer
    assign out = in[sel];
    
endmodule