///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Parallel In Serial Out (PISO)
// Engineer: kiran
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module PISO(clk,rst,control,in,out);

    parameter N = 8;

    input  wire clk;
    input  wire rst;
    input  wire control;              //0 for loading and 1 for shifting
    input  wire [N-1:0]in;
    output wire out;


    reg [N-1:0]temp_data;

    reg SerialIn;


    always@(posedge clk, posedge rst)
        begin
            if(rst)begin
                SerialIn <= 0;
                temp_data<= 0;
            end else begin
                if(control==0) begin
                    temp_data <= in;
                end else begin
                    SerialIn  <= temp_data[0] ;
                    temp_data <= {1'b0,temp_data[N-1:1]}; //temp_data >> 1;
                end
            end
        end


    assign out = SerialIn;

endmodule
