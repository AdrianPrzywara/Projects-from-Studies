`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 14:55:49
// Design Name: 
// Module Name: Sumator
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


module Sumator(
    input clk,
    input a,
    input b,
    output reg y=0
    );
    
    
    reg state=0;
    
    parameter S0=1'd0, S1=1'd1;
    
    always @(posedge clk)
    begin
        case(state)
            S0: begin 
                case(a)
                    1'b0: begin
                        case(b)
                        1'b0: begin
                            state <= S0;
                            y <= 0;
                            end
                        1'b1: begin
                            state <= S0;
                            y <= 1;
                            end
                        endcase
                        end
                    1'b1: begin
                        case(b)
                        1'b0: begin
                            state <= S0;
                            y <= 1;
                            end
                        1'b1: begin
                            state <= S1;
                            y <= 0;
                            end
                        endcase
                        end
                endcase
                end
            S1: begin 
                case(a)
                    1'b0: begin
                        case(b)
                        1'b0: begin
                            state <= S0;
                            y <= 1;
                            end
                        1'b1: begin
                            state <= S1;
                            y <= 0;
                            end
                        endcase
                        end
                    1'b1: begin
                        case(b)
                        1'b0: begin
                            state <= S1;
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
        endcase
    end
    
endmodule
