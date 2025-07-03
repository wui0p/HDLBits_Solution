module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);

    reg [7:0]pedge_reg;
    //set a reg variable for storing the in value before it changes
    reg [7:0]previous_in;
    integer i;

    //this always block need to be written with blocking (the code order does matter)
    always @(posedge clk) begin
        for(i=0 ; i<8 ; i=i+1) begin
            //if statement check 'in' changes from 0 to 1
            if(in[i] && !previous_in[i]) pedge_reg[i] = 1;
            //if not, output bits go back to 0
            else pedge_reg[i] = 0;
        end
        //refresh 'previous_in' to the newest 'in'
        previous_in = in;
    end

    //remember to give output wire the reg value
    assign pedge = pedge_reg;


endmodule
