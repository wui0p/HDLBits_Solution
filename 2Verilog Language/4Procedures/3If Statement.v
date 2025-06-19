module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    
    //you can only use '?' as if statment for assign
    assign out_assign = (sel_b1 && sel_b2)? b : a;

    //you can use 'if', 'else if', 'else' for always block
    always @(*) begin
        if(sel_b1 && sel_b2) out_always = b;
        else out_always = a;
    end
    
endmodule