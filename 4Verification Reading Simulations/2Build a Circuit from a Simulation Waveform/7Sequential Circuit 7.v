module top_module (
    input clk,
    input a,
    output q );

    /*
    We can see from the waveform that 'q' is the oppisite of 'a'
    But there is a delay when 'a' rise and 'q' fall
    By obrserving clk's edge, we can derive that the condition is posedge clk
    */

    always @(posedge clk) begin
        q = !a;
    end

endmodule
