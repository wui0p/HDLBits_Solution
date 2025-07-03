module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out);

    parameter A=0, B=1, C=2, D=3;

    //state transition logic
    always @(*) begin
        //this exercise have more states, therefore we use case
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

    //output logic
    assign out = (state == D)? 1 : 0;

endmodule
