`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/11 14:15:20
// Design Name: 
// Module Name: AXI2NPU_interface
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


module AXI2NPU_interface(
    input  wire                         clk                        ,
    input  wire                         rst_n                      ,
    //wire addr channel signals
    input  wire        [   3: 0]        acc_awid                   ,
    input  wire        [  31: 0]        acc_awaddr                 ,
    input  wire        [   7: 0]        acc_awlen                  ,
    input  wire        [   2: 0]        acc_awsize                 ,
    input  wire        [   1: 0]        acc_awburst                ,
    input  wire        [   1: 0]        acc_awlock                 ,
    input  wire        [   3: 0]        acc_awcache                ,
    input  wire        [   2: 0]        acc_awprot                 ,
    input  wire                         acc_awvalid                ,
    output reg                          acc_awready                ,
    //write data channel signals
    input  wire        [  31: 0]        acc_wdata                  ,
    input  wire        [   3: 0]        acc_wstrb                  ,
    input  wire                         acc_wlast                  ,
    input  wire                         acc_wvalid                 ,
    output reg                          acc_wready                 ,
    //write response channel signals
    output reg         [   3: 0]        acc_bid                    ,
    output reg         [   1: 0]        acc_bresp                  ,
    output reg                          acc_bvalid                 ,
    input  wire                         acc_bready                 ,
    //read address channel signals
    input  wire        [   3: 0]        acc_arid                   ,
    input  wire        [  31: 0]        acc_araddr                 ,
    input  wire        [   7: 0]        acc_arlen                  ,
    input  wire        [   2: 0]        acc_arsize                 ,
    input  wire        [   1: 0]        acc_arburst                ,
    input  wire        [   1: 0]        acc_arlock                 ,
    input  wire        [   3: 0]        acc_arcache                ,
    input  wire        [   2: 0]        acc_arprot                 ,
    input  wire                         acc_arvalid                ,
    output wire                         acc_arready                , 
    //read data channel signals
    output wire        [   3: 0]        acc_rid                    ,
    output wire        [  31: 0]        acc_rdata                  ,
    output wire        [   1: 0]        acc_rresp                  ,
    output wire                         acc_rlast                  ,
    output wire                         acc_rvalid                 ,
    input  wire                         acc_rready                 ,

    //NPU write weight channel
    output reg                         npu_wr_sop_weight           ,
    output reg                         npu_wr_eop_weight           ,
    output reg                         npu_wr_vld_weight           ,
    output reg        [  31: 0]        npu_wr_data_weight          ,
    input wire                         npu_wr_err_weight           ,
    //NPU write data channel
    output reg                         npu_wr_sop_data             ,
    output reg                         npu_wr_eop_data             ,
    output reg                         npu_wr_vld_data             ,
    output reg        [  31: 0]        npu_wr_data_data            ,
    input wire                         npu_wr_err_data             ,
    //NPU read data channel
    output reg                         npu_rd_sop_data,
    input wire                         npu_rd_eop_data,
    input wire                         npu_rd_vld_data,
    input wire        [  31: 0]        npu_rd_data_data,
    input wire                         npu_rd_err
);

//support outstanding 8
//awlen-reg fixed and no useful now
reg [7:0] awlen_reg; 
//awsize-reg fixed and no useful now
reg [2:0] awsize_reg; 
//awburst-reg fixed to increment
reg [2:0] awburst_reg; 
//awport-reg 3'b100 is weight / 3'b000 is data
reg [2:0] awport_reg;

//temp
reg       npu_wr_eop_data_temp;
reg       npu_wr_eop_weight_temp;
reg       acc_wlast_temp;
reg       acc_wvalid_temp2;
reg       acc_wvalid_temp;
reg       awprot_fifo_rd_vld_temp;

//awid fifo signal, will be used to process outstanding
wire awid_fifo_wr_vld;
wire [3:0] awid_fifo_wr_data;
wire awid_fifo_rd_vld;
wire [3:0] awid_fifo_rd_data;
wire awid_fifo_wr_full;
wire awid_fifo_rd_empty;

//awprot fifo signal, will be used to process outstanding
wire awprot_fifo_wr_vld;
wire [2:0] awprot_fifo_wr_data;
wire awprot_fifo_rd_vld;
wire [2:0] awprot_fifo_rd_data;
wire awprot_fifo_wr_full;
wire awprot_fifo_rd_empty;

//awid fifo
fifo
#(
    .fifo_deep(8),
    .fifo_addr_width(3),
    .fifo_data_width(4)
)
awid_fifo
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_vld(awid_fifo_wr_vld),
    .wr_data(awid_fifo_wr_data),

    .rd_vld(awid_fifo_rd_vld),
    .rd_data(awid_fifo_rd_data),

    .wr_full(awid_fifo_wr_full),
    .rd_empty(awid_fifo_rd_empty)
);

//awprot fifo
fifo
#(
    .fifo_deep(8),
    .fifo_addr_width(3),
    .fifo_data_width(3)
)
awprot_fifo
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_vld(awprot_fifo_wr_vld),
    .wr_data(awprot_fifo_wr_data),

    .rd_vld(awprot_fifo_rd_vld),
    .rd_data(awprot_fifo_rd_data),

    .wr_full(awprot_fifo_wr_full),
    .rd_empty(awprot_fifo_rd_empty)
);

//fifo signal logic control
assign awid_fifo_wr_vld = acc_awvalid && acc_awready;
assign awid_fifo_wr_data = (acc_awvalid && acc_awready) ? acc_awid : 4'd0;
assign awid_fifo_rd_vld = acc_wlast;

assign awprot_fifo_wr_vld = acc_awvalid && acc_awready;
assign awprot_fifo_wr_data = (acc_awvalid && acc_awready) ? acc_awprot : 3'd0;
assign awprot_fifo_rd_vld = acc_wvalid && (~acc_wvalid_temp);

//******************************************* register define and control *******************************************
//awlen_reg - fixed value during all of the work time
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        awlen_reg <= 8'd0;
    else if(acc_awvalid && acc_awready)
        awlen_reg <= acc_awlen;
    else
        awlen_reg <= awlen_reg;
end

//awsize_reg - fixed value during all of the work time
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        awsize_reg <= 3'd0;
    else if(acc_awvalid && acc_awready)
        awsize_reg <= acc_awsize;
    else
        awsize_reg <= awsize_reg;
end

//awburst_reg - fixed value during all of the work time
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        awburst_reg <= 2'd0;
    else if(acc_awvalid && acc_awready)
        awburst_reg <= acc_awburst;
    else
        awburst_reg <= awburst_reg;
end

//awport_reg - the value will be obtained in awport_fifo
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        awport_reg <= 3'd0;
    else if(awprot_fifo_rd_vld_temp)
        awport_reg <= awprot_fifo_rd_data;
    else
        awport_reg <= awport_reg;
end

//******************************************* axi interface of waddr channel *******************************************
//aw_ready control logic
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_awready <= 1'b0;
    else if(acc_awvalid && acc_awready)
        acc_awready <= 1'b0;
    else if(acc_awvalid == 1'b1)
        acc_awready <= 1'b1;
    else
        acc_awready <= 1'b0;
end

//******************************************* axi interface of wdata channel *******************************************
//w_ready control logic
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_wready <= 1'b0;
    else if(acc_wlast)
        acc_wready <= 1'b0;
    else if(acc_wvalid_temp2 && acc_wvalid) //only by see the boxing
        acc_wready <= 1'b1;
    else
        acc_wready <= acc_wready;
end

//******************************************* axi interface of bresp channel *******************************************
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_bid <= 4'b0000;
    else if(acc_wlast_temp)
        acc_bid <= awid_fifo_rd_data;
    else if(acc_bready && acc_bvalid)
        acc_bid <= 4'b0000;
    else
        acc_bid <= acc_bid;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_bresp <= 2'b00;
    else if(acc_wlast_temp)
        acc_bresp <= 2'b00;
    else
        acc_bresp <= acc_bresp;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_bvalid <= 1'b0;
    else if(acc_wlast_temp)
        acc_bvalid <= 1'b1;
    else if(acc_bready && acc_bvalid)
        acc_bvalid <= 1'b0;
    else
        acc_bvalid <= acc_bvalid;
end

//*************************** temp *************************** 
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_eop_data_temp <= 1'd0;
    else
        npu_wr_eop_data_temp <= (acc_wlast && (~awport_reg[2]));
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_eop_weight_temp <= 1'd0;
    else
        npu_wr_eop_weight_temp <= (acc_wlast && awport_reg[2]);
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_wlast_temp <= 1'd0;
    else
        acc_wlast_temp <= acc_wlast;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_wvalid_temp <= 1'd0;
    else
        acc_wvalid_temp <= acc_wvalid;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_wvalid_temp2 <= 1'd0;
    else
        acc_wvalid_temp2 <= acc_wvalid_temp;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        awprot_fifo_rd_vld_temp <= 1'd0;
    else
        awprot_fifo_rd_vld_temp <= awprot_fifo_rd_vld;
end
//******************************************* NPU interface *******************************************
//NPU control logic of weight interface
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_sop_weight <= 1'b0;
    else if(acc_wvalid_temp2 && acc_wvalid && (~acc_wready) && awport_reg[2])
        npu_wr_sop_weight <= 1'b1;
    else
        npu_wr_sop_weight <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_eop_weight <= 1'b0;
    else
        npu_wr_eop_weight <= npu_wr_eop_weight_temp;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_vld_weight <= 1'b0;
    else if(acc_wvalid && acc_wready && awport_reg[2])
        npu_wr_vld_weight <= 1'b1;
    else
        npu_wr_vld_weight <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_data_weight <= 32'd0;
    else if(acc_wvalid && acc_wready && awport_reg[2])
        npu_wr_data_weight <= acc_wdata;
    else
        npu_wr_data_weight <= 32'd0;
end

//NPU control logic of data interface
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_sop_data <= 1'b0;
    else if(acc_wvalid_temp2 && acc_wvalid && (~acc_wready) && (~awport_reg[2]))
        npu_wr_sop_data <= 1'b1;
    else
        npu_wr_sop_data <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_eop_data <= 1'b0;
    else
        npu_wr_eop_data <= npu_wr_eop_data_temp;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_vld_data <= 1'b0;
    else if(acc_wvalid && acc_wready && (~awport_reg[2]))
        npu_wr_vld_data <= 1'b1;
    else
        npu_wr_vld_data <= 1'b0;
end

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        npu_wr_data_data <= 32'd0;
    else if(acc_wvalid && acc_wready && (~awport_reg[2]))
        npu_wr_data_data <= acc_wdata;
    else
        npu_wr_data_data <= 32'd0;
end
endmodule
