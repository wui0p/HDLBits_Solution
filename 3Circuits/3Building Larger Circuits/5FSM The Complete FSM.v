module top_module (
    input clk,
    input reset,   
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );

    /*
    This exercise is the combination of the previous exercises
    From exercise 2 ~ 4, we use the logic from them to create this circuit
    */

    reg [2:0]state, next_state;
    parameter READ1=0, READ2=1, READ3=2, READ4=3, WAIT=4, CHECK=5, FIN=6;
    integer count;

    always @(*) begin
        //from exrcise 3
        case(state)
            READ1: next_state = (data)? READ2 : READ1;
            READ2: next_state = (data)? READ3 : READ1;
            READ3: next_state = (!data)? READ4 : READ3;
            READ4: next_state = (data)? WAIT : READ1;
            //this cirucit we put 'count=count+1' and condition after posedge clk
            //therefore we have to check 'count=4' and not 3
            WAIT: next_state = (count==4)? CHECK : WAIT;
            CHECK: next_state = (done_counting)? FIN : CHECK;
            FIN: next_state = (ack)? READ1 : FIN;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state = READ1;
            count = 0;
        end else begin
            state = next_state;
            if(state==WAIT) count = count + 1;
            else if(state==CHECK) count = 0;
        end
    end

    assign shift_ena = (state==WAIT)? 1 : 0;
    assign counting = (state==CHECK)? 1 : 0;
    assign done = (state==FIN)? 1 : 0;

endmodule
