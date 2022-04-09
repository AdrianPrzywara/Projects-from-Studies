`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 13:13:04
// Design Name: 
// Module Name: Zad3
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


module Zad3(
    input clk,
    input load,
    input CE,
    input [N-1:0] pi,
    output reg so=0
    );
    
    parameter N=8;
    
    reg [N-1:0]tmp;
    
    always @(posedge clk) begin
        if(CE) begin
            if(load)
                tmp<=pi;
            else begin
                so<=tmp[0];
                tmp<={1'bx,tmp[N-1:1]};
            end
        end
    end
endmodule
