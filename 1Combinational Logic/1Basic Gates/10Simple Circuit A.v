module top_module (input x, input y, output z);
    
    //use '()' to let code know which one to operate first
    assign z = (x^y) & x;

endmodule