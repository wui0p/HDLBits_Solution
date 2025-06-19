module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    //set wires for top and down combinational gates
    wire [24:0]top = {{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}};
    wire [24:0]down = {5{a,b,c,d,e}};
    assign out = ~ top ^ down;

endmodule