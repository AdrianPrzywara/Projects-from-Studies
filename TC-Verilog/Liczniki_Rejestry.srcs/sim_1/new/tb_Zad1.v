`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 12:47:18
// Design Name: 
// Module Name: tb_Zad1aA
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


module tb_Zad1aA();
 reg clk;
 reg CE;
 reg RESET;
 wire [N-1:0] y;
 
 Zad1 uut(clk,CE,RESET,y);

 parameter N=6;
 
 initial begin
   clk=0;
   forever #5 clk = ~clk;
  end
  
 always @(*)
    if(y<0 | y>2**N) begin
        $display("Error b³êdne dane wyjœciowe");
        $stop;
    end

 initial begin
    CE=1; RESET=0;
    #20 RESET=1;
    #30 RESET=0; CE=0;
    #10 CE=1;
    $display("\nSymulacja przebieg³a prawid³owo\n");
    #1000 $finish;
 end
endmodule
