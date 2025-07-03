module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    //set 'next_state' as 'Y'
    reg [6:1]Y;
    
    always @(*) begin
        //reset the next state 'Y' to 0 everytime it starts
        Y = 0;
        //it is one-hot FSM, therefore using if statements
        //because there may be multiple states at once, ex. y = 100101
        if(y[1]) begin
            if(w) Y[1] = 1;
            else Y[2] = 1;
        end
        if(y[2]) begin
            if(w) Y[4] = 1;
            else Y[3] = 1;
        end
        if(y[3]) begin
            if(w) Y[4] = 1;
            else Y[5] = 1;
        end
        if(y[4]) begin
            if(w) Y[1] = 1;
            else Y[6] = 1;
        end
        if(y[5]) begin
            if(w) Y[4] = 1;
            else Y[5] = 1;
        end
        if(y[6]) begin
            if(w) Y[4] = 1;
            else Y[3] = 1;
        end
    end

    //directly assign wire output to the reg next state bit
    assign Y2 = Y[2];
    assign Y4 = Y[4];

endmodule
