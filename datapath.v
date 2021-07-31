`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/28 21:47:30
// Design Name: 
// Module Name: datapath
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
module datapath (
    input wire          clk,
    input wire          rst,
    input wire          jump,
    input wire          branch,
    input wire          alusrc,
    input wire          memwrite,
    input wire          memtoreg,
    input wire          regwrite,
    input wire          regdst,
    input wire [2:0]    Alucontrol,
    input wire [31:0]   data_read,//数据存储器读出的数据
    input wire [31:0]   inst,//指令存储器输出
    output wire [31:0]  alu_out,
    output wire [31:0]  rd2,
    output wire [31:0]  pc_out,
    output wire         zero//beq相减为0标志
);

//内部导线
wire [31:0]         pc_in;//输入pc的下一条地址
wire [31:0]         pc_add_out;//pc+4加法器
wire                pc_src;//输入pc的地址来源二选一
wire [31:0]         rd1;//地址1
wire [31:0]         sign_imm;//16位立即数扩展
wire [4:0]          a3_sel;//选择地址3
wire [31:0]         alu_in2;//alu二号输入二选一
wire [31:0]         write_src;//写数据二选一
wire [31:0]         slt_out;//移位器输出
wire [31:0]         pc_b;//分支指令pc地址
wire [31:0]         pc_j;//无条件跳转指令pc地址
wire [31:0]         pc_mux_out1;//beq与+4二选一

assign pc_src = zero & branch;

pc pc(
    .clk(clk),
    .rst(rst),
    .in(pc_in),
    .pc(pc_out)
);

adder pc_adder(
    .in1(pc_out),
    .in2(32'd4),
    .out(pc_add_out)
);

mux #(32) pc_mux(
    .in1(pc_add_out),
    .in2(pc_b),
    .sel(pc_src),
    .out(pc_mux_out1)
);

mux #(32) pc_mux2(
    .in1(pc_mux_out1),
    .in2({pc_add_out[31:28], pc_j[27:0]}),
    .sel(jump),
    .out(pc_in)
);

regfile regfile(
    .clk(clk),
    .a1(inst[25:21]),
    .a2(inst[20:16]),
    .a3(a3_sel),
    .we(regwrite),
    .wd(write_src),
    .rd1(rd1),
    .rd2(rd2)
);

signext signext(
    .in(inst[15:0]),
    .out(sign_imm)
);

alu alu(
    .num1(rd1),
    .num2(alu_in2),
    .op(Alucontrol),
    .result(alu_out),
    .zero()
);

mux #(5) a3_mux(
    .in1(inst[20:16]),
    .in2(inst[15:11]),
    .sel(regdst),
    .out(a3_sel)
);

mux #(32) aluin2_mux(
    .in1(rd2),
    .in2(sign_imm),
    .sel(alusrc),
    .out(alu_in2)
);

mux #(32) write_mux(
    .in1(alu_out),
    .in2(data_read),
    .sel(memtoreg),
    .out(write_src)
);

slt slt(
    .in(sign_imm),
    .out(slt_out)
);

adder pc_branch(
    .in1(slt_out),
    .in2(pc_add_out),
    .out(pc_b)
);

slt slt_j(
    .in({6'b0, inst[25:0]}),
    .out(pc_j)
);

endmodule