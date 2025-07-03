module top_module (
    input sel,
    input [7:0] a,
    input [7:0] b,
    output [7:0] out  );

    //1. output delcaration of 'out' is not [7:0]
    //2. when setting MUX, we use if statement of assign

    assign out = (sel)? a : b;

endmodule
