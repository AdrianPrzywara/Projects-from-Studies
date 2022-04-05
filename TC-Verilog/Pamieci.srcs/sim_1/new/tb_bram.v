`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.01.2021 19:54:10
// Design Name: 
// Module Name: tb_bram
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


module tb_bram();
 parameter awidth = 10; // address bus bit width
   parameter dwidth = 8; // data bus bit width

   reg clk;
   reg we; // write ebable
   reg [awidth-1 : 0] addr;// address
   reg [dwidth-1 : 0] din; // input data
   wire [dwidth-1 : 0] dout; // output data

   bram uut(clk,we,addr,din,dout);


 initial begin
 clk =0;
 forever #5 clk=~clk;
 end
 
 reg[10:0] j=0;
 reg[7:0] i=0;
 initial begin
    we<=1;
    for(j=0;j<1024;j=j+1)begin
        addr<={j[9:0]};
        din<=i;
        #1;
        if(i==255) i=0;
            else i=i+1;
        #9;
    end

    we<=0;
    #1;
    i=0;
    for(j=0;j<1024;j=j+1)begin
            addr<={j[9:0]};
            din<=i+2;
            #6;
            if(dout!=i) begin
                        $display("Error b³êdne dane wyjœciowe ,%b",i);
                        $stop;
                        end
            #1;
            if(i==255) i=0;
                else i=i+1;
            #3;
            end
     $display("\nSymulacja przebieg³a prawid³owo\n");
     $finish;
    end


endmodule
