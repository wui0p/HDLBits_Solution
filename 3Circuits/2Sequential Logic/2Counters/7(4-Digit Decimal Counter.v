module top_module (
    input clk,
    input reset,
    output [3:1] ena,
    output [15:0] q);

    //set 'ena' with condition of previous layers of bcd are full 
    assign ena[1] = (q[3:0]==9)? 1:0;
    assign ena[2] = (q[3:0]==9 && q[7:4]==9)? 1:0;
    assign ena[3] = (q[3:0]==9 && q[7:4]==9 && q[11:8]==9)? 1:0;
    
    //set 4 layers of bcd counter
    //first layer 'ena' is always enabled
    bcd insta1(clk, reset, 1, q[3:0]);
    bcd insta2(clk, reset, ena[1], q[7:4]);
    bcd insta3(clk, reset, ena[2], q[11:8]);
    bcd insta4(clk, reset, ena[3], q[15:12]);

endmodule

//set a bcd counter for 0 to 9
module bcd(input clk, input reset, input ena, output reg [3:0]q);
    always @(posedge clk) begin
        if(reset) q = 0;
        else begin
            if(ena) begin
                if(q == 9) q = 0;
                else q = q + 1;
            end
        end
    end
endmodule