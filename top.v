`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/28 21:47:30
// Design Name: 
// Module Name: top
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
module top (
    input wire          clk,
    input wire          rst,
    output wire [31:0]  writedata,
    output wire [31:0]  alu_out,
	output wire         memwrite
);

wire [31:0]             inst;
wire [31:0]             data_read;
wire [31:0]             pc_out;       

    mips mips(
        .clk(clk),
        .rst(rst),
        .inst(inst),
        .data_read(data_read),
        .memwrite(memwrite),
        .alu_out(alu_out),
        .write_data(writedata),
        .pc_out(pc_out)
    );

    inst_ram inst_ram(
        .clka(clk),    // input wire clka
        .ena(),      // input wire ena
        .wea(),      // input wire [3 : 0] wea
        .addra(pc_out[7:0]),  // input wire [7 : 0] addra
        .dina(),    // input wire [31 : 0] dina
        .douta(inst)  // output wire [31 : 0] douta
    );

    data_ram data_ram(
        .clka(clk),    // input wire clka
        .ena(),      // input wire ena  使能
        .wea({3'b0, memwrite}),      // input wire [3 : 0] wea  写使能
        .addra(alu_out[9:0]),  // input wire [9 : 0] addra
        .dina(writedata),    // input wire [31 : 0] dina
        .douta(data_read)  // output wire [31 : 0] douta
    );
    
endmodule