module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
	
    assign out_assign = a ^ b;

    always @(*) begin
        out_always_comb = a ^ b;
    end
    // 'posedge clk' means when clk change from 0 to 1
    // vice versa 'negedge clk' means when clk change from 1 to 0
    always @(posedge clk) begin
        out_always_ff = a ^ b;
    end
    
endmodule