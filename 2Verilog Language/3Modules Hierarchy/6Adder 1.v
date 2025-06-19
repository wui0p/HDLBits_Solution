module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    //connecting modules together
    wire [15:0]sum1,sum2;
    wire cout;
    add16 insta1 (a[15:0],b[15:0],0,sum1,cout);
    add16 insta2 (a[31:16],b[31:16],cout,sum2);
    
    //output then merge the sums together
    assign sum = {sum2,sum1};
    
endmodule