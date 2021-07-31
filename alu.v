`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/28 21:47:30
// Design Name: 
// Module Name: alu
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
module alu (
    input wire [31:0]    num1,
    input wire [31:0]    num2,
    input wire [2:0]     op,
    output reg [31:0]    result,
    output wire          zero   
);

always @(*) begin
        case(op)
            3'b000:result <= num1[31:0] + num2[31:0];
            3'b001:result <= num1[31:0] - num2[31:0];
            3'b010:result <= num1[31:0] & num2[31:0];
            3'b011:result <= num1[31:0] | num2[31:0];
            3'b100:result <= ~(num1);
            3'b101:result <= (num1[31:0] < num2[31:0])?1:0;//
            default: result <= 32'h00000000;
        endcase
end

assign  zero = (result == 32'b0);

endmodule
