module top_module(
    input clk,
    input areset,

    input  predict_valid,
    input  [6:0] predict_pc,
    output predict_taken,
    output [6:0] predict_history,

    input train_valid,
    input train_taken,
    input train_mispredicted,
    input [6:0] train_history,
    input [6:0] train_pc
);

    reg [1:0]pht [0:127];
    //set reg version of output 'predict_history'
    reg [6:0]history_reg;
    //set a wire for the array of output 'predict_taken'
    wire [1:0]predict_count;
    //set integer for for loop when reseting, because pht is a 128 sized array
    integer i;

    always @(posedge clk, posedge areset) begin
        if(areset) begin
            history_reg = 0;
            for(i=0 ; i<128 ; i=i+1) begin
                pht[i] = 2'b01;
            end
        end else begin
            //training have a higher priority, thus the first if statement
            if(train_valid) begin
                case(pht[train_pc ^ train_history])
                    2'b00: pht[train_pc ^ train_history] = (train_taken)? 2'b01 : 2'b00;
                    2'b01: pht[train_pc ^ train_history] = (train_taken)? 2'b10 : 2'b00;
                    2'b10: pht[train_pc ^ train_history] = (train_taken)? 2'b11 : 2'b01;
                    2'b11: pht[train_pc ^ train_history] = (train_taken)? 2'b11 : 2'b10;
                endcase
                //when in trainging, we also need to check for shifting
                if(train_mispredicted) history_reg = (train_history << 1) + train_taken;
                else if(predict_valid) history_reg = (history_reg << 1) + predict_taken;
            //only when 'predict_valid=1' we need to shift
            end else if(predict_valid) begin
                history_reg = (history_reg << 1) + predict_taken;
            end
        end
    end

    assign predict_count = pht[predict_pc ^ predict_history];
    //the prediction is the first bit of our set wire 'predict_count'
    assign predict_taken = predict_count[1];
    assign predict_history = history_reg;

endmodule
