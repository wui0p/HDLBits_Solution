module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 

    /*
    Although this may look like exercise 1 (Rule 90), but the rule is not XOR
    Therefore the most straightfoward way is to declare the rules
    */
    
    //create two independent reg for calculation and storing the answers
    reg [513:0] q_cal;
    reg [511:0] q_next;
    integer i;

    always @(posedge clk) begin
        if (load) begin 
            //because q[512] = q[-1] = 0, therefore we have a 2 bit larger array rightmost and leftmost bits are 0
            q_cal = {1'b0,q,1'b0};
            q_next = data;
        end else begin
            //before calculation set 'q_cal' to the value right now
            q_cal = {1'b0,q,1'b0};
            for(i=0 ; i<512 ; i=i+1) begin
                //do not do 'q[i+:3]' or 'q[i+2:i]' because 'i' is not a constant
                //you have to manlually list out all the bits you want to check, it is more stable
                case({q_cal[i+2],q_cal[i+1],q_cal[i]})
                    //only listing the rules for 0, and others are all 1
                    3'b111 : q_next[i] = 0;
                    3'b100 : q_next[i] = 0;
                    3'b000 : q_next[i] = 0;
                    default : q_next[i] = 1;
                endcase
            end
        end
    end

    //assign the answer in reg 'q_next' to wire 'q'
    assign q = q_next;

endmodule
