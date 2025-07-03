module top_module();

    reg clk, in;
    reg [2:0]s;
    wire out;

    q7 insta(clk,in,s,out);

    //this block is for 'clk' signal
    //almost all testbench need these line for your module
    //because most modules runs on 'clk'
    initial clk = 0;
    always #5 clk = ~clk;

    //this initial block is for 'in'
    initial begin
        in = 0;
        #20 in = 1;
        #10 in = 0;
        #10 in = 1;
        #30 in = 0;
    end

    //this initial block is for 's'
    //we normally individualize the intput blocks
    //because it is easier for us human to code it
    initial begin
        s = 2;
        #10 s = 6;
        #10 s = 2;
        #10 s = 7;
        #10 s = 0;
    end

endmodule
