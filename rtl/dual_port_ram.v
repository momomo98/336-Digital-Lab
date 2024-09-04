`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/28 15:45:54
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram
(
    input wire clk,
    input wire rst_n,

    input wire wr_en,
    input wire [1:0] wr_strb,
    input wire [3:0] waddr,
    input wire [31:0] wdata,
    
    input wire rd_en,
    input wire [3:0] raddr,
    output reg [15:0] rdata
    );

reg [15:0] mem [0:15];
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
        mem[8] <= 16'd0;
        mem[9] <= 16'd0;
        mem[10] <= 16'd0;
        mem[11] <= 16'd0;
        mem[12] <= 16'd0;
        mem[13] <= 16'd0;
        mem[14] <= 16'd0;
        mem[15] <= 16'd0;
    end
    else if(wr_en)begin
        case(wr_strb)
            2'b11:begin
                mem[waddr] <= wdata[15:0];
                mem[waddr+1] <= wdata[31:16];
            end
            2'b10:begin
                mem[waddr+1] <= wdata[31:16];
            end
            2'b01:begin
                mem[waddr] <= wdata[15:0];
            end
            default:mem[waddr] <= mem[waddr];
        endcase
    end
end

always@(posedge clk)begin
    if(rd_en)
        rdata <= mem[raddr];
end
endmodule
