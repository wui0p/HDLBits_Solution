module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    /*
    This exercise has the same logic as exercise 25
    Removing the always block of 'state=next_state'
    */
    
    //set 'next_state' into 'Y'
    reg [2:0]Y;

    always @(*) begin
        case(y)
            3'b000: Y = (x)? 3'b001 : 3'b000;
            3'b001: Y = (x)? 3'b100 : 3'b001;
            3'b010: Y = (x)? 3'b001 : 3'b010;
            3'b011: Y = (x)? 3'b010 : 3'b001;
            3'b100: Y = (x)? 3'b100 : 3'b011;
        endcase
    end

    //directly assign output 'Y0' to reg next state 'Y[0]'
    assign Y0 = Y[0];
    assign z = (y==3'b011 || y==3'b100)? 1 : 0;

endmodule
