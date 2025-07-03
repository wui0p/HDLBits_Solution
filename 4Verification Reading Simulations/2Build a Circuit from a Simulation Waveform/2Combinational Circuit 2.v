module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

    //list all the possibilities of 'q=1'
    //when using '!', this declare the input should be 0, if not used, then should be 1
    
    assign q = (!a&!b&!c&!d) | (!a&!b&c&d) | (!a&b&!c&d) | (!a&b&c&!d) | (a&!b&!c&d) | (a&!b&c&!d) | (a&b&!c&!d) | (a&b&c&d);

endmodule
