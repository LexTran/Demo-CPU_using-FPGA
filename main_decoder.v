`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/21 21:47:30
// Design Name: 
// Module Name: Main_decoder
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

module main_decoder(
    input wire [5:0]     op,
    output wire          jump,
    output wire          branch,
    output wire          alusrc,
    output wire          memwrite,
    output wire          memtoreg,
    output wire          regwrite,
    output wire          regdst,
    output wire [1:0]    Aluop
);

reg [1:0]                aluop_reg;
reg [6:0]                signal;

assign  Aluop = aluop_reg;
assign  {jump, regwrite, regdst, alusrc, branch, memwrite, memtoreg} = signal;

always @(*) begin
    case (op)
    6'b000000: begin
        aluop_reg<=2'b10;
        signal <= 7'b0110000;
    end
    6'b100011: begin
        aluop_reg<=2'b00;
        signal <= 7'b0101001;
    end
    6'b101011: begin
        aluop_reg<=2'b00;
        signal <= 7'b0110000;
    end
    6'b000100: begin
        aluop_reg<=2'b10;
        signal <= 7'b0110000;
    end
    6'b001000: begin
        aluop_reg<=2'b10;
        signal <= 7'b0101000;
    end
    default: begin
        aluop_reg = 2'b00;
        signal = 7'b0000000;
    end
endcase
end


endmodule