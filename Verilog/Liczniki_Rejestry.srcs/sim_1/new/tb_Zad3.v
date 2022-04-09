`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 13:17:32
// Design Name: 
// Module Name: tb_Zad3
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


module tb_Zad3();
 reg clk;
 reg load;
 reg CE;
 reg [N-1:0] pi;
 wire so;
 
 Zad3 uut(clk,load,CE,pi,so);

 parameter N=8;
 
 initial begin
   clk=0;
   forever #5 clk = ~clk;
  end

reg [N-1:0] PI1=45; //Przyk³adowe wartoœci do testu
reg [N-1:0] PI2=62;
reg [N-1:0] PI3=23;

reg [N-1:0] SO=0; //Wyjœcie
integer i=0;

 initial begin
    load=1;
    pi=PI1; //Wpisanie pierwszej wartoœci
    CE=0;
    #20 CE=1;
    #6;
    load=0;
    #5;
    for(i=0;i<8;i=i+1) begin //Wypisanie wyjœcia do zmiennej
        #5;
        SO[i]<=so;
        #5;
    end
    
    if(SO != PI1)  begin //Test poprawnoœci
        $display("\n Blad \n");
        $stop;
    end
    
    
    load=1;
    pi=PI2; //Wpisanie drugiej wartoœci
    #6;
    load=0;
    #5;
    for(i=0;i<8;i=i+1) begin //Wypisanie wyjœcia do zmiennej
        #5;
        SO[i]<=so;
        #5;
    end
    
    if(SO != PI2)  begin
        $display("\n Blad \n"); //Test poprawnoœci
        $stop;
    end
    
    
    load=1;
    pi=PI3; //Wpisanie trzeciej wartoœci
    #6;
    load=0;
    #5;
    for(i=0;i<8;i=i+1) begin //Wypisanie wyjœcia do zmiennej
        #5;
        SO[i]<=so;
        #5;
    end
    
    if(SO != PI3)  begin
        $display("\n Blad \n"); //Test poprawnoœci
        $stop;
    end
    
    $display("\n Uklad dziala poprawnie. \n");
    $finish;
  end
endmodule
