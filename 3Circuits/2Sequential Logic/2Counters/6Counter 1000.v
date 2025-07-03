module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 

    /*
    Modulo-10 couunter is a 0 to 9 counter and auto reset
    */
    
    wire [3:0]count[0:2];

    //the enable for the first layer counter is always on
    assign c_enable[0] = 1;
    //when first layer is full, then enable second layer to count one time
    assign c_enable[1] = (count[0]==9)? 1:0;
    //when both lower layers were full, then the third layer enable
    assign c_enable[2] = (count[1]==9 && count[0]==9)? 1:0;
    
    //3 layers of counter, 10^3 = 1000
    bcdcount counter0 (clk, reset, c_enable[0],count[0]);
    bcdcount counter1 (clk, reset, c_enable[1],count[1]);
    bcdcount counter2 (clk, reset, c_enable[2],count[2]);

    //only when all counter hit 9, then it is 1 Hz
    assign OneHertz = (count[0]==9 && count[1]==9 && count[2]==9)? 1:0;

endmodule
