	`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2020 03:26:58 PM
// Design Name: 
// Module Name: licznik_4b_tb
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


module licznik_4b_tb(
 );
 reg clk;
 reg rst;
 reg set;
 wire [3:0] q;
 
 licznik_4b uut(clk,rst,set,q);
 

initial begin
 clk=0;
//assign q=0;
   forever #5 clk = ~clk;
     end 
     initial begin
        rst=1;
        set=0;
        #10;
        rst=0;
        
     end
endmodule
