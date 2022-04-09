`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2021 19:42:03
// Design Name: 
// Module Name: tb_bram_1a
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_ram_dist();
parameter awidth = 6; // address bus bit width
   parameter dwidth = 8; // data bus bit width

   reg clk;
   reg we;
   reg [awidth-1 : 0] addr;// address
   reg [dwidth-1 : 0] din; // input data
   wire [dwidth-1 : 0] dout; // output data

ram_dist uut(clk,we,addr,din,dout);


initial begin
clk =0;
forever #5 clk=~clk;
end
    reg [7:0]j=0;
initial begin
    we<=1;
    #1;
    for(j=0;j<64;j=j+1)begin
        addr=j;
        din=j;
        #10;
    end//while
    #6;
    we<=0;
    for(j=0;j<64;j=j+1)begin
        addr=j;
        din=j+1;
        #1;
        if(dout!=j) begin
            $display("Error b³êdne dane wyjœciowe ,%b",j);
            $stop;
            end
        #9;
    end//for
    $display("\nSymulacja przebieg³a prawid³owo\n");
    $finish;
end//initial
endmodule