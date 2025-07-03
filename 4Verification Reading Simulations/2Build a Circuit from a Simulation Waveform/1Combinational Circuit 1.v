module top_module (
    input a,
    input b,
    output q );

    /*
    We can see that only when bot 'a' and 'b' is high
    Will result into output 'q' also is high
    */

    assign q = a & b;

endmodule
