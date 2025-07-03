module top_module (
    input clk,
    input reset, 
    input x,
    output z
);

    reg [2:0]state, next_state;
    
    always @(*) begin
        case(state)
            3'b000: next_state = (x)? 3'b001 : 3'b000;
            3'b001: next_state = (x)? 3'b100 : 3'b001;
            3'b010: next_state = (x)? 3'b001 : 3'b010;
            3'b011: next_state = (x)? 3'b010 : 3'b001;
            3'b100: next_state = (x)? 3'b100 : 3'b011;
        endcase
    end

    always @(posedge clk) begin
        if(reset) state = 3'b000;
        else state = next_state;
    end

    //there are 2 states conditions that output 'z=1', others are output are 0
    assign z = (state==3'b011 || state==3'b100)? 1 : 0;

endmodule
