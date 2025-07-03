module top_module(
    input clk,
    input reset,
    input in,
    output out);

    /*
    This exercise has the same logic as exercise 1
    It only change asynchronous to synchronouse reset
    */

    parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin
        if(state == A) begin
            if(in) next_state = A;
            else if(!in) next_state = B;
            else next_state = next_state;
        end else if(state == B) begin
            if(in) next_state = B;
            else if(!in) next_state = A;
            else next_state = next_state;
        end
    end

    //we only have to remove posedge reset because this is synchronous
    always @(posedge clk) begin
        if(reset) state = B;
        else state = next_state;
    end

    assign out = (state)? 1 : 0;

endmodule
