`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 14:34:18
// Design Name: 
// Module Name: Zad5
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


module Zad5(
    input clk,
    input CE,
    input si,
    output reg so=0
    );
    
    parameter N=5;
    
    reg [N-1:0]tmp=0;
    
    always @(posedge clk) begin
        if(CE) begin
            so<=tmp[0];
            tmp <= {si,tmp[N-1:1]};
        end
    end
    
endmodule