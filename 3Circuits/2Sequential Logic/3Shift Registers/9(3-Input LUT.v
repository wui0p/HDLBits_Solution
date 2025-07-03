module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    //set a reg 'Q' from 0 ~ 7
    reg [7:0]Q;

    //assign 'Z' to {A,B,C} of 'Q'
    assign Z = Q[{A,B,C}];

    //this require to be blocking
    always @(posedge clk) begin
        if(enable) begin
            //first left shift
            Q = Q << 1;
            //then set rightmost bit to input 'S'
            Q[0] = S;  
        end
    end

endmodule
