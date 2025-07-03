module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); 

    assign c_enable = enable;
    // 'c_load' is a reset flag for 'count4'
    //remember that only when 'enable' is 1, that 'Q will auto reset (when goin to 13)
    assign c_load = (reset || (Q==12 && enable))? 1:0;
    //it is a i=i+1 counter, therfore 'c_d = 1'
    assign c_d = 1;
    count4 the_counter (clk, c_enable, c_load, c_d, Q);

endmodule
