module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );

    //set reg answer as storing values
    reg [2:0]out_both_reg;
    reg [3:1]out_any_reg;
    reg [3:0]out_different_reg;
    integer i;
    always @(in) begin
        //reset all the variables when executing again
        out_both_reg = 0;
        out_any_reg = 0;
        out_different_reg = 0;
        
        for (i=0 ; i<=2 ; i=i+1)
            if(in[i] && in[i+1]) out_both_reg[i]=1;
        for (i=3 ; i>=1 ; i=i-1)
            if(in[i] || in[i-1]) out_any_reg[i] = 1;
        for (i=0 ; i<=2 ; i=i+1)
            if(in[i] != in[i+1]) out_different_reg[i] = 1;
        //exclude last 'in' bit for out_different_reg because it does not match the for loop
        if(in[3] != in[0]) out_different_reg[3] = 1;
    end

    //remember to assign your reg answer to output
    assign out_both = out_both_reg;
    assign out_any = out_any_reg;
    assign out_different = out_different_reg;
    
endmodule