module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);

    //connecting all three modules in order
    wire [7:0]q1,q2,q3;
    my_dff8 insta1 (clk,d,q1);
    my_dff8 insta2 (clk,q1,q2);
    my_dff8 insta3 (clk,q2,q3);
    
    always @(*) begin
        //multiplexer, using case the dicide which to output
        case(sel)
            0: q <= d;
            1: q <= q1;
            2: q <= q2;
            3: q <= q3;
        endcase
    end

endmodule