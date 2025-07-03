module top_module (input a, input b, input c, output out);

    //set a reg version of 'out' for 'inst1'
    reg out_reg;

    //module andgate ( output out, input a, input b, input c, input d, input e );
    //therefore the originial 'inst1' did not connect the correct ports
    andgate inst1 (out_reg, a, b, c, 1, 1);

    //the exercise want NAND, thus add NOT
    assign out = !out_reg;

endmodule
