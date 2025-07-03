module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    //store the sign for right shift of 'q'
    reg sign_bit;
    
    always @(posedge clk) begin
        if(load) q = data;
        //only when 'ena' is 1 it will shift
        else if(ena) begin
            case (amount)
                //left shift is equal to logic shift, no need to save sign
                2'b00 : q = q << 1; 
                2'b01 : q = q << 8;
                2'b10 : begin
                    //save sign, which is the leftmost bit
                    sign_bit = q[63];
                    q = q >> 1;
                    // 'q[63-:1]' = 'q[63:62]'
                    q[63-:1] = {2{sign_bit}};
                end
                2'b11 : begin
                    sign_bit = q[63];
                    q = q >> 8;
                    q[63-:8] = {8{sign_bit}};
                end
            endcase
        end
    end

endmodule
