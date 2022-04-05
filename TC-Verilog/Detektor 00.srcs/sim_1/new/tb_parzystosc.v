`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 16:23:37
// Design Name: 
// Module Name: tb_parzystosc
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


module tb_Parzystosc();
    reg clk;
    reg x=0;
    wire y;
    Parzystosc uut (clk, x, y);
    
    integer X=8'b10100100; //Liczba
    
    integer i=0;
    
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    
    initial begin
    #1;
    //Wpisanie sprawdzanej liczby
    for(i=0;i<8;i=i+1) begin
        x<=X[i];
        #10;
    end
    //Sprawdzenie poprawnoœci, xor zwraca 1 dla nieparzystej liczby 1, 0 dla parzystej
    if(y != ~(^X)) $display("\n Blad \n");
    else $display("\n Uklad dziala poprawnie. \n");
    
    $finish;
    end
        
endmodule
