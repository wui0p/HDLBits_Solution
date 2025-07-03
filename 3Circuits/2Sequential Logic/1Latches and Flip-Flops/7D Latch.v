module top_module (
    input d, 
    input ena,
    output q);

    //set a reg output value for storing (latch)
    reg q_reg;

    //use '*', because when 'd' or 'ena' change it should execute
    always @(*) begin
        if(ena) q_reg <= d;
    end

    //remember to assign reg value to wire output
    assign q = q_reg;

endmodule
