module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);

    /*
    This exercise have the same logic as exercise 15
    */

    reg [31:0]previous_in;
    reg [31:0]out_reg;
    integer i;

    always @(posedge clk) begin
        //reset statement to be the upper if statement for priority
        if(reset) out_reg = 0;
        else begin
            for(i=0 ; i<32 ; i=i+1) begin
                //if statement check if 'in' change from 1 to 0
                if(!in[i] && previous_in[i]) out_reg[i] = 1;
                //we do not need an else statement, only reset will change 'out' to 0
            end
        end
        previous_in = in;
    end

    assign out = out_reg;

endmodule
