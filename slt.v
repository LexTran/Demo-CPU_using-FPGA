`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/28 21:47:30
// Design Name: 
// Module Name: slt
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
module slt (
    input wire [31:0]   in,
    output wire [31:0]  out
);
    
    assign  out = {in[29:0], 2'b00};//低30位左移两位，空出的地位用0补位

endmodule