module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
    //from the 4-to-1 mux we can determine mux_in correspond to {ab} = {00/01/10/11}
    //when ab = 00, only when cd = 00 output 0, other output 1
    assign mux_in[0] = (!c&&!d)? 0:1;
    //when ab = 01, all output 0
    assign mux_in[1] = 0;
    //when ab = 10, only when d = 0 output 1, other output 0
    assign mux_in[2] = (!d)? 1:0;
    //when ab = 11, only when cd = 11 output 1, other output 0
    assign mux_in[3] = (c&&d)? 1:0;

endmodule
