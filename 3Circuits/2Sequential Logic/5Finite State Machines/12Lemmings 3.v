module top_module(
    input clk,
    input areset,    
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    /*
    This exercise has the same logic as exercise 11
    */

    //this time we do not need to expend the size of state
    //because 2 bits are still enough for 4 different states
    reg [1:0]state, next_state;
    reg previous;
    parameter LEFT = 0, RIGHT = 1, DROP = 2, DIG = 3;

    always @(*) begin
        case(state)
            LEFT: begin
                previous = LEFT;
                if(!ground) next_state = DROP;
                // 'dig' has lower priority than 'ground'
                else if(dig) next_state = DIG;
                else if(bump_left && bump_right) next_state = !state;
                else if(bump_left) next_state = RIGHT;
                else next_state = LEFT;
            end
            RIGHT: begin
                previous = RIGHT;
                if(!ground) next_state = DROP;
                else if(dig) next_state = DIG;
                else if(bump_left && bump_right) next_state = !state;
                else if(bump_right) next_state = LEFT;
                else next_state = RIGHT;
            end
            DROP: begin
                //we do not need to impliment 'dig' to DROP, because you can not dig when falling
                if(ground) begin
                    if(previous==LEFT) next_state = LEFT;
                    else next_state = RIGHT;
                end else next_state = DROP;
            end
            DIG: begin
                //when enter DIG state, you only can enter DROP state as the next state
                //therefore only when 'ground=0' we will need 'next_state=DROP'
                if(ground) next_state = DIG;
                else next_state = DROP;
            end
        endcase
    end


    always @(posedge clk, posedge areset) begin
        if(areset) state = LEFT;
        else state = next_state;
    end

    assign walk_left = (state==LEFT)? 1 : 0;
    assign walk_right = (state==RIGHT)? 1 : 0;
    assign aaah = (state==DROP)? 1 : 0;
    assign digging = (state==DIG)? 1 : 0;

endmodule
