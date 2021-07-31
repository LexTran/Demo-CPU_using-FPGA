`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/21 21:47:30
// Design Name: 
// Module Name: Controller
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

module Controller(
    input wire [5:0]    op,
    input wire [5:0]    funct,
    output wire         jump,
    output wire         branch,
    output wire         alusrc,
    output wire         memwrite,
    output wire         memtoreg,
    output wire         regwrite,
    output wire         regdst,
    output wire [2:0]   Alucontrol
    );

wire [1:0]              Aluop;      

main_decoder main_decoder(
    .op(op),
    .jump(jump),
    .branch(branch),
    .alusrc(alusrc),
    .memwrite(memwrite),
    .memtoreg(memtoreg),
    .regwrite(regwrite),
    .regdst(regdst),
    .Aluop(Aluop)
);

alu_decoder alu_decoder(
    .funct(funct),
    .Aluop(Aluop),
    .Alucontrol(Alucontrol)
);

endmodule
