module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    //use '?' as multiplexer
    //it can execute for large vector or single bit
    //the only limit is input 'a' and 'b' bit size is equal to 'out'
    assign out = (sel)? b:a;
    
endmodule