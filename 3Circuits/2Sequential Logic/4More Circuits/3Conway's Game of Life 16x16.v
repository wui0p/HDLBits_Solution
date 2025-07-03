module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    //set the reg of 'q'
    reg [255:0]q_next;
    //we create an array for wrap around 'q', which is 16*(16+2)=288 bits
    //set it as wire because we need to use assign
    wire [287:0]q_cal;
    //set integer for the alive neighbor count
    integer i, alive;

    //assign the wrap around 'q_cal'
    assign q_cal = {q_next[15:0],q_next,q_next[255:240]};

    always @(posedge clk) begin
        if(load) q_next = data;
        else begin
            for (i=16 ; i<272 ; i=i+1) begin
                //this statement check for the left edge 'i'
                if(i==16 || i==32 || i==48 || i==64 || i==80 || i==96 || i==112 || i==128 || i==144
                   || i==160 || i==176 || i==192 || i==208 || i==224 || i==240 || i==256) begin
                    alive = q_cal[i+1]+q_cal[i+15]+q_cal[i+16]+q_cal[i+17]+q_cal[i+31]+q_cal[i-1]+q_cal[i-15]+q_cal[i-16];
                end
                //this statement check for the right edge 'i'
                else if (i == 31 || i == 47 || i == 63 || i == 79 || i == 95 || i==111 || i==127 || i == 143
                   || i == 159 || i == 175 || i == 191 || i == 207 || i == 223 || i == 239 || i == 255 || i == 271) begin
                    alive = q_cal[i-1]+q_cal[i-15]+q_cal[i-16]+q_cal[i-17]+q_cal[i-31]+q_cal[i+1]+q_cal[i+15]+q_cal[i+16];
                end
                //this statement check for all the other 'i'
                else begin
                    alive = q_cal[i+1]+q_cal[i+15]+q_cal[i+16]+q_cal[i+17]+q_cal[i-1]+q_cal[i-15]+q_cal[i-16]+q_cal[i-17];
                end
                
                //set the cell rules statement
                if (alive == 2) q_next[i-16] = q_next[i-16];
                else if (alive == 3) q_next[i-16] = 1'b1;
                else q_next[i-16] = 1'b0;
            end
        end
    end

    //remember to assign reg 'q_next' to wire 'q'
    assign q = q_next;

endmodule
