`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/06 14:34:06
// Design Name: 
// Module Name: axi_interconnect
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

//
`define ACC_ADDRESS_RANGE 32'h8000_0000; 
`define DDR_ADDRESS_RANGE 32'h0000_0000; //32'h0000_0000 - 32'h4000_0000 共1GB 

module axi_interconnect(

    //reference: AMBA AXI Protocol 
    //Version：2.0 
    //Specification

    //******************************AXI Interface******************************
    //global AXI signals
    input  wire                         clk                        ,
    input  wire                         rst_n                      ,
    //write address channel signals
    input  wire        [   3: 0]        controller_awid            ,
    input  wire        [  31: 0]        controller_awaddr          ,
    input  wire        [   7: 0]        controller_awlen           ,
    input  wire        [   2: 0]        controller_awsize          ,
    input  wire        [   1: 0]        controller_awburst         ,
    input  wire        [   1: 0]        controller_awlock          ,
    input  wire [3:0] controller_awcache,
    input  wire        [   2: 0]        controller_awprot          ,
    input  wire                         controller_awvalid         ,
    output reg                          controller_awready         ,
    //write data channel signals
    input  wire        [   3: 0]        controller_wid             ,
    input  wire        [  31: 0]        controller_wdata           ,
    input  wire        [   3: 0]        controller_wstrb           ,
    input  wire                         controller_wlast           ,
    input  wire                         controller_wvalid          ,
    output reg                          controller_wready          ,
    //write response channel signals
    output wire        [   3: 0]        controller_bid             ,
    output wire        [   1: 0]        controller_bresp           ,
    output wire                         controller_bvalid          ,
    input  wire                         controller_bready          ,
    //read address channel signals
    input  wire        [   3: 0]        controller_arid            ,
    input  wire        [  31: 0]        controller_araddr          ,
    input  wire        [   7: 0]        controller_arlen           ,
    input  wire        [   2: 0]        controller_arsize          ,
    input  wire        [   1: 0]        controller_arburst         ,
    input  wire        [   1: 0]        controller_arlock          ,
    input  wire        [   3: 0]        controller_arcache         ,
    input  wire        [   2: 0]        controller_arprot          ,
    input  wire                         controller_arvalid         ,
    output reg                          controller_arready         ,
    //read data channel signals
    output reg        [   3: 0]        controller_rid             ,
    output reg        [  31: 0]        controller_rdata           ,
    output reg        [   1: 0]        controller_rresp           ,
    output reg                          controller_rlast           ,
    output reg                         controller_rvalid          ,
    input  wire                         controller_rready          ,
    //******************************Slave DDR Controller Interface******************************
    output reg         [   3: 0]        ddr_awid                   ,
    output reg         [  31: 0]        ddr_awaddr                 ,
    output reg         [   7: 0]        ddr_awlen                  ,
    output reg         [   2: 0]        ddr_awsize                 ,
    output reg         [   1: 0]        ddr_awburst                ,
    output wire        [   1: 0]        ddr_awlock                 ,
    output wire        [   3: 0]        ddr_awcache                ,
    output wire        [   2: 0]        ddr_awprot                 ,
    output reg                          ddr_awvalid                ,
    input  wire                         ddr_awready                ,
    //write data channel signals
    output reg         [  31: 0]        ddr_wdata                  ,
    output reg         [   3: 0]        ddr_wstrb                  ,
    output reg                          ddr_wlast                  ,
    output reg                          ddr_wvalid                 ,
    input  wire                         ddr_wready                 ,
    //write response channel signals
    input  wire        [   3: 0]        ddr_bid                    ,
    input  wire        [   1: 0]        ddr_bresp                  ,
    input  wire                         ddr_bvalid                 ,
    output wire                         ddr_bready                 ,
    //read address channel signals
    output reg        [   3: 0]        ddr_arid                   ,
    output reg        [  31: 0]        ddr_araddr                 ,
    output reg        [   7: 0]        ddr_arlen                  ,
    output reg        [   2: 0]        ddr_arsize                 ,
    output reg        [   1: 0]        ddr_arburst                ,
    output wire        [   1: 0]        ddr_arlock                 ,
    output wire        [   3: 0]        ddr_arcache                ,
    output wire        [   2: 0]        ddr_arprot                 ,
    output reg                         ddr_arvalid                ,
    input  wire                         ddr_arready                ,
    //read data channel signals
    input  wire        [   3: 0]        ddr_rid                    ,
    input  wire        [  31: 0]        ddr_rdata                  ,
    input  wire        [   1: 0]        ddr_rresp                  ,
    input  wire                         ddr_rlast                  ,
    input  wire                         ddr_rvalid                 ,
    output wire                         ddr_rready                 ,
    //******************************Slave DDR Controller Interface******************************
    // output wire        [   3: 0]        acc_awid                   ,
    // output wire        [  31: 0]        acc_awaddr                 ,
    // output wire        [   3: 0]        acc_awlen                  ,
    // output wire        [   2: 0]        acc_awsize                 ,
    // output wire        [   1: 0]        acc_awburst                ,
    // output wire        [   1: 0]        acc_awlock                 ,
    // output wire        [   2: 0]        acc_awprot                 ,
    // output wire                         acc_awvalid                ,
    input  wire                         acc_awready                ,
    // //write data channel signals
    // output wire        [   3: 0]        acc_wid                    ,
    // output wire        [  31: 0]        acc_wdata                  ,
    // output wire        [   3: 0]        acc_wstrb                  ,
    // output wire                         acc_wlast                  ,
    // output wire                         acc_wvalid                 ,
    input  wire                         acc_wready                 ,
    // //write response channel signals
    // input  wire        [   3: 0]        acc_bid                    ,
    // input  wire        [   1: 0]        acc_bresp                  ,
    // input  wire                         acc_bvalid                 ,
    // output wire                         acc_bready                 ,
    // //read address channel signals
    // output wire        [   3: 0]        acc_arid                   ,
    // output wire        [  31: 0]        acc_araddr                 ,
    // output wire        [   3: 0]        acc_arlen                  ,
    // output wire        [   2: 0]        acc_arsize                 ,
    // output wire        [   1: 0]        acc_arburst                ,
    // output wire        [   1: 0]        acc_arlock                 ,
    // output wire        [   3: 0]        acc_arcache                ,
    // output wire        [   2: 0]        acc_arprot                 ,
    // output wire                         acc_arvalid                ,
       input  wire                         acc_arready                
    // //read data channel signals
    // input  wire        [   3: 0]        acc_rid                    ,
    // input  wire        [  31: 0]        acc_rdata                  ,
    // input  wire        [   1: 0]        acc_rresp                  ,
    // input  reg                          acc_rlast                  ,
    // input  wire                         acc_rvalid                 ,
    // output wire                         acc_rready                 ,
);

//地址译码电路相关定义
reg slave_waddr_decode; //2选1，从机选择信号，通过地址译码 选择DDR或加速器ACC，1为DDR，0为ACC
//写数据outstanding相关定义
reg slave_wdata_decode; //2选1，从机选择信号，通过wid译码 选择DDR或加速器ACC，1为DDR，0为ACC
//写应答outstanding相关定义

//读地址译码电路相关定义
reg slave_raddr_decode; //2选1，从机选择信号，通过地址译码 选择DDR或加速器ACC，1为DDR，0为ACC
//读数据outstanding相关定义


//无关信号的电路接口
assign ddr_awcache = controller_awcache;
assign ddr_awlock = controller_awlock;
assign ddr_awprot = controller_awprot;
assign ddr_arlock = controller_arlock;
assign ddr_arcache = controller_arcache;
assign ddr_arprot = controller_arprot;

//写地址译码电路相关逻辑
    
always@(*) //ddr写地址线相关输出接口连线
begin
    case(slave_waddr_decode) // 1为DDR 0为ACC
        1'b1:
        begin
            ddr_awid = controller_awid;
            ddr_awaddr = controller_awaddr;
            ddr_awlen = controller_awlen;
            ddr_awsize = controller_awsize;
            ddr_awburst = controller_awburst;
            ddr_awvalid = controller_awvalid;
        end
        1'b0:
        begin
            ddr_awid = 4'd0;
            ddr_awaddr = 32'd0;
            ddr_awlen = 8'd0;
            ddr_awsize = 3'd0;
            ddr_awburst = 2'd0;
            ddr_awvalid = 1'd0;
        end
    endcase
end         

always@(*) //ddr写地址线相关输入接口连线
begin
    case(slave_waddr_decode) //1为DDR 0为ACC
        1'b1:
        begin
            controller_awready = ddr_awready;
        end
        1'b0:
        begin
            controller_awready = acc_awready;
        end
    endcase
end     

always@(posedge clk or negedge rst_n) //地址译码和选择
begin
    if(~rst_n)
        slave_waddr_decode <= 1'b0; //复位情况下，默认选择的设备是ACC
    else if(controller_awvalid)
    begin
        if(controller_awaddr[31:28] < 4'b0100) //高四位小于4，代表访问得是DDR
            slave_waddr_decode <= 1'b1;
        else if(controller_awaddr[31:28] == 4'b1000) //高四位等于8，代表访问的是加速器
            slave_waddr_decode <= 1'b0;
        else
            slave_waddr_decode <= slave_waddr_decode; //其他情况，保持slave_waddr_decode不变就行
    end
    else
        slave_waddr_decode <= slave_waddr_decode; //其他情况，保持slave_waddr_decode不变就行
end

//写数据outstanding相关逻辑
always@(*) //ddr写数据线相关输出接口连线
begin
    case(slave_waddr_decode) //1为DDR 0为ACC
        1'b1:
        begin
            ddr_wdata = controller_wdata;
            ddr_wstrb = controller_wstrb;
            ddr_wlast = controller_wlast;
            ddr_wvalid= controller_wvalid;
        end
        1'b0:
        begin
            ddr_wdata = 32'd0;
            ddr_wstrb = 4'd0;
            ddr_wlast = 1'd0;
            ddr_wvalid = 1'd0;
        end
    endcase
end     

always@(*) //ddr写地址线相关输入接口连线
begin
    case(slave_waddr_decode) // 1为DDR 0为ACC
        1'b1:
        begin
            controller_wready = ddr_wready;
        end
        1'b0:
        begin
            controller_wready = acc_wready;
        end
    endcase
end     

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
        slave_wdata_decode <= 1'b0; //复位情况下，默认选择的设备是ACC
    else if(controller_wvalid)
    begin
        if(controller_wid == 4'b0000) //4'b0000代表访问的从设备是DDR
            slave_wdata_decode <= 1'b1;
        else if(controller_wid == 4'b0001) //4'b0001代表访问的从设备是ACC
            slave_wdata_decode <= 1'b0; 
        else
            slave_wdata_decode <= slave_wdata_decode; //其他情况，保持slave_wdata_decode不变就行
    end
    else
        slave_wdata_decode <= slave_wdata_decode; //其他情况，保持slave_wdata_decode不变就行
end
//写应答outstanding相关逻辑
assign controller_bid = ddr_bid;
assign controller_bvalid = ddr_bvalid;
assign controller_bresp = ddr_bresp;
assign ddr_bready = controller_bready;

//读地址译码电路相关逻辑
always@(*) //ddr读地址线相关输出接口连线
begin
    case(slave_raddr_decode) // 1为DDR 0为ACC
        1'b1:
        begin
            ddr_arid = controller_arid;
            ddr_araddr = controller_araddr;
            ddr_arlen = controller_arlen;
            ddr_arsize = controller_arsize;
            ddr_arburst = controller_arburst;
            ddr_arvalid = controller_arvalid;
        end
        1'b0:
        begin
            ddr_arid = 4'd0;
            ddr_araddr = 32'd0;
            ddr_arlen = 8'd0;
            ddr_arsize = 3'd0;
            ddr_arburst = 2'd0;
            ddr_arvalid = 1'd0;
        end
    endcase
end       

always@(*) //ddr读地址线相关输入接口连线
begin
    case(slave_raddr_decode) //1为DDR 0为ACC
        1'b1:
        begin
            controller_arready = ddr_arready;
        end
        1'b0:
        begin
            controller_arready = acc_arready;
        end
    endcase
end     

always@(posedge clk or negedge rst_n) //地址译码和选择
begin
    if(~rst_n)
        slave_raddr_decode <= 1'b0; //复位情况下，默认选择的设备是ACC
    else if(controller_arvalid)
    begin
        if(controller_araddr[31:28] < 4'b0100) //高四位小于4，代表访问得是DDR
            slave_raddr_decode <= 1'b1;
        else if(controller_araddr[31:28] == 4'b1000) //高四位等于8，代表访问的是加速器
            slave_raddr_decode <= 1'b0;
        else
            slave_raddr_decode <= slave_raddr_decode; //其他情况，保持slave_raddr_decode不变就行
    end
    else
        slave_raddr_decode <= slave_raddr_decode; //其他情况，保持slave_raddr_decode不变就行
end
//读数据outstanding相关逻辑
assign ddr_rready = controller_rready;

always@(*) //ddr读数据线相关输出接口连线
begin
    case(slave_raddr_decode) //1为DDR 0为ACC
        1'b1:
        begin
            controller_rid = ddr_rid;
            controller_rdata = ddr_rdata;
            controller_rlast = ddr_rlast;
            controller_rvalid= ddr_rvalid;
            controller_rresp = ddr_rresp;
        end
        1'b0:
        begin
            controller_rid = 4'd0;
            controller_rdata = 32'd0;
            controller_rlast = 1'd0;
            controller_rvalid = 1'd0;
            controller_rresp = 2'd0;
        end
    endcase
end     
endmodule
