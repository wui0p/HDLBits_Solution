module top_module(
    input clk,
    input areset,
    input in,
    output out);

    parameter A=0, B=1; 
    reg state, next_state;

    //this is the main FSM always block
    always @(*) begin
        //normally we use case statement for 'state'
        //but in this exercise we only have 2 states, therefore I use if statement
        if(state == A) begin
            if(in) next_state = A;
            else if(!in) next_state = B;
            //this let 'next_state' stay the same if 'in' is not given
            //in this exercise this is not needed, but used for FPGA
            else next_state = next_state;
        end else if(state == B) begin
            if(in) next_state = B;
            else if(!in) next_state = A;
            else next_state = next_state;
        end
    end

    //this always block work for reset and changing states
    always @(posedge clk, posedge areset) begin
        //if reset, then state set to B
        if(areset) state = B;
        //set 'state' to the 'next_state' for every posedge clk
        else state = next_state;
    end

    //assign 'out' determine by 'state'
    //which 'state=1=B' then 'out=1', vice versa for 'out=0'
    assign out = (state)? 1 : 0;

endmodule
