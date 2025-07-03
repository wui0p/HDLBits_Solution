module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

    /*
    From looking at the waveform, 'q=0' is way less than 'q=1'
    Thus we choose the case statement for 'q=0' as the output
    Then default will be all 1
    */

    wire [3:0]in;
    assign in = {a,b,c,d};

    always @(*) begin
        case(in)
            4'b0000: q = 0;
            4'b0001: q = 0;
            4'b1000: q = 0;
            4'b1001: q = 0;
            default: q = 1;
        endcase
    end 

endmodule
