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
    This exercise has the same logic as exercise 12
    BUT!! In this exercise 'previous' will not work properly because of DEAD
    You can edit the previous exercise for RIGHT/LEFT states for DROP/LEFT
    Because it is more fool proof than using 'previous'
    */

    //we need to increase the 'state' bits, for DEAD and LEFT/RIGHT of DROP/DIG
    reg [2:0]state, next_state;
    parameter LEFT = 0, RIGHT = 1, DROP_L = 2, DROP_R = 3, DIG_L = 4, DIG_R = 5, DEAD = 6;
    integer drop_length;

    always @(*) begin
        case(state)
            LEFT: begin
                if(!ground) next_state = DROP_L;
                else if(dig) next_state = DIG_L;
                else if(bump_left && bump_right) next_state = !state;
                else if(bump_left) next_state = RIGHT;
                else next_state = LEFT;
            end
            RIGHT: begin
                if(!ground) next_state = DROP_R;
                else if(dig) next_state = DIG_R;
                else if(bump_left && bump_right) next_state = !state;
                else if(bump_right) next_state = LEFT;
                else next_state = RIGHT;
            end
            DROP_L: begin
                //it need to drop for long enough and hit ground, thus AND logic with 'ground=1'
                if(drop_length >= 20 && ground) next_state = DEAD;
                else if(ground) next_state = LEFT;
                else next_state = DROP_L;
            end
            DROP_R: begin
                if(drop_length >= 20 && ground) next_state = DEAD;
                else if(ground) next_state = RIGHT;
                else next_state = DROP_R;
            end
            DIG_L: begin
                if(ground) next_state = DIG_L;
                else next_state = DROP_L;
            end
            DIG_R: begin
                if(ground) next_state = DIG_R;
                else next_state = DROP_R;
            end
            //stuck at DEAD state when death
            DEAD: next_state = DEAD;
        endcase
    end

    //we need a new always block, because this do not need 'areset'
    always @(posedge clk) begin
        if(state==DROP_L || state==DROP_R) drop_length = drop_length + 1;
        //reset everytime 'state' is not in DROP
        else drop_length = 0;
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state = LEFT;
        else state = next_state;
    end

    assign walk_left = (state==LEFT)? 1 : 0;
    assign walk_right = (state==RIGHT)? 1 : 0;
    assign aaah = (state==DROP_L || state==DROP_R)? 1 : 0;
    assign digging = (state==DIG_L || state==DIG_R)? 1 : 0;

endmodule
