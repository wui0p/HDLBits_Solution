module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    
    //adding bitwise operator in front of a variable will work as self bitwise
    //bitwise operate in[i] and in[i+1], continue until it have only one bit left
    //ex. &(1101) = &(110) = &(10) = 0
    //ex. ^(1101) = ^(111) = ^(10) = 1
    assign out_and = &in;
    assign out_or = |in;
    assign out_xor = ^in;

endmodule