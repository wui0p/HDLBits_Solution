module top_module(
    input clk,
    input in,
    input reset, 
    output [7:0] out_byte,
    output done
);

    /*
    This exercise is an extension to exercise 17
    */

    reg [1:0]state, next_state;
    //set reg of 'out_byte'
    reg [7:0]out_reg;
    parameter START = 0, READ = 1, FIN = 2, ERROR = 3;
    integer count;

    always @(*) begin
        case(state)
            START: next_state = (!in)? READ : START;
            READ: begin
                if(count > 8 && in) next_state = FIN;
                else if(count > 8 && !in) next_state = ERROR;
                else next_state = READ;
            end
            FIN: next_state = (!in)? READ : START;
            ERROR: next_state = (in)? START : ERROR;
        endcase
    end 

    always @(posedge clk) begin
        if(reset) begin
            state = START;
            count = 0;
        end else begin
            state = next_state;
            if(state==READ) begin
                //only when 'count' is larger than 0, it can find the address
                if(count > 0) out_reg[count-1] = in;
                count = count + 1;
            end else if(state==FIN || state==ERROR) count =0;
        end
    end

    assign done = (state==FIN)? 1 : 0;
    assign out_byte = (state==FIN)? out_reg : 0;

endmodule
