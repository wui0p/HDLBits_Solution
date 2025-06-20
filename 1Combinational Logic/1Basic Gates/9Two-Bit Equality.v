module top_module ( input [1:0] A, input [1:0] B, output z ); 
    
    // '==' is for logical use of equal, normally used for comparing
    // '=' is for assigning values (blocking)
    assign z = (A==B)? 1:0;

endmodule