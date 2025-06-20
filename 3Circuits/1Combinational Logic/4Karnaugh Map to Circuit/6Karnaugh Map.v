module top_module (
    input [4:1] x, 
    output f );

    /*
    We can simplify it to [x1'x3+x3x4+x2x4]
    */

    assign f = (!x[1]&x[3])|(x[3]&x[4])|(x[2]&x[4]);

endmodule
