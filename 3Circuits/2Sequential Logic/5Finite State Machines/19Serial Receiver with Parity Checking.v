module top_module(
    input clk,
    input in,
    input reset, 
    output [7:0] out_byte,
    output done
);

    /*
    This exercise is an extension to exercise 18
    */

    reg [1:0]state, next_state;
    reg [7:0]out_reg;
    //set 'odd' for parity module and 'check' for output allow condition
    reg odd, check;
    parameter START = 0, READ = 1, FIN = 2, ERROR = 3;
    integer count;

    parity insta(clk,!(state==READ),in,odd);

    always @(*) begin
        case(state)
            START: next_state = (!in)? READ : START;
            READ: begin
                //the 'count' max move from 8 to 9, because we have a additional parity bit
                if(count > 9 && in) next_state = FIN;
                else if(count > 9 && !in) next_state = ERROR;
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
                //now there is a higher priority if statement when 'count=9'
                //which when the parity module 'odd' use with parity cehck, which set 'check'
                if(count==9) check = (odd!=in)? 1 : 0;
                else if(count > 0) out_reg[count-1] = in;
                count = count + 1;
            end else if(state==FIN || state==ERROR) count =0;
        end
    end

    //add AND condition to assign output, only when 'check' also allows it
    assign done = (state==FIN && check)? 1 : 0;
    assign out_byte = (state==FIN && check)? out_reg : 0;

endmodule
