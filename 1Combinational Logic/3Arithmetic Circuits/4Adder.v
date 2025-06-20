module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    
    wire [4:0]cin;
    //assign 'cin[0]' to 0 for insta1
    assign cin[0] = 0;
    genvar i;
    generate
        for(i=0 ; i<4 ; i=i+1) begin: FA_all
            full_adder insta(x[i],y[i],cin[i],cin[i+1],sum[i]);
        end
    endgenerate
    //set sum[4] to the 'cout' of the insta4, which is 'cin[4]'
    assign sum[4] = cin[4];

endmodule

//create module for top_module to set instances
//from execerise 2 (Full Adder)
module full_adder(input a,input b,input cin,output cout,output sum);
    assign {cout,sum} = a + b + cin;
endmodule