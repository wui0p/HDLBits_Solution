module top_module (
    input [7:0] in,
    output [31:0] out );

    //24{in[7]} means copy input 7 bit for 24 times
    //you have to add {} outside of 24{in[7]}
    assign out = {{24{in[7]}},in};

endmodule