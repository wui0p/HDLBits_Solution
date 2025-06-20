module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    /*
    The k-map can not be simplified
    But we can find out that they want odd number of 1
    */

    assign out = a^b^c^d;

endmodule
