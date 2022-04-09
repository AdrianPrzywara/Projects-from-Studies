`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2021 21:30:54
// Design Name: 
// Module Name: ram_dist_2NADRESS
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


module ram_dist_2NADRESS(
 input clk,
   input we, // write ebable
   input [aawidth-1 : 0] addr,// address
   input [ddwidth-1 : 0] din, // input data
   output reg [ddwidth-1 : 0] dout // output data
  );
  parameter aawidth = 7; // address bus bit width
  parameter ddwidth = 8; // data bus bit width
  wire ce1,ce2;
    wire [ddwidth-1 : 0] dout1;
    wire [ddwidth-1 : 0] dout2;
  nand AND1 (ce1,addr[0], ~clk);
  nand AND2 (ce2,~addr[0], ~clk);

  ram_dist Kom1 (ce1,we,addr[aawidth-1:1],din,dout1);
  ram_dist Kom2 (ce2,we,addr[aawidth-1:1],din,dout2);
always @* begin
  case (addr[0])
  1'b0: begin
    dout<=dout1;
    end
    1'b1: begin
    dout<=dout2;
    end
    endcase
end
endmodule