module top_module (
    input clk,
    input a,
    input b,
    output q,
    output reg state  );

    /*
    We can find that 'state' changes when 'a=b' and that 'state=a=b' when condition met
    Now we can also see that 'q' does not only correlate with 'a' and 'b'
    The other condition it need to consider is output 'q'
    */

    always @(posedge clk) begin
        if(a==b) state = a;
    end

    //list all the possible combination of {a,b}
    always @(*) begin
        case({a,b})
            2'b00: q = state;
            2'b01: q = !state;
            2'b10: q = !state;
            2'b11: q = state;
        endcase
    end

endmodule
