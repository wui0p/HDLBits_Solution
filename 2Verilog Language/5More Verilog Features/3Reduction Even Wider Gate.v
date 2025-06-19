module top_module( 
    input [99:0] in,
    output out_and,
    output out_or,
    output out_xor 
);

    //having a bitwise operators in front of a variable
    //it means the first bit operator with the next bit until it hit the last bit
    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;
    
endmodule