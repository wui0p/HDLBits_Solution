module top_module (
    input in1,
    input in2,
    input in3,
    output out);

    wire in12;
    // '^' is XOR gate (bitwise)
    // '~' is NOT gate
    assign in12 = ~(in1 ^ in2); //you also can use ~out
    assign out = in12 ^ in3;
    
endmodule