module top_module( 
    input a, b, cin,
    output cout, sum );

    //using '{}' to combine two variable as one vector
    //full adder need to include 'cin' as input
    //but the max output can only be 2'b11, therefore still two 1-bit outputs
    assign {cout,sum} = a + b + cin;
    
endmodule