module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    reg Q_reg;
    always @(posedge clk) begin
        //combine {j,k} to decide which to execute
        case ({j,k})
            //truth table
            2'b00: Q_reg <= Q_reg;
            2'b01: Q_reg <= 0;
            3'b10: Q_reg <= 1;
            3'b11: Q_reg <= ~Q_reg;
        endcase
    end
    assign Q = Q_reg;

endmodule
