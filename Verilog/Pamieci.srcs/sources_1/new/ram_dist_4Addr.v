`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2021 21:51:44
// Design Name: 
// Module Name: ram_dist_4Addr
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


module ram_dist_4Addr(
   input clk,
   input we,
   input [aawidth-1 : 0] addr,// address
   input [ddwidth-1 : 0] din, // input data
   output reg [ddwidth-1 : 0] dout // output data
  );
  parameter aawidth = 8; // address bus bit width
  parameter ddwidth = 8; // data bus bit width
    wire [ddwidth-1 : 0] dout1;
    wire [ddwidth-1 : 0] dout2;
    wire [ddwidth-1 : 0] dout3;
    wire [ddwidth-1 : 0] dout4;
    reg we1,we2,we3,we4;
 always @* begin
 if(we==0)begin
 we1=0;
 we2=0;
 we3=0;
 we4=0;
 end
 else begin
  case (addr[aawidth-1:aawidth-2])
  2'b00: begin
    we1=1;
    we2=0;
    we3=0;
    we4=0;
    end
    2'b01: begin
    we1=0;
    we2=1;
    we3=0;
    we4=0;
    end
    2'b10: begin
    we1=0;
    we2=0;
    we3=1;
    we4=0;
    end
    2'b11: begin
    we1=0;
    we2=0;
    we3=0;
    we4=1;
    end
    endcase
end
end
  ram_dist Kom1 (clk,we1,addr[aawidth-3:0],din,dout1);
  ram_dist Kom2 (clk,we2,addr[aawidth-3:0],din,dout2);
  ram_dist Kom3 (clk,we3,addr[aawidth-3:0],din,dout3);
  ram_dist Kom4 (clk,we4,addr[aawidth-3:0],din,dout4);
  
always @* begin
  case (addr[aawidth-1:aawidth-2])
  2'b00: begin
    dout<=dout1;
    end
    2'b01: begin
    dout<=dout2;
    end
    2'b10: begin
    dout<=dout3;
    end
    2'b11: begin
    dout<=dout4;
    end
    endcase
end


endmodule