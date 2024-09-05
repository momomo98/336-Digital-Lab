module AXI2NPU_interface(
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
    output wire        [   3: 0]        acc_bid                    ,
    output wire        [   1: 0]        acc_bresp                  ,
    output wire                         acc_bvalid                 ,
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
    output wire                         acc_arready                 
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
    //NPU write data channel
    output reg                         npu_wr_sop_data             ,
    output reg                         npu_wr_eop_data             ,
    output reg                         npu_wr_vld_data             ,
    output reg        [  31: 0]        npu_wr_data_data           
);

//支持outstanding为8的AXI传输
//awlen-突发长度寄存器，这个参数在本npu设计中是固定的
reg [7:0] awlen_reg; 
//awsize-总线数据有效位宽，这个参数在npu设计中是固定的
reg [2:0] awsize_reg; 
//awburst-总线突发传输模式，这个参数在npu设计中固定选中increment
reg [2:0] awburst_reg; 

//用于记录outstanding顺序的fifo信号，由于AXI4没有wid，因此outstanding需按顺序传输，可以用fifo
wire awid_fifo_wr_vld;
wire [3:0] awid_fifo_wr_data;

wire awid_fifo_rd_vld;
wire [3:0] awid_fifo_rd_data;

wire awid_fifo_wr_full;
wire awid_fifo_rd_empty;

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

//记录写地址阶段的outstanding信息
assign awid_fifo_wr_vld = acc_awvalid && acc_awready;
assign awid_fifo_wr_data = (acc_awvalid && acc_awready) ? acc_awid : 4'd0;

//在写地址通道握手成功时，把本次写数据的突发长度赋值给寄存器awlen_reg
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        awlen_reg <= 8'd0;
    else if(acc_awvalid && acc_awready)
        awlen_reg <= acc_awlen;
    else
        awlen_reg <= awlen_reg;
end

//在写地址通道握手成功时，把本次写数据的位宽赋值给寄存器awsize_reg
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        awsize_reg <= 3'd0;
    else if(acc_awvalid && acc_awready)
        awsize_reg <= acc_awsize;
    else
        awsize_reg <= awsize_reg;
end

//在写地址通道握手成功时，把本次写数据的突发传输类型给寄存器awburst_reg
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        awburst_reg <= 2'd0;
    else if(acc_awvalid && acc_awready)
        awburst_reg <= acc_awburst;
    else
        awburst_reg <= awburst_reg;
end

//写地址通道握手信号aw_ready生成逻辑
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

//写数据通道握手信号w_ready生成逻辑 NPU永远都可以接收数据，但这是在上游或软件层面的基础上设计的
always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        acc_wready <= 1'b0;
    else if(acc_wvalid)
        acc_wready <= 1'b1;
end

endmodule