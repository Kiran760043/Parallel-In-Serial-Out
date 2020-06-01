///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Test Bench for Parallel In Serial Out (PISO)
// Engineer: kiran
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module test_bench_PISO();

    parameter N = 8;

    //inputs for DUT
        reg clk;
        reg rst;
        reg shift_load;              //Control signal 0 to load data and 1 to shift data
        reg [N-1:0]in;
    //outputs from the DUT
        wire out;

    PISO DUT (.clk(clk),.rst(rst),.control(shift_load),.in(in),.out(out));

    initial
        begin
            $display($time," <<Simulation Results >>");
            $monitor($time,"clk=%b, rst=%b, Shift_load=%b, in=%b, out=%b",clk,rst,control,in,out);
        end

    always #5 clk = ~clk;

    initial
       begin
           clk        = 0;
           rst        = 1;
           shift_load = 0;
           #15;
           rst = 0;
           shift_load = 0;
           in         = 8'hDD;
           #10;
           shift_load = 1;
           #80;
           shift_load = 0;
           in         = 8'h2E;
           #10;
           shift_load = 1;
           #80;
           shift_load = 0;
           in         = 8'h0A;
           #10;
           shift_load = 1;
           #80;
           shift_load = 0;
           in         = 8'h80;
           #10;
           shift_load = 1;
           #80;
           $finish;
       end


endmodule
