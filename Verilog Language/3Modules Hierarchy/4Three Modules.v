module top_module ( input clk, input d, output q );

    //declare additional wire for implemented modules
	wire q1, q2;

    //three different modules and connecting them together
    my_dff insta1 (clk,d,q1);
    my_dff insta2 (clk,q1,q2);
    my_dff insta3 (clk,q2,q);
    
endmodule