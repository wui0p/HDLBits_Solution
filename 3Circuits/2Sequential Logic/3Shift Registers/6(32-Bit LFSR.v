module top_module(
    input clk,
    input reset,    
    output [31:0] q
); 

    /*
    We find the primitive polynomial over Galois Field 2, which is 
    x^32 + x^21 + x^2 + x + 1 = 0
    In coding we start from 0~31, thus we choose bit 31, 21, 1, 0 for feedback.
    */

    //set a reg for output, changing everytime 'q' have updated
    //this do not have to determihne on posedge clk
    //because the always block below set 'q = q_reg' every posedge clk
    reg [31:0]q_reg;
    always @(*) begin
        q_reg = q >> 1;
        q_reg[31] = q[0];
        q_reg[21] = q[22] ^ q[0];
        q_reg[1] = q[2] ^ q[0];
        q_reg[0] = q[1] ^ q[0];
    end

    always @(posedge clk) begin
        if(reset) q <= 32'h1;
        else begin
            q = q_reg;
        end
    end

endmodule

