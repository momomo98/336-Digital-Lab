`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/07 22:59:26
// Design Name: 
// Module Name: apb2controller
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


module apb2controller(
    input wire pclk,
    input wire prstn,
    input wire [31:0] paddr,
    input wire [31:0] pdata,
    input wire psel,
    input wire penable,
    input wire pwrite,
    input wire perror,
    output reg [31:0] prdata,
    output reg pready
);

parameter [2:0] S_IDLE = 3'b001;
parameter [2:0] S_SETUP = 3'b010;
parameter [2:0] S_ACCESS = 3'b100;

reg [2:0] curr_state;
reg [2:0] last_state;
reg       ready_and_enable;
//ĞéÄâ¼Ä´æÆ÷1£º31-4 reserved 3-0 pri
reg [31:0] register1;
//ĞéÄâ¼Ä´æÆ÷2£º31-20 reserved 19-12 cnt 11-0 length
reg [31:0] register2;

//¼Ä´æÆ÷1ÅäÖÃ
always@(posedge pclk or negedge prstn)
begin
    if(~prstn)
        register1 <= 32'd0;
    else
        register1 <= (pwrite && psel && pready && (paddr == 32'h0000_0000)) ? pdata : register1;
end
//¼Ä´æÆ÷2ÅäÖÃ
always@(posedge pclk or negedge prstn)
begin
    if(~prstn)
        register2 <= 32'd0;
    else
        register2 <= (pwrite && psel && pready && (paddr == 32'h0000_0004)) ? pdata : register2;
end
//¼Ä´æÆ÷¶ÁÈ¡
always@(posedge pclk or negedge prstn)
begin
    if(~prstn)
        prdata <= 32'd0;
    else if(~pwrite && psel && pready)
    begin
        case(paddr)
            32'h0000_0000:prdata <= register1;
            32'h0000_0004:prdata <= register2;
            default:prdata <= 32'd0;
        endcase
    end
    else
        prdata <= 32'd0;
end

always@(posedge pclk or negedge prstn)
begin
    if(~prstn)
        pready <= 1'b0;
    else
        pready <= (curr_state == S_SETUP);
end

//×´Ì¬»úÌø×ªÏà¹Ø
always@(posedge pclk or negedge prstn)
begin
    if(~prstn)
        last_state <= S_IDLE;
    else
        last_state <= curr_state;
end

always@(posedge pclk or negedge prstn)
begin
    if(~prstn)
        ready_and_enable <= 1'b0;
    else
        ready_and_enable <= (pready && penable);
end

always@(*)
begin
    case(last_state)
    S_IDLE:begin
    if(psel)
        curr_state = S_SETUP;
    else
        curr_state = S_IDLE;
    end
   
    S_SETUP:begin
        curr_state = S_ACCESS;
    end
    S_ACCESS:begin
    if(ready_and_enable)
        curr_state = S_IDLE;
    else
        curr_state = S_ACCESS;
    end
    endcase
end


endmodule
