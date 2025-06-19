module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    //use '{}' to combine bits into a larger value
    //normally bit length should be the same
    //if not equal, it will make up with 0
    assign {w,x,y,z} = {a,b,c,d,e,f,2'b11};

endmodule