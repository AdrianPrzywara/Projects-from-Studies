`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 14:48:05
// Design Name: 
// Module Name: tb_Sekwencja_101
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


module tb_Sekwencja_101();
    reg clk;
    reg x=0;
    wire y;
    Sekwencja_101 uut (clk, x, y);
    
    reg value, prev_value, prev_prev_value;
    
    integer i=0;
    
    initial begin
        clk=0;
        forever #5 clk=~clk;
    end
    
    initial begin
    #1;
    for(i=0;i<25;i=i+1) begin
        x<=$urandom%2;
        #10;
    end
    $display("Uklad dziala poprawnie. \n");
    $finish;
    end
        

    always @(posedge clk) begin
     prev_prev_value<=prev_value;
     prev_value<=value;
     value<=x;
     #1;
     if (value == 1 & prev_value == 0 & prev_prev_value == 1) begin
        if(y != 1) begin
            $display("Blad");
            $stop;
        end
     end
    end

endmodule
