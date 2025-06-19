module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    reg [99:0]cin_new;
    genvar i;
    generate
        //for BCD adder we need an isolated initial module 'insta1'
        bcd_fadd insta1 (a[3:0],b[3:0],cin,cin_new[0],sum[3:0]);

        //use for loop to create the rest module
        for(i=4 ; i<=396 ; i=i+4) begin: ball_insta
            bcd_fadd insta (a[3+i:i],b[3+i:i],cin_new[(i/4)-1],cin_new[i/4],sum[3+i:i]);
        end
    endgenerate

    //assign the reg answer to output
    assign cout = cin_new[99];
    
endmodule