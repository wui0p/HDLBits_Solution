module top_module ( input x, input y, output z );

    //when z=1, it is when (x,y)=(0,0) or (1,1)
    //which can be seen as when x=y, then z=1
    assign z = (x==y)? 1:0;

endmodule