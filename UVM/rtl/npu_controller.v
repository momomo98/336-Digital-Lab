`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/03 14:26:56
// Design Name: 
// Module Name: npu_controller
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


module npu_controller(
    input wire clk,
    input wire rst_n,
    //AXI2NPU_interface
    input wire wr_eop_data,
    input wire wr_eop_weight,
    //pe_array
    output reg clear,
    //pe_control
    output reg rd_sop_0,
    output reg rd_sop_1,
    //pe_result_cache
    input wire [7:0] rd_eop,
    output reg save_finish,
    output reg save_sop
    );

localparam S_IDLE = 5'b0_0001;
localparam S_EXEC = 5'b0_0010;
localparam S_SAVE = 5'b0_0100;
localparam S_WAIT = 5'b0_1000;
localparam S_OVER = 5'b1_0000;

reg [4:0] curr_state;
reg [4:0] next_state;

reg [1:0] wr_eop_data_cnt;
reg [0:0] wr_eop_weight_cnt;

reg [4:0] pe_compute_cnt;

reg [7:0] rd_finish;

reg load_finish; //当pe_control(weight)与pe_control(data)中的缓存全部加载完毕后 该信号拉高一个周期

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        wr_eop_data_cnt <= 2'd0;
    else if(wr_eop_data_cnt == 2'b11 && wr_eop_weight_cnt == 1'b1)
        wr_eop_data_cnt <= 2'd0;
    else if(wr_eop_data)
        wr_eop_data_cnt <= wr_eop_data_cnt + 1'b1;
    else
        wr_eop_data_cnt <= wr_eop_data_cnt;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        wr_eop_weight_cnt <= 1'd0;
    else if(wr_eop_data_cnt == 2'b11 && wr_eop_weight_cnt == 1'b1)
        wr_eop_weight_cnt <= 1'd0;
    else if(wr_eop_weight)
        wr_eop_weight_cnt <= 1'b1;
    else
        wr_eop_weight_cnt <= wr_eop_weight_cnt;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        load_finish <= 1'd0;
    else
        load_finish <= (wr_eop_data_cnt == 2'b11 && wr_eop_weight_cnt == 1'b1);
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rd_sop_0 <= 1'b0;
    else
        rd_sop_0 <= load_finish;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rd_sop_1 <= 1'b0;
    else
        rd_sop_1 <= load_finish;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        clear <= 1'b0;
    else
        clear <= load_finish;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        pe_compute_cnt <= 5'd0;
    else if(curr_state == S_EXEC)
        pe_compute_cnt <= pe_compute_cnt + 1'b1;
    else
        pe_compute_cnt <= 5'd0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        save_sop <= 1'b0;
    else if(curr_state == S_SAVE)
        save_sop <= 1'b1;
    else
        save_sop <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        rd_finish <= 8'b0;
    else if(curr_state == S_WAIT)
        rd_finish <= rd_finish | rd_eop;
    else if(rd_finish == 8'hff)
        rd_finish <= 8'd0;
    else
        rd_finish <= rd_finish;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        save_finish <= 1'b0;
    else if(curr_state == S_WAIT)
        save_finish <= 1'b1;
    else
        save_finish <= 1'b0;
end
//********************* state machine *********************
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        curr_state <= S_IDLE;
    else
        curr_state <= next_state;
end

always@(*)
begin
    if(~rst_n)
        next_state = S_IDLE;
    else begin
        case(curr_state)
            S_IDLE:
            begin
                if(load_finish)
                    next_state = S_EXEC;
                else
                    next_state = S_IDLE;
            end
            S_EXEC:
            begin
                if(pe_compute_cnt == 5'd24)
                    next_state = S_SAVE;
                else
                    next_state = S_EXEC;
            end
            S_SAVE:
            begin
                next_state = S_WAIT;
            end
            S_WAIT:
            begin
                if(rd_finish == 8'hff)
                    next_state = S_OVER;
                else
                    next_state = S_WAIT;
            end
            S_OVER:
            begin
                next_state = S_IDLE;
            end
        endcase
    end
end
endmodule
