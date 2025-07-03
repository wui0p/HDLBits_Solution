module top_module (
    input clk,
    input reset, 
    input s,
    input w,
    output z
);

    //set a reg output for the always block
    reg z_reg;
    reg state, next_state;
    parameter A = 0, B = 1;
    //set 2 integers for counting of clk cycle and when 'w=1' times
    integer count, w_count;

    always @(*) begin
        case(state)
            A: next_state = (s)? B : A;
            B: next_state = B;
        endcase
    end 

    //we have to isolate the always block of reseting and counting
    //if we put them in the same always block, the 'state=next_state' will be troubling
    always @(posedge clk) begin
        if(reset) state = A;
        else state = next_state;
    end

    //this always block have to use blocking
    always @(posedge clk) begin
        if(reset) begin
            z_reg = 0;
            count = 0;
            w_count = 0;
        end else begin
            z_reg = 0;
            //only when state is B we have to count for clk cycle and 'w=1'
            if(state==B) begin
                w_count = w_count + w;
                count = count + 1;
                if(count==3) begin
                    if(w_count==2) z_reg = 1;
                    //reset after 3 clk cycles
                    count = 0;
                    w_count = 0;
                end
                
            end
        end
    end

    assign z = z_reg;

endmodule
