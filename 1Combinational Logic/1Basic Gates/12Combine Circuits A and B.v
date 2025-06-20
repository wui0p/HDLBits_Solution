module top_module (input x, input y, output z);

    wire z1,z2,z3,z4;
    //create all the wires using modules A and B
    A insta1 (x,y,z1);
    B insta2 (x,y,z2);
    A insta3 (x,y,z3);
    B insta4 (x,y,z4);
    //assign the wires for output
    assign z = (z1 | z2) ^ (z3 & z4);
    
endmodule

//these modules is from exercise 10 and 11 (Basic Gates)
module A ( input x, input y, output z );
    assign z = (x^y) & x;
endmodule

module B (input x, input y, output z);
    assign z = (x==y)? 1:0;
endmodule