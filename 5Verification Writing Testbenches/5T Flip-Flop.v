module top_module ();

    reg clk, reset, t;
    wire q;

    tff insta(clk,reset,t,q);

    //this is the 'clk' signal block
    initial clk = 0;
    always #5 clk = ~clk;

    //we put the intput 'reset' and 't' together in this exercise
    //because they have very little amount of setting delays
    initial begin
        reset = 0;
        t = 0;
        //the delay time of 'reset' can be any value
        #5 reset = 1;
        #5 reset = 0;
        t = 1;
    end

endmodule
