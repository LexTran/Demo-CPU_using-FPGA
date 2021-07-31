`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/28 21:47:30
// Design Name: 
// Module Name: mux
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
module mux #(parameter WIDTH = 32)(
    input wire [WIDTH - 1:0]  in1,
    input wire [WIDTH - 1:0]  in2,
    input wire         sel,
    output wire [WIDTH - 1:0] out
);

assign  out = (sel==1'b0)?in1:in2;
    
endmodule