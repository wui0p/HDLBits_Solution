module top_module (
	input [2:0] SW,     
	input [1:0] KEY,    
	output [2:0] LEDR); 

    //set 'd' for all the input wire of DFF
    wire [2:0] d;
    // '?' work as a MUX for wires
    assign d[0] = (KEY[1])? SW[0] : LEDR[2];
    assign d[1] = (KEY[1])? SW[1] : LEDR[0];
    assign d[2] = (KEY[1])? SW[2] : (LEDR[1] ^ LEDR[2]);

    //every posedge clk, value of 'd' will be output to 'LEDR'
    always @(posedge KEY[0]) begin
        LEDR = d;
    end

endmodule
