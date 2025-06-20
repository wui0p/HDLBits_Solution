module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    // 'cout' will automatically assign to when sum overflow
    assign {cout,sum} = a + b + cin;

endmodule
