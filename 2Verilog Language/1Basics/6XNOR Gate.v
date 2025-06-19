module top_module( 
    input a, 
    input b, 
    output out );

    // '^' work as a bitwise XOR gate
    assign out = ~(a^b);
    
endmodule