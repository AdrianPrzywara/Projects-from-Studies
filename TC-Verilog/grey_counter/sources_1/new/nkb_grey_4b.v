`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2020 03:50:26 PM
// Design Name: 
// Module Name: nkb_grey_4b
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


module nkb_grey_4b(
    input [3:0] a,
    output [3:0] b
    );
   assign b[0]=a[0]^a[1];
   assign b[1]=a[1]^a[2];
   assign b[2]=a[2]^a[3];
   assign b[3]=a[3];
endmodule
