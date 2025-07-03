module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

    always @(posedge clk) begin
        //use if statement to dd mux
        if(L) Q <= r_in;
        else Q <= q_in;
    end

endmodule
