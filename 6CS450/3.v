module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);

    always @(posedge clk, posedge areset) begin
        if(areset) predict_history = 0;
        else begin
            if(train_mispredicted) predict_history = (train_history << 1) + train_taken;
            //shift in 'predict_taken' from the LSB side to update the branch history
            //which means shift to the left and replace the last bit with 'predict_taken'
            else if(predict_valid) predict_history = (predict_history << 1) + predict_taken;
        end
    end

endmodule
