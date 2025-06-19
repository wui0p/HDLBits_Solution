module top_module ( input a, input b, output out );
    //call a build-in (in the HDLBits's server folder) module 'insta'
    mod_a insta(a,b,out);
endmodule