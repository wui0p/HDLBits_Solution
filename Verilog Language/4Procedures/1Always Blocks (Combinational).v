module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);

    //assign can only give value to wire
	assign out_assign = a & b;

    //always block can give reg or wire value
    //using '*' as the condition means whenever a variable in the always block changes
    always @(*) begin
        out_alwaysblock = a & b;
    end
endmodule