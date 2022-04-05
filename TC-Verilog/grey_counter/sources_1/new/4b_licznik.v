`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2020 03:21:23 PM
// Design Name: 
// Module Name: 4b_licznik
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


module licznik_4b(
    input clk,
    input rst,
    input set,
    output reg [3:0] out=0
    );
    always @(posedge clk) begin
     if(rst) out=0;
     else if (set) out=15;
     else out=out +1;
     end
endmodule
