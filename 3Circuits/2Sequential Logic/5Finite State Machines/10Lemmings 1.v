module top_module(
    input clk,
    input areset,
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); 

    reg state, next_state;
    parameter LEFT = 0, RIGHT = 1;

    always @(*) begin
        case(state)
        //you have to have both bump input as the first if statement
        //because it has overlapping condition to only one bump input is high
            LEFT: begin
                if(bump_left && bump_right) next_state = !state;
                else if(bump_left) next_state = RIGHT;
                //latch 'state' to original state
                else next_state = LEFT;
            end
            RIGHT: begin
                if(bump_left && bump_right) next_state = !state;
                else if(bump_right) next_state = LEFT;
                else next_state = RIGHT;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state = LEFT;
        else state = next_state;
    end

    assign walk_left = (state==LEFT)? 1 : 0;
    assign walk_right = (state==RIGHT)? 1 : 0;

endmodule
