module top_module ( );

    //set the reg output 'clk'
    reg clk;

    dut insta(clk);
    
    //set the start of 'clk' to 0
    initial clk=0;
    //keep on reversing 'clk' every 5 time units
    always #5 clk = ~clk;

endmodule
