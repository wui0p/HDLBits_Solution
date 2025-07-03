module top_module (
    input clk,
    input d,
    output q
);

    //we need 2 always block, therefore need 2 different reg for output
    //if you all use 'q_reg = d' then it will compile error
    reg q_reg1, q_reg2;

    always @(posedge clk) begin
        q_reg1 <= d;
    end
    always @(negedge clk) begin
        q_reg2 <= d;
    end
    
    // 'q_reg1' is posedge value, thus clk = 1
    // 'q_reg2' is posedge value, thus clk = 0
    assign q = (clk)? q_reg1 : q_reg2;

endmodule
