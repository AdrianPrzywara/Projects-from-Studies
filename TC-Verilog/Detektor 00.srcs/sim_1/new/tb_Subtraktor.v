`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 15:20:09
// Design Name: 
// Module Name: tb_Subtraktor
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


module tb_Subtraktor();
    reg clk;
    reg a=0;
    reg b=0;
    wire y;
    Subtraktor uut (clk, a, b, y);
    
    integer A=71; //Pierwsza liczba
    integer B=44; //Druga liczba
    reg [7:0] Y=0; //Wynik Odejmowania A-B
    
    integer i=0;
    
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    
    initial begin
    #1;
    //Odejmowanie A-B
    for(i=0;i<8;i=i+1) begin
        a<=A[i];
        b<=B[i];
        #5;
        Y[i]<=y;
        #5;
    end
    
    if(Y != (A-B)) $display("\n Blad \n");
    else $display("\n Uklad dziala poprawnie. \n");
    
    $finish;
    end
        
endmodule