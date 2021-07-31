`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/28 21:47:30
// Design Name: 
// Module Name: regfile
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
module regfile (
    input wire          clk,
    input wire [4:0]    a1,//读地址1
    input wire [4:0]    a2,//读地址2
    input wire [4:0]    a3,//写地址
    input wire          we,
    input wire [31:0]   wd,
    output wire [31:0]  rd1,
    output wire [31:0]  rd2
);

    reg [31:0]          rf[31:0];//寄存器堆本身是32个32位寄存器组成

    //写地址位时序逻辑
    always @(posedge clk) begin
        if(we == 1)begin//写使能
            rf[a3] <= wd;
        end
    end

    //读地址为组合逻辑
    assign  rd1 = (a1 == 0)?0:rf[a1];
    assign  rd2 = (a2 == 0)?0:rf[a2];
    
endmodule