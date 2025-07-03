module top_module (
    input clk,    
    input d,
    output reg q );

    //condition of execute this always block is posedge of a clk
    //posedge means from 0 to 1
    always @(posedge clk) begin
        //give reg 'q' the value of 'd' (non-blocking)
        q <= d;
    end

endmodule
