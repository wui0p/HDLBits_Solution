module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  );

    //1. the size of the wire 'mux0' and 'mux1' does not fit with 'out'
    //2. rename the modules name that is not the same as wire 'mux0' and 'mux1'
    //3. 'insta2' dicider should be the same as 'insta1', thus use sel[0]

    wire [7:0]mux0, mux1;
    mux2 insta1 ( sel[0],    a,    b, mux0 );
    mux2 insta2 ( sel[0],    c,    d, mux1 );
    mux2 insta3 ( sel[1], mux0, mux1,  out );

endmodule
