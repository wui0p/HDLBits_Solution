module top_module (
    input clk,
    input reset,      
    output shift_ena);

    //set integer for counting posedge clk cycle
    integer count;

    always @(posedge clk) begin
        if(reset) begin
            //when reset, output 'shift_ena' also have to go to 1
            count = 0;
            shift_ena = 1;
        end else begin
            if(count==3) shift_ena = 0;
            else begin
                //only when first 4 cycle we need to count
                count = count + 1;
                shift_ena = 1;
            end
        end

    end

endmodule
