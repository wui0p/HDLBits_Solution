module top_module (
    input clk,
    input reset,
    input w,
    output z);

    /*
    This exercise has the same logic as exercise 26
    We only have to add always block for 'state=next_state'
    */

    reg [2:0]state, next_state;
    parameter A=0, B=1, C=2, D=3, E=4, F=5;

    always @(*) begin
        case(state)
            A: next_state = (w)? A : B;
            B: next_state = (w)? D : C;
            C: next_state = (w)? D : E;
            D: next_state = (w)? A : F;
            E: next_state = (w)? D : E;
            F: next_state = (w)? D : C;
        endcase
    end

    always @(posedge clk) begin
        if(reset) state = A;
        else state = next_state;
    end

    //remember to assign output 'z' with condition of 'state=E/F'
    assign z = (state==E || state==F)? 1 : 0;

endmodule
