module top_module(
	input clk, 
	input load, 
	input [9:0] data, 
	output tc
);

	//set the counting integer for 'tc'
	integer count;

	//this always block need to be blocking, because if statement of 'tc' need to be last operation
	always @(posedge clk) begin
		if(load) count = data;
		//we need 'count' to latch at 0, thus set condition for decrement
		else if(count > 0) count = count - 1;

        //this if statement set output 'tc'
        if(count==0) tc = 1;
		else tc = 0;
	end

endmodule
