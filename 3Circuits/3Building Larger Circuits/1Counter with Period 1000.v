module top_module (
    input clk,
    input reset,
    output [9:0] q);

    //use integer for counting
    integer count;

    always @(posedge clk) begin
        if(reset) count = 0;
        else begin
            //when 'count' reaches max (which is 999 in this exercise)
            //then reset the integer 'count'
            if(count==999) count = 0;
            else count = count + 1;
        end
    end
    
    //remember to assign the output 'q' to integer 'count'
    assign q = count;

endmodule
