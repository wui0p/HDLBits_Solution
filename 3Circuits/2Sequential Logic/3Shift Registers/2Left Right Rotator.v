module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    //set a reg for saving the bit that is going to get discard by '>>'
    reg save_bit;

    //you need to use blocking, because execute order matters
    always @(posedge clk) begin
        // 'load' have higher priority
        if(load) q = data;
        else begin
            case(ena)
                2'b01 : begin
                    //save the discarding bit (rightmost)
                    save_bit = q[0];
                    //then shift
                    q = q>>1;
                    //then insert the bit to the leftmost bit
                    q[99] = save_bit;
                end
                2'b10 : begin
                    save_bit = q[99];
                    q = q<<1;
                    q[0] = save_bit;
                end
                default : q = q;
            endcase
        end
    end

endmodule
