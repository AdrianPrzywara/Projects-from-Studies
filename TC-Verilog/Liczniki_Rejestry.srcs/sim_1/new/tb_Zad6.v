`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 15:54:52
// Design Name: 
// Module Name: tb_Zad6
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


module tb_Zad6();
 reg clk;
 reg load;
 reg Left;
 reg [N-1:0] in;
 wire out;
 
 Zad6 uut(clk,load,Left,in,out);

 parameter N=8;
 
 initial begin
   clk=0;
   forever #5 clk = ~clk;
  end

reg [N-1:0] INL=45; //Przyk³adowe wartoœci do testu
reg [N-1:0] INR=62;

reg [N-1:0] OUT=0; //Wyjœcie
integer i=0;

 initial begin
    load=1;
    in=INL; //Wpisanie pierwszej wartoœci
    Left=1; //W lewo
    #6;
    load=0;
    #5;
    for(i=0;i<8;i=i+1) begin //Wypisanie wyjœcia do zmiennej
        #5;
        OUT[N-1-i]<=out;
        #5;
    end
    
    if(OUT != INL)  begin //Test poprawnoœci
        $display("\n Blad \n");
        $stop;
    end
    
    load=1;
    in=INR; //Wpisanie drugiej wartoœci
    Left=0; //W prawo
    #6;
    load=0;
    #5;
    for(i=0;i<8;i=i+1) begin //Wypisanie wyjœcia do zmiennej
        #5;
        OUT[i]<=out;
        #5;
    end
    
    if(OUT != INR)  begin
        $display("\n Blad \n"); //Test poprawnoœci
        $stop;
    end
    
    $display("\n Uklad dziala poprawnie. \n");
    $finish;
  end
endmodule
