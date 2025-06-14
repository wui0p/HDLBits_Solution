module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);

    //we use the implemented module's port name as dirrections
    //thus we don't have to place the input and output by order, just match the ports name
    mod_a insta (.in1(a),.in2(b),.in3(c),.in4(d),.out1(out1),.out2(out2));
    
endmodule