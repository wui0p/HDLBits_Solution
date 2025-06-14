module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    //when making bitwise b[31:0] to sub
    //you have to make sub 32 bits of sub = {32{b}}
    //it then will correctly do XOR for all 32 bits
    wire [31:0]b_after;
    assign b_after = b ^ {32{sub}};
    
    //implement modules and connect it together
    wire [15:0]sum1,sum2;
    wire cout;
    add16 insta1 (a[15:0],b_after[15:0],sub,sum1,cout);
    add16 insta2 (a[31:16],b_after[31:16],cout,sum2);

    //output merge the sums together
    assign sum = {sum2,sum1};
    
endmodule