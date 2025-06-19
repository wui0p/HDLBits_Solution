module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
    
    //you can not use in[(4sel+4):(4sel)]
    //because Verilog does not allow variable part-selects using non-constant indices in this form
    assign out = in[4*sel +: 4];
    
endmodule