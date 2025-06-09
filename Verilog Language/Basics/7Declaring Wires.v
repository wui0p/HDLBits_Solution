`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

    //declare additional temporary wires
	wire ab, cd;
    //connect input into those temp wires
    assign ab = a&b;
    assign cd = c&d;
    //connect temp wires to output wires
    assign out = ab|cd;
    assign out_n = ~out;
    
endmodule