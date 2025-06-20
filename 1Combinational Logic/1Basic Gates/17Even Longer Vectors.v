module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
    
    /*
    This exercise is the same as exercise 16 (Gates and Vectors)
    The only difference is input and output is a longer vector
    */

    //set reg answer for storing values
    reg [98:0]out_both_reg;
    reg [99:1]out_any_reg;
    reg [99:0]out_different_reg;
    integer i;

    always @(in) begin
        //reset all variable when execute again
        out_both_reg = 0;
        out_any_reg = 0;
        out_different_reg = 0;

        for (i=0 ; i<=98 ; i=i+1)
            if(in[i] && in[i+1]) out_both_reg[i]=1;
        for (i=99 ; i>=1 ; i=i-1)
            if(in[i] || in[i-1]) out_any_reg[i] = 1;
        for (i=0 ; i<=98 ; i=i+1)
            if(in[i] != in[i+1]) out_different_reg[i] = 1;
        //exclude last 'in' bit for out_different_reg because it does not match the for loop
        if(in[99] != in[0]) out_different_reg[99] = 1;
    end

    //remember to assign reg answer to output
    assign out_both = out_both_reg;
    assign out_any = out_any_reg;
    assign out_different = out_different_reg;
    
endmodule