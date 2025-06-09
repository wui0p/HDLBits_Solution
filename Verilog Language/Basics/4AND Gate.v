module top_module( 
    input a, 
    input b, 
    output out );

    // '&' work as a bitewise AND gate
    assign out = a & b;
    
endmodule