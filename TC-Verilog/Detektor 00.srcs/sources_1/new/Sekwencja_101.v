`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 14:42:06
// Design Name: 
// Module Name: Sekwencja_101
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


module Sekwencja_101(
    input clk,
    input x,
    output reg y=0
    );
    
    
    reg [1:0] state=0;
    
    parameter S0=2'd0, S1=2'd1, S2=2'd2;
    
    always @(posedge clk)
    begin
        case(state)
            S0: begin 
                case(x)
                    1'b0: begin
                        state <= S0;
                        y <= 0;
                        end
                    1'b1: begin
                        state <= S1;
                        y <= 0;
                        end
                endcase
                end
            S1: begin
                case(x)
                    1'b0: begin
                        state <= S2;
                        y <= 0;
                        end
                    1'b1: begin
                        state <= S1;
                        y <= 0;
                        end
                endcase
                end
             S2: begin 
                case(x)
                    1'b0: begin
                        state <= S0;
                        y <= 0;
                        end
                    1'b1: begin
                        state <= S1;
                        y <= 1;
                        end
                endcase
                end    
        endcase
    end
                     
endmodule

