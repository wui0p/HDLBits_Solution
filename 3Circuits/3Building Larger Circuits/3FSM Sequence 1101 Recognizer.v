module top_module (
    input clk,
    input reset,
    input data,
    output start_shifting);

    reg [2:0]state, next_state;
    
    always @(*) begin
        case(state)
            0: next_state = (data)? 1 : 0;
            1: next_state = (data)? 2 : 0;
            //when 'data=0', then next state, but when 'data=1' we stay at the same state
            //because the first sequence is 11, now you get 111, which still satisfied state 0/1
            2: next_state = (!data)? 3 : 2;
            3: next_state = (data)? 4 : 0;
            4: next_state = 4;
        endcase
    end

    always @(posedge clk) begin
        if(reset) state = 0;
        else state = next_state;
    end

    assign start_shifting = (state==4)? 1 : 0;

endmodule
