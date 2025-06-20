module top_module( 
    input a, b, sel,
    output out ); 

    //use '?' as multiplexer, like 'if' statement for wire
    assign out = (sel)? b:a;
    
endmodule