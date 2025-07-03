module top_module (
    input clk,
    input reset,  
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );

    /*
    This exercise has similar logic as exercise 5
    */

    reg [3:0]delay;
    reg [3:0]state, next_state;
    parameter READ1=0, READ2=1, READ3=2, READ4=3, DELAY0=4, DELAY1=5, DELAY2=6, DELAY3=7, WAIT=8, FIN=9;
    //set integer for counter in state WAIT and counter for output 'count'
    integer waiting, counter;

    always @(*) begin
        case(state)
            READ1: next_state = (data)? READ2 : READ1;
            READ2: next_state = (data)? READ3 : READ1;
            READ3: next_state = (!data)? READ4 : READ3;
            READ4: next_state = (data)? DELAY0 : READ1;
            //we expand DELAY to individual state, because storing values in 'delay'
            DELAY0: begin
                next_state = DELAY1;
                delay[3] = data;
            end
            DELAY1: begin
                next_state = DELAY2;
                delay[2] = data;
            end
            DELAY2: begin
                next_state = DELAY3;
                delay[1] = data;
            end
            DELAY3: begin
                next_state = WAIT;
                delay[0] = data;
            end
            WAIT: next_state = (waiting==((delay + 1)*1000))? FIN : WAIT;
            FIN: next_state = (ack)? READ1 : FIN;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state = READ1;
            waiting = 0;
            counter = 0;
        end else begin
            state = next_state;
            if(state==WAIT) begin
                waiting = waiting + 1;
                //calculate the output 'count' be minus it from out cycle counter 'waiting'
                counter = ((delay + 1)*1000 - waiting)/1000;
            end
            else if(state==FIN) begin
                //reset all the integers
                waiting = 0;
                counter = 0;
            end
        end
    end

    assign count = counter;
    assign counting = (state==WAIT)? 1 : 0;
    assign done = (state==FIN)? 1 : 0;
    
endmodule
