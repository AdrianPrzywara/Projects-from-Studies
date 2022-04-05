`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 16:19:11
// Design Name: 
// Module Name: Parzystosc
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


module Parzystosc(
    input clk,
    input x,
    output reg y=0
    );
    
    reg state=0;
    
    parameter parzyste=1'b0, nieparzyste=1'b1;
    
    always @(posedge clk)
    begin
        case(state)
            parzyste: begin 
                case(x)
                    1'b0: begin
                        state <= parzyste;
                        y <= 1;
                        end
                    1'b1: begin
                        state <= nieparzyste;
                        y <= 0;
                        end
                endcase
                end
            nieparzyste: begin
                case(x)
                    1'b0: begin
                        state <= nieparzyste;
                        y <= 0;
                        end
                    1'b1: begin
                        state <= parzyste;
                        y <= 1;
                        end
                endcase
                end
        endcase
    end
    
endmodule
