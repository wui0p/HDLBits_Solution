module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    /*
    We can simplify it to [a+b'c]
    */

    assign out = a|(!b&c);

endmodule
