module top_module(
    input clk,
    input [7:0] in,
    input reset,
    output [23:0] out_bytes,
    output done);

    /*
    This exercise have the same logic as exercise 15
    */

    reg [1:0]state, next_state;
    //set reg 'out_bytes' as array of 3, every slot 8 bits
    reg [7:0]out_reg[0:2];
    parameter START = 0, READ = 1, FIN = 2;
    integer count;

    always @(*) begin
        case(state)
            START: next_state = (in[3])? READ : START;
            READ: next_state = (count == 3)? FIN : READ;
            FIN: next_state = (in[3])? READ : START;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            count = 1;
            state = START;
        end else begin
            state = next_state;
            if(state==READ) begin
                //this store 'out_reg[0]' and 'out_reg[1]'
                //no 'out_reg[2]' because when 'count=3' it will jump to state FIN
                out_reg[count-1] = in;
                count = count + 1;
            end else if(state==FIN) begin
                count = 1;
                //when 'state' reach FIN, set the last 'out_reg[2]'
                out_reg[2] = in;
            end
        end
    end

    assign done = (state==FIN)? 1 : 0;
    assign out_bytes = (state==FIN)? {out_reg[0],out_reg[1],out_reg[2]} : 0;

endmodule
