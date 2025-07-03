module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );

    /*
    This exercise can use the similar concept as exercise 2
    But this time we use case statement, because it is easier to check with human's eye
    */

    wire [3:0]in;
    assign in = {a,b,c,d};

    always @(*) begin
        case(in)
            4'b0101: q = 1;
            4'b0110: q = 1;
            4'b0111: q = 1;
            4'b1001: q = 1;
            4'b1010: q = 1;
            4'b1011: q = 1;
            4'b1101: q = 1;
            4'b1110: q = 1;
            4'b1111: q = 1;
            default: q = 0;
        endcase
    end 

endmodule
