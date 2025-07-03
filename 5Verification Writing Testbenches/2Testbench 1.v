module top_module ( output reg A, output reg B );//

    //list out all the delays by hand
    initial begin
        A = 0;
        B = 0;
        #10 A = 1;
        //it is '#5' not '#15' is because it overlap with previous delay
        //the previous delay is 10, now you only need to delay 5
        #5 B = 1;
        #5 A = 0;
        #20 B = 0;
    end

endmodule
