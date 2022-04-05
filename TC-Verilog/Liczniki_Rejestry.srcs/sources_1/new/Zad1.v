`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 12:41:20
// Design Name: 
// Module Name: Zad1aA
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


module Zad1(
    input clk,
    input CE,
    input RESET,
    output reg [N-1:0] y=0
    );
    
    parameter N=6;
    
    always @(posedge clk or posedge RESET) //synchroniczny bez posedge RESET
        if(RESET) y<=1'b0;
        else if(CE) y=y+1; //y=y-1 licznik licz¹cy w dó³

endmodule
