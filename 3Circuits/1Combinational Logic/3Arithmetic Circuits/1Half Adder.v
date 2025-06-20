module top_module( 
    input a, b,
    output cout, sum );

    //using '{}' to combine two variable as one vector
    //half adder do not have to consider 'cin' from other modules
    assign {cout,sum} = a + b;
    
endmodule