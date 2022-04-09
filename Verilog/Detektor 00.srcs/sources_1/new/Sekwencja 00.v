`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 13:32:22
// Design Name: 
// Module Name: Sekwencja 00
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


module Sekwencja_00(
    input clk,
    input x,
    output reg y=0
    );
    
    reg state=0;
    
    parameter S0=1'b0, S1=1'b1;
    
    always @(posedge clk)
    begin
        case(state)
            S0: begin 
                case(x)
                    1'b0: begin
                        state <= S1;
                        y <= 0;
                        end
                    1'b1: begin
                        state <= S0;
                        y <= 0;
                        end
                endcase
                end
            S1: begin
                case(x)
                    1'b0: begin
                        state <= S1;
                        y <= 1;
                        end
                    1'b1: begin
                        state <= S0;
                        y <= 0;
                        end
                endcase
                end
        endcase
    end
                     
endmodule
