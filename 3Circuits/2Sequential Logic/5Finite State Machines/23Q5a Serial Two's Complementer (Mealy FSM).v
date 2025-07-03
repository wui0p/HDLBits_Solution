module top_module (
    input clk,
    input areset,
    input x,
    output z
); 

    reg state, next_state;
    parameter A = 0, B = 1;

    always @(*) begin
        case(state)
            A: next_state = (x)? B : A;
            B: next_state = B;
        endcase
    end 

    always @(posedge clk, posedge areset) begin
        if(areset) state = A;
        else state = next_state;
    end

    //when 'state = a' then z=0,x=0 and z=1,x=1, which is z=x
    //the only else condition is 'state = b', which is z=!x
    assign z = (state==A)? x : !x;

endmodule
