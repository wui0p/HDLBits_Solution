module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );

    //when multiplexer input is higher than 2, it is recommended to us case
    always @(*) begin
        case(sel)
            0: out = a;
            1: out = b;
            2: out = c;
            3: out = d;
            4: out = e;
            5: out = f;
            6: out = g;
            7: out = h;
            8: out = i;
            //default set 'out' as 16'b1111_1111_1111_1111
            default: out = {16{1'b1}};
        endcase
    end
    
endmodule