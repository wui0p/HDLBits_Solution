module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  );

    //using else will latch the variable as a value
    //only if the else statement set a value to reg
    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else keep_driving = 0;
    end

endmodule
```