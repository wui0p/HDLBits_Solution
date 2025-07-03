module top_module(
    input clk,
    input reset,
    input in,
    output disc,
    output flag,
    output err);

    reg [2:0]state, next_state;
    //set different states for 3 different output respectively
    parameter START = 0, READ = 1, OUT_D = 2, OUT_F = 3, OUT_E = 4;
    //set integer for counting the 1 between 0
    integer count;

    always @(*) begin
        case(state)
            START: next_state = (in)? READ : START;
            READ: begin
                if(!in && count==5) next_state = OUT_D;
                else if(!in && count==6) next_state = OUT_F;
                //when 'count=6' and 'in=1' then that mean there is seven 1 bits
                //therefore it is error, state change to OUT_E 
                else if(in && count==6) next_state = OUT_E;
                //if the 1 is not full, then go back to START
                else if(!in && count<6) next_state = START;
                else next_state = READ;
            end
            OUT_D: next_state = (in)? READ : START;
            OUT_F: next_state = (in)? READ : START;
            //error state have to be latch to itself until hit 0
            OUT_E: next_state = (!in)? START : OUT_E;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            state = START;
            count = 0;
        end else begin
            state = next_state;
            if(state==READ) count = count + 1;
            else count = 0;
        end
    end

    assign disc = (state==OUT_D)? 1 : 0;
    assign flag = (state==OUT_F)? 1 : 0;
    assign err = (state==OUT_E)? 1 : 0;

endmodule
