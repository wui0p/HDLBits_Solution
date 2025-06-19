module top_module( 
    input a,b,c,
    output w,x,y,z );

    //individually connecting input a,b,c to wire output
    assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;
    
endmodule