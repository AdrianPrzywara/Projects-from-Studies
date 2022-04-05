`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2021 14:09:42
// Design Name: 
// Module Name: tb_Zad7
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


module tb_Zad7();
  reg clk;
  wire [3:0] out;
  reg [3:0] out_correct;
  reg [4:0] vectornum;
  reg [3:0] testvectors[0:20];
  
  Zad7 uut(clk,out);

  initial begin
    clk=0;
    forever #5 clk=~clk;
  end

initial begin
    $readmemb("test.txt",testvectors);
    vectornum = 0;
    out_correct=testvectors[vectornum];
end

always @(posedge clk) begin
    out_correct=testvectors[vectornum];
end

always @(negedge clk) begin
    if(out != out_correct) begin
            $display("\nError podczas symulacji, out=%b, out_correct=%b.\n",out,out_correct);
            $stop;
    end
    
    vectornum=vectornum+1;
    
    if(vectornum == 16) begin
        $display("\nTest Udany.\n");
        $finish;
    end
end
endmodule

