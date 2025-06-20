module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);

    //we find what inputs will cause output as 1
    //010, 011, 101, 111
    //use NOT gate for 0, then AND gate 3 bits together, last use OR gate
    //this is gate level truth table, in future we can just use 'case'
    assign f = (~x3&x2&~x1)|(~x3&x2&x1)|(x3&~x2&x1)|(x3&x2&x1);
    
endmodule