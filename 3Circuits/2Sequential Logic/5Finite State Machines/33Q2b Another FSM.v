module top_module (
    input clk,
    input resetn, 
    input x,
    input y,
    output f,
    output g
); 

    //reg version of output, storing values
    reg f_reg, g_reg;
    reg [3:0]state, next_state;
    //START is for 'f', READ is for 101 sequence, MAIN is for 'y', LAST is to declare output 'g'
    parameter A=0, START=1, READ1=2, READ2=3, READ3=4, MAIN1=5, MAIN2=6, LAST_1=7, LAST_0=8;

    always @(*) begin
        case(state)
            A: next_state = START;
            START: next_state = READ1;
            READ1: next_state = (x)? READ2 : READ1;
            //READ2 will stay at READ2 if 'x=1' because READ1 is satisfied
            READ2: next_state = (!x)? READ3: READ2;
            READ3: next_state = (x)? MAIN1 : READ1;
            MAIN1: next_state = (y)? LAST_1 : MAIN2;
            MAIN2: next_state = (y)? LAST_1 : LAST_0;
            LAST_1: next_state = LAST_1;
            LAST_0: next_state = LAST_0;
        endcase
    end

    always @(posedge clk) begin
        if(!resetn) begin
            state = A;
            f_reg = 0;
            g_reg = 0;
        end else begin
            state = next_state;
            //only when state is START, then 'f=1', starting output
            if(state==START) f_reg = 1;
            else f_reg = 0;
            //when it reach MAIN1 then 'g=1'
            if(state==MAIN1) g_reg = 1;
            //only when state reach LAST_0 then 'g=0', otherwise always 1
            else if(state==LAST_0) g_reg = 0;
        end
    end

    assign f = f_reg;
    assign g = g_reg;

endmodule
