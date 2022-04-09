`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2021 20:53:41
// Design Name: 
// Module Name: tb_ram_dist_2Addr
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


module tb_ram_dist_2Addr();
  reg clk;
   reg we; // write ebable
   reg [awidth-1 : 0] addr;// address
   reg [dwidth-1 : 0] din; // input data
   wire [dwidth-1 : 0] dout; // output data
   parameter awidth = 7; // address bus bit width
   parameter dwidth = 8; // data bus bit width

ram_dist_2Addr uut(clk,we,addr,din,dout);

initial begin
clk =0;
forever #5 clk=~clk;
end

reg [9:0]j=0;

initial begin
    we<=1;
    #1;
    for(j=0;j<128;j=j+1)begin
        addr={j[8:0]};
        din=j;
        #10;
    end//for
    #6;
    we<=0;
    for(j=0;j<128;j=j+1)begin
        addr={j[8:0]};
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
