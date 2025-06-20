module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 

    /*
    SOP form = cd + a'b'c
    POS form = (c)(b'+c'+d)(a'+c'+d)
    */

	assign out_sop = (c&d)|(!a&!b&c);
    assign out_pos = c&(!b|!c|d)&(!a|!c|d);

endmodule
