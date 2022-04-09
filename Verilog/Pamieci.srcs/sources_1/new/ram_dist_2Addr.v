`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2021 20:33:54
// Design Name: 
// Module Name: ram_dist_2Addr
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


module ram_dist_2Addr(
   input clk,
   input we,
   input [aawidth-1 : 0] addr,// address
   input [ddwidth-1 : 0] din, // input data
   output reg [ddwidth-1 : 0] dout // output data
  );
  parameter aawidth = 7; // address bus bit width
  parameter ddwidth = 8; // data bus bit width
    wire [ddwidth-1 : 0] dout1;
    wire [ddwidth-1 : 0] dout2;
    reg we1,we2;
 always @* begin
 if(we==0)begin
 we1=0;
 we2=0;
 end
 else begin
  case (addr[aawidth-1])
  1'b0: begin
    we1=1;
    we2=0;
    end
    1'b1: begin
    we1=0;
    we2=1;
    end
    endcase
end
end
  ram_dist Kom1 (clk,we1,addr[aawidth-2:0],din,dout1);
  ram_dist Kom2 (clk,we2,addr[aawidth-2:0],din,dout2);
always @* begin
  case (addr[aawidth-1])
  1'b0: begin
    dout<=dout1;
    end
    1'b1: begin
    dout<=dout2;
    end
    endcase
end

endmodule