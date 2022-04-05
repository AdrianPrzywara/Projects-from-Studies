`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2020 03:53:15 PM
// Design Name: 
// Module Name: licznik_grey_4b
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


module licznik_grey_4b(
    input clk,
    input rst,
    input set,
    output [3:0] q
    );
    wire [3:0] lq;
    licznik_4b l1(clk,rst,set,lq);
    nkb_grey_4b grey(lq,q);
endmodule
