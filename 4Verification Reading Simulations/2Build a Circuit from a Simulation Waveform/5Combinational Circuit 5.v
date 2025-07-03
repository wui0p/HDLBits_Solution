module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );

    /*
    From the waveform we first know that 'c' must be the deciding factor
    Now we match the case statement to the output
    Only when 'c=0~3' have assigned input to output, others are 4'hf
    */

    always @(*) begin
        case(c)
            0: q = b;
            1: q = e;
            2: q = a;
            3: q = d;
            default q = 4'hf;
        endcase
    end 

endmodule
