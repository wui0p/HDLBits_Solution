module top_module (
    input clk,
    input resetn,
    input in,
    output out);

    //set reg 'q' for the input of every dff
    reg [2:0]q;
    always @(posedge clk) begin
        //reset is when low, because they added NOT
        if(!resetn) begin
            q = 0;
            out = 0;
        end else begin
            //this require to be blocking
            //for it to delay between posedge clk we start from the rightmost output
            out = q[2];
            q[2] = q[1];
            q[1] = q[0];
            q[0] = in;
        end
    end



endmodule
