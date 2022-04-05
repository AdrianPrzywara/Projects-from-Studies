`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 14:39:38
// Design Name: 
// Module Name: tb_Zad5
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


module tb_Zad5();
 reg clk;
 reg CE;
 reg si;
 wire so;
 
 Zad5 uut(clk,CE,si,so);

 parameter N=5;
 parameter TCLK=5; //Po³owa okresu zegara
 initial begin
   clk=0;
   forever #TCLK clk = ~clk;
  end

integer SI=21; //Przyk³adowa wartoœæ do testu

reg [N-1:0] SO=0; //Wyjœcie

integer i=0;
integer j=0;

 initial begin
    CE=1;
    #1;
    for(i=0;i<6;i=i+1) begin //Wpisanie wartoœci
        si<=SI[i];
        #10;
    end
  end
  
  initial begin
    #1;
    #(2*TCLK*(N+1)); //Odczekanie N taktów zegara
    for(j=0;j<6;j=j+1) begin //Wpisanie wartoœci
        SO[j]<=so;
        #10;
        end
    if(SO != SI)  begin //Test poprawnoœci
        $display("\n Blad \n");
        $stop;
    end
    $display("\n Uklad dziala poprawnie. \n");
    $finish;
  end
endmodule
