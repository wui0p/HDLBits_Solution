module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0]sum1,sum2_0,sum2_1;
    wire cout;
    //implement modules and connect it together
    add16 insta1 (a[15:0],b[15:0],0,sum1,cout);
    add16 insta2 (a[31:16],b[31:16],0,sum2_0);
    add16 insta3 (a[31:16],b[31:16],1,sum2_1);
    
    //before output we choose which output ways we use
    assign sum = (cout)? {sum2_1,sum1}:{sum2_0,sum1};

/*
Using a multiplexer to decide which insta to use will increase the speed of the code.
If you used the method from the previous problem (Adder 2), directly inserting cout to add16, it 
will take longer to process,because it needs to wait for cout to start calculating sum2.
But if we use a multiplexer, it will can instantly choose to use which add16.
*/

endmodule