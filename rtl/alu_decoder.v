`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/21 21:47:30
// Design Name: 
// Module Name: alu_decoder
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

module alu_decoder (
    input wire [5:0]      funct,
    input wire [1:0]      Aluop,
    output wire [2:0]     Alucontrol
);
reg [2:0]           aluctrl_reg;

assign  Alucontrol = aluctrl_reg;

always @(*) begin
    case (Aluop)
    2'b00: begin
        aluctrl_reg <= 3'b010;//lw和sw
    end 
    2'b01: begin
        aluctrl_reg <= 3'b110;//beq
    end
    2'b10: begin//R型指令
        aluctrl_reg <= (funct == 6'b100000) ? 3'b010 ://add
                       (funct == 6'b100010) ? 3'b110 ://sub
                       (funct == 6'b100100) ? 3'b000 ://and
                       (funct == 6'b100101) ? 3'b001 ://or
                       (funct == 6'b101010) ? 3'b111 ://slt
                       3'b000;
    end
    default: begin
        aluctrl_reg <= 3'b000;
    end
endcase
end
    
endmodule