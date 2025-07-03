module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    //set the pm value
    reg pm_reg;
    //remember to set condition and not '*', which will stuck in a loop
    always @(posedge clk or posedge reset) begin
        if(reset) pm_reg = 0;
        //when time hit 11:59:59 'pm' switch numbers, no matter 0 or 1
        else if(hh==8'h11 && mm==8'h59 && ss==8'h59) pm_reg = ~pm_reg;
    end
    assign pm = pm_reg;

    //set enable for minute and hour
    wire ena_m, ena_h;
    assign ena_m = (ss == 8'h59 && ena)? 1:0;
    assign ena_h = (mm == 8'h59 && ss == 8'h59 && ena)? 1:0; 
    
    //3 layers of bcd
    bcd_60 sec(clk, reset, ena, ss);
    bcd_60 min(clk, reset, ena_m, mm);
    bcd_12 hr(clk, reset, ena_h, hh);

endmodule

//bcd for second and minute
module bcd_60(input clk, input reset, input ena, output reg [7:0]out);
    always @(posedge clk) begin
        if(reset) out = 0;
        else begin
            if(ena) begin
                if (out == 8'h59) out = 0;
                else begin
                    //decimal counter
                    if (out[3:0] == 9) begin 
                        out[7:4] = out[7:4] + 1;
                        out[3:0] = 0;
                    end else out[3:0] = out[3:0] + 1;
                end
            end
        end
    end
endmodule

//bcd for hour
module bcd_12(input clk, input reset, input ena, output reg [7:0]out);
    always @(posedge clk) begin
        if(reset) out = 8'h12;
        else begin
            if(ena) begin
                //auto reset to 01, because there is no 00 on this hour clock
                if (out == 8'h12) out = 1;
                else begin
                    //decimal counter
                    if (out[3:0] == 9) begin 
                        out[7:4] = out[7:4] + 1;
                        out[3:0] = 0;
                    end else out[3:0] = out[3:0] + 1;
                end
            end
        end
    end
endmodule