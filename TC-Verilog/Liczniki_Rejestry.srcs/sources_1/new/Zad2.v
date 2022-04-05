`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 13:04:31
// Design Name: 
// Module Name: Zad2
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


module Zad2(
    input clk,
    output reg [$clog2(N)-1:0] y=0
    );
    
    parameter N=200; //do ilu liczyæ
    
    always @(posedge clk)
        if(y==0) y<=N; //if (y==N) y<=0 w góre
        else y=y-1; //y=y-1 licznik licz¹cy w góre

endmodule
