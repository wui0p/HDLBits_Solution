module top_module( 
    input a, 
    input b, 
    output out );

    // '|' work as a bitwise OR gate
    // adding '~' infront will add NOT gate
    assign out = ~(a|b);
    
endmodule