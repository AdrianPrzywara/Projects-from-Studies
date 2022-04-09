`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 15:46:55
// Design Name: 
// Module Name: Zad6
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


module Zad6(
    input clk,
    input load,
    input Left,
    input [N-1:0] in,
    output reg out=0
    );
    
    parameter N=8;
    
    reg [N-1:0]tmp;
    
    always @(posedge clk) begin
        if(load)
            tmp<=in;
        else if(Left) begin
            out<=tmp[N-1];
            tmp<={tmp[N-2:0],1'bx};
        end
        else begin
            out<=tmp[0];
            tmp<={1'bx,tmp[N-1:1]};
        end
    end
endmodule
