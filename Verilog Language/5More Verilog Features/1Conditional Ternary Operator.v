module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    wire [7:0]comp1,comp2;
    //create 2 comparator 'comp1' and 'comp2'
    assign comp1 = (a<b)? a : b;
    assign comp2 = (c<d)? c : d;
    //using the value of 'comp1' and 'comp2' to another comparator
    //the final value will be the smallest variable
    assign min = (comp1<comp2)? comp1 : comp2;

endmodule