module top_module (
    input clock,
    input a,
    output p,
    output q );

    //From the output waveform we know that the values latches
    //Thus we need to set reg version of the outputs
    reg p_reg, q_reg;

    //everytime 'clock=1' we assign intput 'a' to reg output 'q'
    //even when 'clock=0' the 'q_reg' will store the value
    always @(*) begin
        if(clock) p_reg = a;
    end

    //we can derive that everytime 'clock' drop from 1 to 0 it will change
    //thus we use negedge clock, which refer to 1 to 0
    always @(negedge clock) begin
        q_reg = a;
    end

    assign p = p_reg;
    assign q = q_reg;

endmodule
