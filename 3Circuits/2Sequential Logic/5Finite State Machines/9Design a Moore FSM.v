module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 

    reg [1:0]state = 0;
    reg [1:0]next_state = 0;
    //this reg is for controlling the dfr
    reg rise;
    reg next_rise;
    //set the 4 kind of state required
    parameter BELOW = 0, B21 = 1, B32 = 2, ABOVE = 3;

    always @(*) begin
        //this line of code is crucial, used for reseting 'next_rise' when we reset 'rise' to 0, but not 'next_rise'
        //if 'next_rise' is not reset, then 'rise' will go back to original even when reset
        if(rise!=next_rise) next_rise = rise;
        //FSM always block
        case(state)
            BELOW: begin
                if(s[1]==1) begin
                    next_state = B21;
                    next_rise = 0;
                //else statement latch 'next_state' to orginial state
                end else next_state = BELOW;
            end
            B21: begin
                if(s[2]==1) begin 
                    next_state = B32;
                    next_rise = 0;
                end else if(s[1]==0) begin
                    next_state = BELOW;
                    next_rise = 1;
                end else next_state = B21;
            end
            B32: begin
                if(s[3]==1) begin
                    next_state = ABOVE;
                    next_rise = 0;
                end else if(s[2]==0) begin
                    next_state = B21;
                    next_rise = 1;
                end else next_state = B32;
            end
            ABOVE: begin
                if(s[3]==0) begin 
                    next_state = B32;
                    next_rise = 1;
                end else next_state = ABOVE;
            end
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state = BELOW;
            rise = 0;
        end else begin
            state = next_state;
            rise = next_rise;
        end
    end

    //output rules
    assign fr3 = (state == BELOW)? 1 : 0;
    assign fr2 = (state == BELOW || state == B21)? 1 : 0;
    assign fr1 = (state == BELOW || state == B21 || state ==B32)? 1 : 0;
    //when 'fr3' is high then 'dfr' also have to be high, therefore it is a OR with our control reg 'rise'
    assign dfr = (rise || fr3)? 1 : 0;

endmodule
