`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/14 11:10:16
// Design Name: 
// Module Name: result_top_control
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


module result_top_control(
    input wire clk,
    input wire rst_n,

    output wire rd_sop_0,
    input wire rd_eop_0,
    input wire rd_vld_0,
    input wire [15:0] rd_data_0,

    output wire rd_sop_1,
    input wire rd_eop_1,
    input wire rd_vld_1,
    input wire [15:0] rd_data_1,

    output wire rd_sop_2,
    input wire rd_eop_2,
    input wire rd_vld_2,
    input wire [15:0] rd_data_2,

    output wire rd_sop_3,
    input wire rd_eop_3,
    input wire rd_vld_3,
    input wire [15:0] rd_data_3,

    output wire rd_sop_4,
    input wire rd_eop_4,
    input wire rd_vld_4,
    input wire [15:0] rd_data_4,

    output wire rd_sop_5,
    input wire rd_eop_5,
    input wire rd_vld_5,
    input wire [15:0] rd_data_5,

    output wire rd_sop_6,
    input wire rd_eop_6,
    input wire rd_vld_6,
    input wire [15:0] rd_data_6,

    output wire rd_sop_7,
    input wire rd_eop_7,
    input wire rd_vld_7,
    input wire [15:0] rd_data_7,

    input wire top_rd_sop,
    output reg top_rd_eop,
    output reg top_rd_vld,
    output reg [31:0] top_rd_data,
    output reg top_rd_err
);

reg rd_vld_0_temp;
reg rd_vld_1_temp;
reg rd_vld_2_temp;
reg rd_vld_3_temp;
reg rd_vld_4_temp;
reg rd_vld_5_temp;
reg rd_vld_6_temp;
reg rd_vld_7_temp;
reg [15:0] rd_data_0_temp;
reg [15:0] rd_data_1_temp;
reg [15:0] rd_data_2_temp;
reg [15:0] rd_data_3_temp;
reg [15:0] rd_data_4_temp;
reg [15:0] rd_data_5_temp;
reg [15:0] rd_data_6_temp;
reg [15:0] rd_data_7_temp;
reg enable;
reg [2:0] cnt;
reg [2:0] sel;
reg [5:0] top_cnt;

assign rd_sop_0 = top_rd_sop;
assign rd_sop_1 = rd_eop_0;
assign rd_sop_2 = rd_eop_1;
assign rd_sop_3 = rd_eop_2;
assign rd_sop_4 = rd_eop_3;
assign rd_sop_5 = rd_eop_4;
assign rd_sop_6 = rd_eop_5;
assign rd_sop_7 = rd_eop_6;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        rd_vld_0_temp <= 1'b0;
        rd_vld_1_temp <= 1'b0;
        rd_vld_2_temp <= 1'b0;
        rd_vld_3_temp <= 1'b0;
        rd_vld_4_temp <= 1'b0;
        rd_vld_5_temp <= 1'b0;
        rd_vld_6_temp <= 1'b0;
        rd_vld_7_temp <= 1'b0;
    end
    else
    begin
        rd_vld_0_temp <= rd_vld_0;
        rd_vld_1_temp <= rd_vld_1;
        rd_vld_2_temp <= rd_vld_2;
        rd_vld_3_temp <= rd_vld_3;
        rd_vld_4_temp <= rd_vld_4;
        rd_vld_5_temp <= rd_vld_5;
        rd_vld_6_temp <= rd_vld_6;
        rd_vld_7_temp <= rd_vld_7;
    end
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        rd_data_0_temp <= 32'd0;
        rd_data_1_temp <= 32'd0;
        rd_data_2_temp <= 32'd0;
        rd_data_3_temp <= 32'd0;
        rd_data_4_temp <= 32'd0;
        rd_data_5_temp <= 32'd0;
        rd_data_6_temp <= 32'd0;
        rd_data_7_temp <= 32'd0;
    end
    else
    begin
        rd_data_0_temp <= rd_data_0;
        rd_data_1_temp <= rd_data_1;
        rd_data_2_temp <= rd_data_2;
        rd_data_3_temp <= rd_data_3;
        rd_data_4_temp <= rd_data_4;
        rd_data_5_temp <= rd_data_5;
        rd_data_6_temp <= rd_data_6;
        rd_data_7_temp <= rd_data_7;
    end
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        enable <= 1'b0;
    else if(top_rd_sop)
        enable <= 1'b1;
    else if(top_rd_eop)
        enable <= 1'b0;
    else
        enable <= enable;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        cnt <= 3'd0;
    else if(top_rd_sop || top_rd_eop)
        cnt <= 3'd0;
    else if(top_rd_vld)
        cnt <= cnt + 1'b1;
    else
        cnt <= cnt;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        sel <= 3'd0;
    else if(top_rd_sop || top_rd_eop)
        sel <= 3'd0;
    else if(cnt == 3'd7 && top_rd_vld)
        sel <= sel + 1'b1;
    else
        sel <= sel;
end

always@(*)
begin
    if(~rst_n)
        top_rd_eop = 1'b0;
    else if(sel == 3'd7 && cnt == 3'd7 && top_rd_vld)
        top_rd_eop = 1'b1;
    else
        top_rd_eop = 1'b0;
end

always@(*)
begin
    if(~rst_n)
        top_rd_vld = 1'b0;
    else 
    case(sel)
        3'b000: top_rd_vld = rd_vld_0_temp;
        3'b001: top_rd_vld = rd_vld_1_temp;
        3'b010: top_rd_vld = rd_vld_2_temp;
        3'b011: top_rd_vld = rd_vld_3_temp;
        3'b100: top_rd_vld = rd_vld_4_temp;
        3'b101: top_rd_vld = rd_vld_5_temp;
        3'b110: top_rd_vld = rd_vld_6_temp;
        3'b111: top_rd_vld = rd_vld_7_temp;
    endcase
end

always@(*)
begin
    if(~rst_n)
        top_rd_data = 32'd0;
    else 
    case(sel)
        3'b000: top_rd_data[15:0] = rd_data_0_temp;
        3'b001: top_rd_data[15:0] = rd_data_1_temp;
        3'b010: top_rd_data[15:0] = rd_data_2_temp;
        3'b011: top_rd_data[15:0] = rd_data_3_temp;
        3'b100: top_rd_data[15:0] = rd_data_4_temp;
        3'b101: top_rd_data[15:0] = rd_data_5_temp;
        3'b110: top_rd_data[15:0] = rd_data_6_temp;
        3'b111: top_rd_data[15:0] = rd_data_7_temp;
    endcase
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        top_cnt <= 6'd0;
    else if(enable)
        top_cnt <= top_rd_vld ? top_cnt + 1'b1 : top_cnt;
    else
        top_cnt <= 6'd0;       
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        top_rd_err <= 1'd0;
    else if(top_rd_eop)
        top_rd_err <= ~(top_cnt == 6'd63);
    else
        top_rd_err <= 1'd0;       
end
endmodule
