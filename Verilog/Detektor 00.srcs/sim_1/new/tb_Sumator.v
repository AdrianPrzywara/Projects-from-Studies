`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 15:05:04
// Design Name: 
// Module Name: tb_Sumator
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


module tb_Sumator();
    reg clk;
    reg a=0;
    reg b=0;
    wire y;
    Sumator uut (clk, a, b, y);
    
    integer A=31; //Pierwsza liczba
    integer B=79; //Druga liczba
    reg [7:0] Y=0; //Wynik Dodawania
    
    integer i=0;
    
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    
    initial begin
    #1;
    //Dodawanie A+B
    for(i=0;i<8;i=i+1) begin
        a<=A[i];
        b<=B[i];
        #5;
        Y[i]<=y;
        #5;
    end
    
    if(Y != (A+B)) $display("\n Blad \n");
    else $display("\n Uklad dziala poprawnie. \n");
    
    $finish;
    end
        
endmodule
