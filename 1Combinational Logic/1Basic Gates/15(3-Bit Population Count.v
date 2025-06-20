module top_module( 
    input [2:0] in,
    output [1:0] out );

    //set a reg answer so you can store value
    reg [1:0]pop;
    integer i;
    always @(*) begin
        //reset variable when execute again
        pop = 0;
        
        //this for loop count how many 1 in 'in'
        for(i=0 ; i<3 ; i=i+1)
            if(in[i]) pop = pop + 1;
    end

    //remember to assign reg answer to your output
    assign out = pop;
    
endmodule