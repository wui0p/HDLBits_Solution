module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);

    reg [15:0]q_reg;

    always @(posedge clk) begin
        //reset normally is the highest priority, therefore set it as the highest if satement
        if(!resetn) q_reg <= 0;
        else begin
            //control statement of 'byteena'
            if(byteena[1]) q_reg[15:8] <= d[15:8];
            if(byteena[0]) q_reg[7:0] <= d[7:0];
        end
    end

    assign q = q_reg;

endmodule
