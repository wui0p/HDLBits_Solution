module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
	
    always @(*) begin
        //when you use 'z' in case statement, you use 'casez'
        casez (in)
            // 'z' means dont-care, no matter it is 0 or 1
            4'bzzz1: pos = 0;
            4'bzz10: pos = 1;
            4'bz100: pos = 2;
            4'b1000: pos = 3;
            default: pos = 0;
        endcase
    end
    
endmodule