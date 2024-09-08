`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 14:41:21
// Design Name: 
// Module Name: result_ram
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


module result_ram
(
    input wire clk,
    input wire rst_n,

    input wire save_sop,
    input wire [15:0] data0,
    input wire [15:0] data1,
    input wire [15:0] data2,
    input wire [15:0] data3,
    input wire [15:0] data4,
    input wire [15:0] data5,
    input wire [15:0] data6,
    input wire [15:0] data7,
    
    input wire rd_sop,
    output reg rd_eop,
    output reg rd_vld,
    output reg [15:0] rd_data
    );

reg [15:0] mem [0:7];
reg [2:0] addr_point;
always@(posedge clk or negedge rst_n)begin
    if(~rst_n)begin
        mem[0] <= 16'd0;
        mem[1] <= 16'd0;
        mem[2] <= 16'd0;
        mem[3] <= 16'd0;
        mem[4] <= 16'd0;
        mem[5] <= 16'd0;
        mem[6] <= 16'd0;
        mem[7] <= 16'd0;
    end
    else if(save_sop)begin
        mem[0] <= data0;
        mem[1] <= data1;
        mem[2] <= data2;
        mem[3] <= data3;
        mem[4] <= data4;
        mem[5] <= data5;
        mem[6] <= data6;
        mem[7] <= data7;
    end
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        addr_point <= 3'd0;
    else if(rd_vld)
        addr_point <= addr_point + 1'b1;
    else
        addr_point <= 3'd0; 
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        rd_vld <= 1'd0;
    else if(rd_sop || rd_eop)
        rd_vld <= ~rd_vld;
    else
        rd_vld <= rd_vld; 
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        rd_eop <= 1'd0;
    else if(addr_point == 8'd6)
        rd_eop <= 1'b1;
    else
        rd_eop <= 1'b0; 
end

always@(*)begin
    if(~rst_n)
        rd_data <= 16'd0;
    else if(rd_vld)begin
        case(addr_point)
            8'd0:rd_data = mem[0]; 
            8'd1:rd_data = mem[1]; 
            8'd2:rd_data = mem[2]; 
            8'd3:rd_data = mem[3]; 
            8'd4:rd_data = mem[4]; 
            8'd5:rd_data = mem[5]; 
            8'd6:rd_data = mem[6]; 
            8'd7:rd_data = mem[7]; 
        endcase
    end
end
endmodule
