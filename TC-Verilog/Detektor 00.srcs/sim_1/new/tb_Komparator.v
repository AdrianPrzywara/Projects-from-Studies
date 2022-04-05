`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 15:39:53
// Design Name: 
// Module Name: tb_Komparator
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


module tb_Komparator();
    reg clk;
    reg a=0;
    reg b=0;
    wire [2:0] y; //Wynik Porównania kod 1 z 3 
                         //100 Wiêksze
                         //010 Równe
                         //001 Mniejsze
    Komparator uut (clk, a, b, y);
    
    integer A=24; //Pierwsza liczba
    integer B=25; //Druga liczba
    reg [2:0] Y=0; //Wynik Porównania Wbudowan¹ funkcj¹ kod 1 z 3 
                         //100 Wiêksze
                         //010 Równe
                         //001 Mniejsze
                         
    integer i=0;
    
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    
    initial begin
    #1;
    //Wpisanie szeregowe liczb
    for(i=0;i<8;i=i+1) begin
        a<=A[i];
        b<=B[i];
        #10;
    end
    
    if(A<B) Y=3'b001;
    else if(A>B) Y=3'b100;
    else Y=3'b010;
    
    if(Y != y) $display("\n Blad \n");
    else begin
    $display("\n Uklad dziala poprawnie. \n"); 
    case(y)
        3'b100: $display("Wieksze \n");
        3'b010: $display("Rowne \n");
        3'b001: $display("Mniejsze \n");
    endcase
    end
    #1;
    $finish;
    end
        
endmodule
