`timescale 10ns/1ns
`include "morse.v"

module morse_tb;


    reg in, reset, clk;
    wire [7:0] out;
    morse uut(in, out, reset, clk);

    initial begin
        $dumpfile("morse.vcd");
        $dumpvars(0, morse_tb);

        reset = 1; #15;
        reset = 0; #10;
        in = 1; #50;
        reset = 1; #15;
        reset = 0;

        in = 1; #50;
        in = 0; #15;
        reset = 1; #15;
        reset = 0;

        in = 1; #90;
        reset = 1; #15;
        reset = 0;
        $finish;
    end

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    

endmodule