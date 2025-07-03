module top_module(
    input clk,
    input areset,
    input j,
    input k,
    output out); 

    /*
    This exercise has the same logic as exercise 1
    */

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        //in this exercise we change it to case statement
        case(state)
            OFF: begin
                if(j) next_state = ON;
                else if(!j) next_state = OFF;
                else next_state = next_state;
            end
            ON: begin
                if(k) next_state = OFF;
                else if(!k) next_state = ON;
                else next_state = next_state;
            end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state = OFF;
        else state = next_state;
    end

    assign out = (state)? 1 : 0;

endmodule
