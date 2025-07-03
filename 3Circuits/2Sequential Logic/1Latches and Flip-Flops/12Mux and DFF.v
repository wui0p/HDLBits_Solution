module top_module (
    input clk,
    input w, R, E, L,
    output Q
);

    //set 2 wires for connecting mux-to-mux and mux-to-DFF
    wire mux1, mux2;
    assign mux1 = (E)? w : Q;
    assign mux2 = (L)? R : mux1;

    reg Q_reg;
    always @(posedge clk) begin
        //the input of DFF is the last mux output 'mux2'
        Q_reg <= mux2;
    end
    assign Q = Q_reg;

endmodule
