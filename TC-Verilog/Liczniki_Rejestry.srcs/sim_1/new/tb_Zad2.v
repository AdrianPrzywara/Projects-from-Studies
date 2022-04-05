`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 13:08:43
// Design Name: 
// Module Name: tb_Zad2
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


module tb_Zad2();
 reg clk;
 wire [$clog2(N)-1:0] y;
 
 Zad2 uut(clk,y);

 parameter N=200;
 
 initial begin
   clk=0;
   forever #5 clk = ~clk;
  end
  
 always @(*)
    if(y<0 | y>N) begin
        $display("Error b��dne dane wyj�ciowe");
        $stop;
    end

 initial begin
    $display("\nSymulacja przebieg�a prawid�owo\n");
    #10000 $finish;
 end
endmodule