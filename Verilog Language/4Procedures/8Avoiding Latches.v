module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 

    always @(*) begin
        //You can see that we set all variable in every cases, which will prevent latches (very important).
        //Thus we do not need to reset variable to 0 at the first line of the always block.
        case(scancode)
            16'he06b: begin
                left = 1; down = 0; right = 0; up = 0;
            end
			16'he072: begin
                left = 0; down = 1; right = 0; up = 0;
            end
			16'he074: begin
                left = 0; down = 0; right = 1; up = 0;
            end
			16'he075: begin
                left = 0; down = 0; right = 0; up = 1;
            end
            default begin
                left = 0; down = 0; right = 0; up = 0;
            end
        endcase
    end
    
endmodule