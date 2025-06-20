module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    //set vector wire for connecting modules together
    wire [2:0]in;
    //this exercise only require 4 modules, therefore do not really need for loop
    bcd_fadd insta1(a[3:0],b[3:0],cin,in[0],sum[3:0]);
    bcd_fadd insta2(a[7:4],b[7:4],in[0],in[1],sum[7:4]);
    bcd_fadd insta3(a[11:8],b[11:8],in[1],in[2],sum[11:8]);
    bcd_fadd insta4(a[15:12],b[15:12],in[2],cout,sum[15:12]);

endmodule
