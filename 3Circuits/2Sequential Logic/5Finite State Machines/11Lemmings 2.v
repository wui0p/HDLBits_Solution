module top_module(
    input clk,
    input areset,    
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    
    /*
    This exercise has the same logic as exercise 10
    */

    //expend the state reg into 2 bits
    reg [1:0]state, next_state;
    //set a reg to store previous state
    reg previous;
    parameter LEFT = 0, RIGHT = 1, DROP = 2;

    always @(*) begin
        case(state)
            LEFT: begin
                //everytime 'state' is exam, we set the 'previous'
                previous = LEFT;
                //this time ground have the higher priority, therefore we set as first if statement
                if(!ground) next_state = DROP;
                else if(bump_left && bump_right) next_state = !state;
                else if(bump_left) next_state = RIGHT;
                else next_state = LEFT;
            end
            RIGHT: begin
                previous = RIGHT;
                if(!ground) next_state = DROP;
                else if(bump_left && bump_right) next_state = !state;
                else if(bump_right) next_state = LEFT;
                else next_state = RIGHT;
            end
            DROP: begin
                if(ground) begin
                    if(previous==LEFT) next_state = LEFT;
                    else next_state = RIGHT;
                end else next_state = DROP;
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

endmodule
