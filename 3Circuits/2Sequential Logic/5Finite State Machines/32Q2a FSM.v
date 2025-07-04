module top_module (
    input clk,
    input resetn,    
    input [3:1] r,   
    output [3:1] g   
); 

    reg [1:0]state, next_state;
    parameter A=0, B=1, C=2, D=3;

    always @(*) begin
        case(state)
            //we use if statement in state A is because of priority
            A: begin
                if(r[1]) next_state = B;
                else if(r[2]) next_state = C;
                else if(r[3]) next_state = D;
                else next_state = A;
            end
            B: next_state = (r[1])? B : A;
            C: next_state = (r[2])? C : A;
            D: next_state = (r[3])? D : A;
        endcase
    end
    
    always @(posedge clk) begin
        if(!resetn) state = A;
        else state = next_state;
    end

    //assign output bits individually
    assign g[1] = (state==B)? 1 : 0;
    assign g[2] = (state==C)? 1 : 0;
    assign g[3] = (state==D)? 1 : 0;

endmodule
