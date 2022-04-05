`timescale 1ns / 1ps
module licznik_grey_4b_tb(
 );
 reg clk;
 reg rst;
 reg set;
 wire [3:0] q;
 
 licznik_grey_4b uut(clk,rst,set,q);
 

initial begin
 clk=0;
//assign q=0;
   forever #5 clk = ~clk;
     end 
     initial begin
        rst=1;
        set=0;
        #10;
        rst=0;
        
     end
endmodule