`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 13:42:41
// Design Name: 
// Module Name: Zad4
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


module Zad4(
    input clk,
    input CE,
    input si,
    output reg [N-1:0] po=0
    );
    
    parameter N=8;
    
    reg [N-1:0]tmp;
    
    always @(posedge clk)
        if(CE) begin
        po<={si,po[N-1:1]};
        end
endmodule

