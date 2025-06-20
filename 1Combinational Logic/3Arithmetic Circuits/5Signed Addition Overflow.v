module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);

    /*
    This is 2's compliment adder, therefore you can not use {overflow,s} = a + b
    When a[7] and b[7] are all + or -, then s[7] is not equal to the same sign, then it overflow
    */

    assign s = a + b;
    // '!=' means if variable not equal to another variable
    assign overflow = (a[7]==b[7])? ((a[7]!=s[7])? 1:0):0;

endmodule
