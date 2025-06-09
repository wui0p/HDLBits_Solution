module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);

    // '||' work as a logical OR gate, which is the OR we use as irl meaning
    assign out_or_bitwise = a | b;
    assign out_or_logical = a || b;
    //vec = vec[full_length:0]
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a;
    
endmodule