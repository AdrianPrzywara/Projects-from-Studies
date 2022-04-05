`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.01.2021 15:28:56
// Design Name: 
// Module Name: Komparator
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


module Komparator(
    input clk,
    input a,
    input b,
    output reg [2:0] y=0 //kod 1 z 3 
                         //100 Wiêksze
                         //010 Równe
                         //001 Mniejsze
    );
    
    
    reg [1:0] state=0;
    
    parameter [1:0] S0=2'd0, S1=2'd1, S2=2'd2;
    
    always @(posedge clk)
    begin
        case(state)
            S0: begin 
                case(a)
                    1'b0: begin
                        case(b)
                        1'b0: begin
                            state <= S0;
                            y <= 3'b010;
                            end
                        1'b1: begin
                            state <= S1;
                            y <= 3'b001;
                            end
                        endcase
                        end
                    1'b1: begin
                        case(b)
                        1'b0: begin
                            state <= S2;
                            y <= 3'b100;
                            end
                        1'b1: begin
                            state <= S0;
                            y <= 3'b010;
                            end
                        endcase
                        end
                endcase
                y=2;
                end
            S1: begin 
                case(a)
                    1'b0: begin
                        case(b)
                        1'b0: begin
                            state <= S1;
                            y <= 3'b001;
                            end
                        1'b1: begin
                            state <= S1;
                            y <= 3'b001;
                            end
                        endcase
                        end
                    1'b1: begin
                        case(b)
                        1'b0: begin
                            state <= S2;
                            y <= 3'b100;
                            end
                        1'b1: begin
                            state <= S1;
                            y <= 3'b001;
                            end
                        endcase
                        end
                endcase
                end  
            S2: begin 
                case(a)
                    1'b0: begin
                        case(b)
                        1'b0: begin
                            state <= S2;
                            y <= 4;
                            end
                        1'b1: begin
                            state <= S1;
                            y <= 1;
                            end
                        endcase
                        end
                    1'b1: begin
                        case(b)
                        1'b0: begin
                            state <= S2;
                            y <= 4;
                            end
                        1'b1: begin
                            state <= S2;
                            y <= 4;
                            end
                        endcase
                        end
                endcase
                end           
        endcase
    end
    
endmodule

