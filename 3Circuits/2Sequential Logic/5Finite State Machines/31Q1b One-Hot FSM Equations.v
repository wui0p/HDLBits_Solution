module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);

    /*
    This exercise is almost the same as exercise 27
    The main difference is [6:1]y change to [5:0]y
    Thus editing the previous code is not the most beautiful way to solve this
    But it still does the work, you are encouraged to rewrite the code to fit better
    */

    //we leave next state 'Y' the same, because it is still 6 bit size
    reg [6:1]Y;
    
    always @(*) begin
        Y = 0;
        //change the if statement condition's 'y[i]'
        if(y[0]) begin
            if(!w) Y[1] = 1;
            else Y[2] = 1;
        end
        if(y[1]) begin
            if(!w) Y[4] = 1;
            else Y[3] = 1;
        end
        if(y[2]) begin
            if(!w) Y[4] = 1;
            else Y[5] = 1;
        end
        if(y[3]) begin
            if(!w) Y[1] = 1;
            else Y[6] = 1;
        end
        if(y[4]) begin
            if(!w) Y[4] = 1;
            else Y[5] = 1;
        end
        if(y[5]) begin
            if(!w) Y[4] = 1;
            else Y[3] = 1;
        end
    end

    //change the output name
    assign Y1 = Y[2];
    assign Y3 = Y[4];

endmodule
