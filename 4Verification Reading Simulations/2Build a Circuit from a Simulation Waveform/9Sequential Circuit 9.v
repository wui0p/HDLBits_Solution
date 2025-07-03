module top_module (
    input clk,
    input a,
    output [3:0] q );

    //from waveform we can derive it is some kind of counter
    //thus we set integer for counting the output 'q'
    integer count;

    always @(posedge clk) begin
        //everytime 'a=1' it reset 'q' to 4
        if (a) count = 4;
        else begin
            count = count + 1;
            //we also can see that it reset everyime 'q' is above 6
            if(count==7) count = 0;
        end
    end

    //remember to assign the output 'q' to counter
    assign q = count;

endmodule
