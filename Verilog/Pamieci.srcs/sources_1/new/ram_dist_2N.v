`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2021 20:07:11
// Design Name: 
// Module Name: ram_dist_2N
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


module ram_dist_2N(
input clk,
   input we, // write ebable
   input [aawidth-1 : 0] addr,// address
   input [ddwidth-1 : 0] din, // input data
   output [ddwidth-1 : 0] dout // output data
  );
  parameter aawidth = 6; // address bus bit width
  parameter ddwidth = 16; // data bus bit width

  ram_dist Kom1 (clk,we,addr,din[(ddwidth/2-1):0],dout[(ddwidth/2-1):0]);
  ram_dist Kom2 (clk,we,addr,din[ddwidth-1:(ddwidth/2)],dout[ddwidth-1:(ddwidth/2)]);


endmodule
