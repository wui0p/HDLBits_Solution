module top_module (
    input clk,
    input reset,
    input w,
    output z);

    /*
    This exercise is almost the same as exercise 28
    */

    reg [2:0]state, next_state;
    parameter A=0, B=1, C=2, D=3, E=4, F=5;

    always @(*) begin
        case(state)
        //only the input 'w' condition switch, therefore add NOT gate
            A: next_state = (!w)? A : B;
            B: next_state = (!w)? D : C;
            C: next_state = (!w)? D : E;
            D: next_state = (!w)? A : F;
            E: next_state = (!w)? D : E;
            F: next_state = (!w)? D : C;
        endcase
    end

    always @(posedge clk) begin
        if(reset) state = A;
        else state = next_state;
    end

    assign z = (state==E || state==F)? 1 : 0;

endmodule
