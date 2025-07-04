module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output reg [1:0] state
);

    always @(posedge clk, posedge areset) begin
        //reset the 'state' to 2'b01, because the exercise told us so
        if(areset) state = 2'b01;
        //only when 'train_valid=1' we need to change the values
        else if(train_valid) begin
            if(train_taken) begin
                //when 'state' is not the max will it need to increase its value
                if(state != 2'b11) state = state + 1;
            end else begin
                //vice versa
                if(state != 2'b00) state = state - 1;
            end
        end
    end

endmodule
