module top_module (
    input clk,
    input aresetn,
    input x,
    output z ); 

    //set reg 'z' as storing output
    reg z_reg;
    reg [1:0]state, next_state;
    //the exercise's rules is to set 3 states
    parameter ONE = 0, TWO = 1, THREE = 2;

    always @(*) begin
        //everytime 'z' is reset
        z_reg = 0;
        case(state)
            ONE: next_state = (x)? TWO : ONE;
            //if 'x=0' then proceed, but 'x=1' will stay
            //the checking sequence 101, 'x=1', therefore it fulfil state ONE
            TWO: next_state = (!x)? THREE : TWO;
            THREE: begin
                if(x) begin
                    z_reg = 1;
                    //because 'x=1' it fulfil state ONE
                    next_state = TWO;
                end else next_state = ONE;
            end
        endcase
    end

    always @(posedge clk, negedge aresetn) begin
        if(!aresetn) state = ONE;
        else state = next_state;
    end

    assign z = z_reg;

endmodule
