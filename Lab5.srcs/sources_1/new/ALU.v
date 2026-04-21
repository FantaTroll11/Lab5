`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2026 06:34:39 PM
// Design Name: 
// Module Name: ALU
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


module ALU(input [31:0] A, input [31:0] B, input [3:0] op, output reg [31:0] out, output flag);
    reg [31:0] logic;
    wire [31:0] subB;
    wire [32:0] arith;
    //logic unit
    always@(*)begin
        case(op[1:0])
            2'b00: logic = (A & B);
            2'b01: logic = (A | B);
            2'b10: logic = (A ^ B);
            2'b11: logic = ~(A | B);
            default:
            logic = 32'b0;
        endcase
    end
    
    assign subB = (op[1] == 1) ? ~B : B;
    assign arith = A + subB + op[1];
    
    always@(*)begin
        case(op[3:2])
            2'b10: out = {31'b0, arith[31]};
            2'b01: out = logic;
            2'b00: out = arith[31:0];
            default:
                out = 32'b0;
        endcase
    end
    
    assign flag = (out == 32'b0) ? 1'b1 : 1'b0;
    
endmodule






