module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    /*
    We can simplify it to [b'c'+acd+bcd+a'bd'+a'cd']
    */

    //we use AND bitwise operator for * in function
    // '!' also mean NOT gate, the same as '~'
    assign out = (!b&!c)|(a&c&d)|(b&c&d)|(!a&b&!d)|(!a&c&!d);

endmodule
