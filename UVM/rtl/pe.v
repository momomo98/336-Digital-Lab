`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/27 22:22:45
// Design Name: 
// Module Name: pe
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


module pe(
    //system
    input  wire                         clk                        ,
    input  wire                         rst_n                      ,
    //pe-port
    input  wire                         i_clear                    ,
    input  wire signed [  15: 0]        i_weight                   ,
    input  wire signed [  15: 0]        i_map                      ,
    output reg  signed [  15: 0]        o_weight                   ,
    output reg  signed [  15: 0]        o_map                      ,
    output wire  signed [  15: 0]       o_result                    
    );
    
reg [3:0] work_cnt;
reg work_enable;

reg signed [31:0] temp;
assign o_result = temp >> 8;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        work_enable <= 1'd0;
    else if(i_clear)
        work_enable <= 1'b1;
    else if(work_cnt == 4'd15)
        work_enable <= 1'b0;
    else
        work_enable <= work_enable;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        work_cnt <= 4'd0;
    else if(work_enable)
        work_cnt <= work_cnt + 1'b1;
    else
        work_cnt <= 4'd0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        o_weight <= 16'd0;
    else if(work_enable)
        o_weight <= i_weight;
    else
        o_weight <= 16'd0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        o_map <= 16'd0;
    else if(work_enable)
        o_map <= i_map;
    else
        o_map <= 16'd0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        temp <= 32'd0;
    else if(i_clear)
        temp <= 32'd0;
    else if(work_enable)
        temp <= temp + ({{16{i_weight[15]}},i_weight} * {{16{i_map[15]}},i_map});
    else
        temp <= temp;
end

endmodule
