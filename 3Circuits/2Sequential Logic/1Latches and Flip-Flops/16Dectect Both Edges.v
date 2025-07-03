module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);

    /*
    This exercise have the same logic design as exercise 15
    */

    reg [7:0]pedge_reg;
    reg [7:0]previous_in;
    integer i;

    always @(posedge clk) begin
        for(i=0 ; i<8 ; i=i+1) begin
            //we only change this if statement's condition
            //changing it to when 'in' is not equal to 'previous_in' then execute
            //which is the condition of 0 to 1 or 1 to 0
            if(in[i] != previous_in[i]) pedge_reg[i] = 1;
            else pedge_reg[i] = 0;
        end
        previous_in = in;
    end

    assign anyedge = pedge_reg;

endmodule
