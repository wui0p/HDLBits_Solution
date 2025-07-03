module top_module(
    input clk,
    input [7:0] in,
    input reset,
    output done); 

    reg [1:0]state, next_state;
    parameter START = 0, READ = 1, FIN = 2;
    //this integer is used for counting the posedge clk after 'in[3]'
    integer count;

    always @(*) begin
        case(state)
            START: next_state = (in[3])? READ : START;
            READ: next_state = (count == 3)? FIN : READ;
            //this is the state that we indicate if READ is finished
            //we do not use 'next_state = START' is because it can have 'in[3]' right after
            //therefore we have to use the same statment as START
            //if it latch to FIN, then done will not be one clk pulse, therefore back to START
            FIN: next_state = (in[3])? READ : START;
        endcase
    end

    always @(posedge clk) begin
        if(reset) begin
            //we reset 'count' to 1 and not 0 is because it will jump right at 'count = 3'
            count = 1;
            state = START;
        end else begin
            state = next_state;
            if(state==READ) count = count + 1;
            //reset 'count' everytime READ is done
            else if(state==FIN) count = 1;
        end
    end

    assign done = (state==FIN)? 1 : 0;

endmodule
