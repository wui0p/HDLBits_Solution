module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    //use input 'cin' as 'cin' for insta1
    full_adder insta1(a[0],b[0],cin,cout[0],sum[0]);
    //use the previous 'cout' as 'cin'
    full_adder insta2(a[1],b[1],cout[0],cout[1],sum[1]);
    full_adder insta3(a[2],b[2],cout[1],cout[2],sum[2]);

endmodule

//create module for top_module to set instances
//from execerise 2 (Full Adder)
module full_adder(input a,input b,input cin,output cout,output sum);
    assign {cout,sum} = a + b + cin;
endmodule