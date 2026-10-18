`timescale 1ns / 1ps
module Traffic_Light_Time_tb;
reg clk;
    reg clr;
    wire [5:0] lights;
Traffic_Light_Time uut (
        .clk(clk),
        .clr(clr),
        .lights(lights)
    );
// Generate clock with a 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
// Apply reset and run simulation
    initial begin
        clr = 1;
        #12;
        clr = 0;
#1000;
        $finish;
    end
// Display values in the Tcl Console
    initial begin
        $monitor(
            "Time=%0t clr=%b state=%b count=%d lights=%b",
            $time, clr, uut.state, uut.count, lights
        );
    end
endmodule
