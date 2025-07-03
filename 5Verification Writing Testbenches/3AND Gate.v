module top_module();

    //set the 'in' and 'out' for module 'andgate'
    reg [1:0]in;
    //we use wire because output normally use wire, change otherwise declared
    wire out;

    andgate insta(in,out);

    // 'out' is assign to by module 'andgate'
    //therefore you do not have to inital it by yourself
    //only initalizing 'in' is needed
    initial begin
        in = 0;
        #10 in = 2'b01;
        #10 in = 2'b10;
        #10 in = 2'b11;
    end

endmodule
