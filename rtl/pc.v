`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/21 21:47:30
// Design Name: 
// Module Name: PC
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

module pc(
    input wire          clk,
    input wire          rst,
    input wire [31:0]   in,//加法器计算所得下一条指令地址
    output reg [31:0]   pc
);

always @(posedge clk, negedge rst) begin
    if(rst)
        pc <= 32'b0;//置位时PC为0
    else
        pc <= in;//否则PC值为加法器所计算的结果
end

endmodule