`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/11 14:18:08
// Design Name: 
// Module Name: fifo
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


module fifo
#(
    parameter fifo_deep = 8,
    parameter fifo_addr_width = 3,
    parameter fifo_data_width = 4
)
(
    input wire clk,
    input wire rst_n,
    input wire wr_vld,
    input wire [fifo_data_width - 1 : 0] wr_data,

    input wire rd_vld,
    output reg [fifo_data_width - 1 : 0] rd_data,

    output reg wr_full,
    output reg rd_empty
);

reg [fifo_data_width - 1 : 0] mem [0 : fifo_deep];
reg [fifo_addr_width : 0] wr_point;
reg [fifo_addr_width : 0] rd_point;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        wr_point <= 0;
    else if(wr_vld && ~wr_full)
        wr_point <= wr_point + 1;
    else
        wr_point <= wr_point;
end 

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rd_point <= 0;
    else if(rd_vld && ~rd_empty)
        rd_point <= rd_point + 1;
    else
        rd_point <= rd_point;
end 

always@(posedge clk or negedge rst_n)
begin
    if(rst_n)
        wr_full <= 1'b0;
    else
        wr_full <= ({~wr_point[fifo_addr_width], wr_point[fifo_addr_width - 1 : 0]}) == rd_point;
end 

always@(posedge clk or negedge rst_n)
begin
    if(rst_n)
        rd_empty <= 1'b0;
    else
        rd_empty <= wr_point == rd_point;
end 

always@(posedge clk)
begin
    if(wr_vld && ~wr_full)
        mem[wr_point[fifo_addr_width - 1 : 0]] <= wr_data;
end 

always@(posedge clk)
begin
    if(rd_vld && ~rd_empty)
        rd_data <= mem[rd_point[fifo_addr_width - 1 : 0]];
end 
endmodule
