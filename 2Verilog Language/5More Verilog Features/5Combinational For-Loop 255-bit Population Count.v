module top_module( 
    input [254:0] in,
    output [7:0] out );

    reg [7:0]count;
    integer i;

    //everytime 'in' was changed, execute always block
    always @(in) begin
        //reset 'count' back to 0
        count = 0;
        //for loop first statement 'i=0' will reset 'i' everytime it starts
        for(i=0 ; i<255 ; i=i+1)
            if(in[i]) count = count + 1;
    end
    assign out = count;
    
endmodule