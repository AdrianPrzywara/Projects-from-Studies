`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 14:08:24
// Design Name: 
// Module Name: Zad7
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


module Zad7(
    input clk,
    output [3:0] out
    );
    reg [3:0] q=0;
    always @(posedge clk) begin
        q=q+1;
    end
    assign out[0]=q[0]^q[1];
    assign out[1]=q[1]^q[2];
    assign out[2]=q[2]^q[3];
    assign out[3]=q[3];
endmodule