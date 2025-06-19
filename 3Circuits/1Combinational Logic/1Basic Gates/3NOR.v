module top_module (
    input in1,
    input in2,
    output out);

    // '|' is OR gate (bitwise)
    // '~' is NOT gate
    assign out = ~ (in1 | in2);
    
endmodule