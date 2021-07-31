`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/29 21:47:30
// Design Name: 
// Module Name: mips
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
module mips (
    input wire          clk,
    input wire          rst,
    input wire [31:0]   inst,
    input wire [31:0]   data_read,
    output wire         memwrite,
    output wire [31:0]  alu_out,
    output wire [31:0]  write_data,
    output wire [31:0]  pc_out
);

wire         jump;
wire         branch;
wire         alusrc;
wire         memtoreg;
wire         regwrite;
wire         regdst;
wire [2:0]   Alucontrol;

    Controller Controller(
        .op(inst[31:26]),
        .funct(inst[5:0]),
        .jump(jump),
        .branch(branch),
        .alusrc(alusrc),
        .memwrite(memwrite),
        .memtoreg(memtoreg),
        .regwrite(regwrite),
        .regdst(regdst),
        .Alucontrol(Alucontrol)
    );

    datapath datapath(
    .clk(clk),
    .rst(rst),
    .jump(jump),
    .branch(branch),
    .alusrc(alusrc),
    .memwrite(memwrite),
    .memtoreg(memtoreg),
    .regwrite(regwrite),
    .regdst(regdst),
    .Alucontrol(Alucontrol),
    .data_read(data_read),//数据存储器读出的数据
    .inst(inst),//指令存储器输出
    .alu_out(alu_out),
    .rd2(write_data),
    .pc_out(pc_out),
    .zero(zero)//beq相减为0标志
    );

endmodule