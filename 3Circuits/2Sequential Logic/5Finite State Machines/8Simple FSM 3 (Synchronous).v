module top_module(
    input clk,
    input in,
    input reset,
    output out);

    /*
    This exercise has the same logic as exercise 7
    */

    reg [1:0]state;
    reg [1:0]next_state;
    parameter A=0, B=1, C=2, D=3;

    always @(*) begin
        case(state)
            A: begin
                if(in) next_state = B;
                else next_state = A;
            end
            B: begin
                if(in) next_state = B;
                else next_state = C;
            end
            C: begin
                if(in) next_state = D;
                else next_state = A;
            end
            D: begin
                if(in) next_state = B;
                else next_state = C;
            end
        endcase
    end

    //remove posedge reset, because it is synchronous reset
    always @(posedge clk) begin
        if(reset) state = A;
        else state = next_state;
    end

    assign out = (state == D)? 1 : 0;

endmodule
