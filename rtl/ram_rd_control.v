`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 11:01:25
// Design Name: 
// Module Name: ram_rd_control
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


module ram_rd_control(
    input wire clk,
    input wire rst_n,
    //rd start
    input wire rd_sop,
    //dual-ram port
    output reg ram_rd_en,
    output reg [3:0] ram_raddr,
    input wire [15:0] ram_rdata,
    //pe_port
    output wire [15:0] pe_data
    );

assign pe_data = ram_rdata;

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        ram_rd_en <= 1'b0;
    else if(ram_raddr == 4'd15 || rd_sop)
        ram_rd_en <= ~ram_rd_en;
    else
        ram_rd_en <= ram_rd_en;
end

always@(posedge clk or negedge rst_n)begin
    if(~rst_n)
        ram_raddr <= 4'd0;
    else if(rd_sop)
        ram_raddr <= 4'd0;
    else if(ram_rd_en)
        ram_raddr <= ram_raddr + 1'b1;
    else
        ram_raddr <= ram_raddr;
end

endmodule
