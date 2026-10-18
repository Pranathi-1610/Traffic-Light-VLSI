`timescale 1ns / 1ps
module Traffic_Light_Sensor_tb;
reg clk;
reg clr;
reg SNS1;
reg SNS2;
wire [1:0] TL1;
wire [1:0] TL2;
// Connect the testbench to the sensor design
Traffic_Light_Sensor uut (
    .clk(clk),
    .clr(clr),
    .SNS1(SNS1),
    .SNS2(SNS2),
    .TL1(TL1),
    .TL2(TL2)
);
// Generate clock with a 10 ns period
initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end
// Apply reset and sensor inputs
initial
begin
    clr = 1;
    SNS1 = 0;
    SNS2 = 0;
    #13 clr = 0;
// Keep both sensors inactive
    SNS1 = 0;
    SNS2 = 0;
    #10;
// Activate sensor 2
    SNS1 = 0;
    SNS2 = 1;
    #40;
// Deactivate sensor 2
    SNS1 = 0;
    SNS2 = 0;
    #40;
// Activate sensor 1
    SNS1 = 1;
    SNS2 = 0;
    #30;
// Deactivate sensor 1
    SNS1 = 0;
    SNS2 = 0;
    #20;
// Activate sensor 2 again
    SNS1 = 0;
    SNS2 = 1;
    #20;
$finish;
end
endmodule
