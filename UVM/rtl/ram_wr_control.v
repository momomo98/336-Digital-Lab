`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/28 15:57:17
// Design Name: 
// Module Name: ram_wr_control
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
module ram_wr_control_data
#(
    //对于该模块，总线第几beat数据是有效的,采用10位是因为一次总线传输最多需要10beat
    parameter bus_data_vld = 10'b00_0000_0110,
    //定义查找表,一个3*3卷积，任何步长，都会经历6次写入
    parameter waddr1 = 4'd0, parameter wr_strb1 = 2'b11,
    parameter waddr2 = 4'd2, parameter wr_strb2 = 2'b01,
    parameter waddr3 = 4'd3, parameter wr_strb3 = 2'b11,
    parameter waddr4 = 4'd5, parameter wr_strb4 = 2'b01,
    parameter waddr5 = 4'd6, parameter wr_strb5 = 2'b11,
    parameter waddr6 = 4'd8, parameter wr_strb6 = 2'b01
)
(
    input wire clk,
    input wire rst_n,
    input wire wr_sop,
    input wire wr_eop,
    input wire wr_vld,
    input wire [31:0] wr_data,
    
    output reg ram_wr_en,
    output reg [1:0] ram_wr_strb,
    output reg [3:0] ram_wr_addr,
    output reg [31:0] ram_wr_data
    );

reg [9:0] d_select;
reg [23:0] waddr;
reg [11:0] wstrb;
reg [1:0] wr_sop_cnt;
wire decode_rst;

assign decode_rst = wr_sop_cnt == 2'b00;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        d_select <= 10'd0;
    else if(wr_sop)
        d_select <= bus_data_vld;
    else if(wr_vld)
        d_select <= d_select >> 1;
    else
        d_select <= d_select;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        waddr <= 24'd0;
    else if(wr_sop && decode_rst)
        waddr <= {waddr6,waddr5,waddr4,waddr3,waddr2,waddr1};
    else if(wr_vld && d_select[0])
        waddr <= waddr >> 4;
    else
        waddr <= waddr;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        wstrb <= 12'd0;
    else if(wr_sop && decode_rst)
        wstrb <= {wr_strb6,wr_strb5,wr_strb4,wr_strb3,wr_strb2,wr_strb1};
    else if(wr_vld && d_select[0])
        wstrb <= wstrb >> 2;
    else
        wstrb <= wstrb;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        wr_sop_cnt <= 2'd0;
    else if(wr_sop_cnt == 2'b11)
        wr_sop_cnt <= 2'd0;
    else
        wr_sop_cnt <= wr_sop ? wr_sop_cnt + 1'b1 : wr_sop_cnt;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ram_wr_en <= 1'b0;
    else
        ram_wr_en <= wr_vld && d_select[0];
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ram_wr_strb <= 2'b00;
    else
        ram_wr_strb <= (wr_vld && d_select[0]) ? wstrb[1:0] : 2'b00;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ram_wr_addr <= 4'b0000;
    else
        ram_wr_addr <= (wr_vld && d_select[0]) ? waddr[3:0] : 4'b0000;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ram_wr_data <= 32'd0;
    else
        ram_wr_data <= (wr_vld && d_select[0]) ? wr_data : 32'd0;
end
endmodule

module ram_wr_control_weight
#(
    parameter beat_lsb = 0, parameter beat_msb = 4,
    parameter wr_addr1 = 4'd0, parameter wr_strb1 = 2'b11,
    parameter wr_addr2 = 4'd2, parameter wr_strb2 = 2'b11,
    parameter wr_addr3 = 4'd4, parameter wr_strb3 = 2'b11,
    parameter wr_addr4 = 4'd6, parameter wr_strb4 = 2'b11,
    parameter wr_addr5 = 4'd8, parameter wr_strb5 = 2'b01
)
(
    input  wire                         clk                        ,
    input  wire                         rst_n                      ,
    input  wire                         wr_sop                     ,
    input  wire                         wr_eop                     ,
    input  wire                         wr_vld                     ,
    input  wire        [  31: 0]        wr_data                    ,
    
    output reg                          ram_wr_en                  ,
    output reg         [   1: 0]        ram_wr_strb                ,
    output reg         [   3: 0]        ram_wr_addr                ,
    output reg         [  31: 0]        ram_wr_data                 
    );

reg work_enable;
reg [5:0] beat_cnt;

reg [19:0] write_addr;
reg [9:0]  write_strb;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        work_enable <= 1'b0;
    else if(wr_sop || (beat_cnt == beat_msb))
        work_enable <= ~work_enable;
    else
        work_enable <= work_enable;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        beat_cnt <= 1'b0;
    else if(wr_sop || wr_eop)
        beat_cnt <= 1'b0;
    else if(work_enable)
        beat_cnt <= beat_cnt + 1;
    else
        beat_cnt <= beat_cnt;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        write_addr <= 20'd0;
    else if(wr_sop)
        write_addr <= {wr_addr5, wr_addr4, wr_addr3, wr_addr2, wr_addr1};
    else if(work_enable && ((beat_cnt <= beat_msb) && (beat_cnt >= beat_lsb)))
        write_addr <= write_addr >> 4;
    else
        write_addr <= write_addr;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        write_strb <= 10'd0;
    else if(wr_sop)
        write_strb <= {wr_strb5, wr_strb4, wr_strb3, wr_strb2, wr_strb1};
    else if(work_enable && ((beat_cnt <= beat_msb) && (beat_cnt >= beat_lsb)))
        write_strb <= write_strb >> 2;
    else
        write_strb <= write_strb;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ram_wr_en <= 1'b0;
    else if(work_enable && ((beat_cnt <= beat_msb) && (beat_cnt >= beat_lsb)))
        ram_wr_en <= 1'b1;
    else
        ram_wr_en <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ram_wr_addr <= 4'd0;
    else if(work_enable && ((beat_cnt <= beat_msb) && (beat_cnt >= beat_lsb)))
        ram_wr_addr <= write_addr[3:0];
    else
        ram_wr_addr <= 4'd0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ram_wr_strb <= 2'd0;
    else if(work_enable && ((beat_cnt <= beat_msb) && (beat_cnt >= beat_lsb)))
        ram_wr_strb <= write_strb;
    else
        ram_wr_strb <= 2'd0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        ram_wr_data <= 32'd0;
    else if(work_enable && ((beat_cnt <= beat_msb) && (beat_cnt >= beat_lsb)))
        ram_wr_data <= wr_data;
    else
        ram_wr_data <= 32'd0;
end
endmodule
