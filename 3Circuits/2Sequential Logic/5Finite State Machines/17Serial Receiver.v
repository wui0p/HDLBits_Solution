module top_module(
    input clk,
    input in,
    input reset,
    output done
); 

    /*
    This exercise has a similar logic as exercise 15
    */

    reg [1:0]state, next_state;
    parameter START = 0, READ = 1, FIN = 2, ERROR = 3;
    integer count;

    always @(*) begin
        case(state)
            START: next_state = (!in)? READ : START;
            READ: begin
                //we use if statement because in 'in=0' it will enter ERROR
                if(count > 8 && in) next_state = FIN;
                else if(count > 8 && !in) next_state = ERROR;
                else next_state = READ;
            end
            FIN: next_state = (!in)? READ : START;
            //when it is an ERROR, then it latches to ERROR until 'in=1'
            ERROR: next_state = (in)? START : ERROR;
        endcase
    end 

    always @(posedge clk) begin
        if(reset) begin
            state = START;
            count = 0;
        end else begin
            state = next_state;
            if(state==READ) count = count + 1;
            else if(state==FIN || state==ERROR) count =0;
        end
    end

    // 'done' will rise when state enter 'FIN', but not ERROR
    assign done = (state==FIN)? 1 : 0;

endmodule
