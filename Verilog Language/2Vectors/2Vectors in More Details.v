`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );

    //assign output with multiple vector bits
    //vec[a:b], which a>b, assigning b to a bit ports
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
    
endmodule