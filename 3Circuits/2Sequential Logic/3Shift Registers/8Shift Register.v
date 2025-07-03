module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
);

    //set 4 module, because n=4
    MUXDFF insta1 (KEY[0], KEY[3], KEY[1], SW[3], KEY[2], LEDR[3]);
    MUXDFF insta2 (KEY[0], LEDR[3], KEY[1], SW[2], KEY[2], LEDR[2]);
    MUXDFF insta3 (KEY[0], LEDR[2], KEY[1], SW[1], KEY[2], LEDR[1]);
    MUXDFF insta4 (KEY[0], LEDR[1], KEY[1], SW[0], KEY[2], LEDR[0]);

endmodule

//set lower tier module for the sections
module MUXDFF (input clk, input w, input e, input r, input l, output reg q);
    //set the input wire for MUX and DFF
    wire in , d;
    assign in = (e)? w : q;
    assign d = (l)? r : in;
    always @(posedge clk) begin
        q = d;
    end
endmodule
