module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    /*
    We can simplify it to [a+b+c]
    */

    //the + in function does not mean AND
    //it function rather like a OR, because any condition of the three will result in 1
    assign out = a | b | c;

endmodule
