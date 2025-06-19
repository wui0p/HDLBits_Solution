module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
	
    //implement module from folder, placing input and output ports in the correct positions 
    //we place the by order, then code will automatically inport it to the ports
    mod_a insta (out1,out2,a,b,c,d);
    
endmodule