`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 13:50:22
// Design Name: 
// Module Name: tb_Zad4
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


module tb_Zad4();
 reg clk;
 reg CE;
 reg si;
 wire [N-1:0] po;
 
 Zad4 uut(clk,CE,si,po);

 parameter N=8;
 
 initial begin
   clk=0;
   forever #5 clk = ~clk;
  end

integer SI1=45; //Przykładowe wartości do testu
integer SI2=62;
integer SI3=23;

integer i=0;

 initial begin
    CE=0;
    si<=1'b1;
    #20 CE=1;
    #1;
    for(i=0;i<8;i=i+1) begin //Wpisanie pierwszej wartości
        si<=SI1[i];
        #10;
    end
    
    if(po != SI1)  begin //Test poprawności
        $display("\n Blad \n");
        $stop;
    end
    
    
    for(i=0;i<8;i=i+1) begin //Wpisanie drugiej wartości
        si<=SI2[i];
        #10;
    end
    
    if(po != SI2)  begin //Test poprawności
        $display("\n Blad \n");
        $stop;
    end
    
    
     for(i=0;i<8;i=i+1) begin //Wpisanie trzeciej wartości
        si<=SI3[i];
        #10;
    end
    
    if(po != SI3)  begin //Test poprawności
        $display("\n Blad \n");
        $stop;
    end
    
    $display("\n Uklad dziala poprawnie. \n");
    $finish;
  end
endmodule
