module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    reg [1:0]state, next_state;
    parameter ZERO = 0, FIRST = 1, SEC = 2;

    always @(*) begin
        case(state)
            //this state is like the idle state, until hit 1
            ZERO: next_state = (x)? FIRST : ZERO;
            //this is the output state, only switch when hitting 1 again
            FIRST: next_state = (x)? SEC : FIRST;
            //it will stuck at this state, until it hit 0, going back to orginial state
            //this state block the output, because we have multiple 1s linked together
            SEC: next_state = (x)? SEC : FIRST;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state = ZERO;
        else state = next_state;
    end

    assign z = (state==FIRST)? 1 : 0;

endmodule
