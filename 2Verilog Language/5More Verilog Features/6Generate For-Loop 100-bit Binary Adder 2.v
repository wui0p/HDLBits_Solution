module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    full_add insta1 (a[0],b[0],cin,sum[0],cout[0]);
    
    //use genvar as integer if using in generate
    //use generate for implementing modules in a for loop
    //remember to name the for loop when implementing modules, ex 'all_insta'
    genvar i;
    generate
        for(i=1 ; i<100 ; i=i+1) begin: all_insta
            full_add insta (a[i],b[i],cout[i-1],sum[i],cout[i]);
        end
    endgenerate
    
endmodule

//create a module for full 1-bit adder
module full_add(input a, input b, input cin, output sum, output cout);
    assign {cout,sum} = a + b + cin;
endmodule