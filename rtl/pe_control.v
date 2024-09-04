`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/28 23:07:32
// Design Name: 
// Module Name: pe_control
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


module pe_control(
    input wire clk,
    input wire rst_n,
    input wire wr_sop,
    input wire wr_eop,
    input wire wr_vld,
    input wire [31:0] wr_data,
    
    input wire rd_sop,
    
    //pe_data
    output wire [15:0] pe_data_0,
    output wire [15:0] pe_data_1,
    output wire [15:0] pe_data_2,
    output wire [15:0] pe_data_3,
    output wire [15:0] pe_data_4,
    output wire [15:0] pe_data_5,
    output wire [15:0] pe_data_6,
    output wire [15:0] pe_data_7
    );

wire ram0_wr_en;
wire [1:0] ram0_wr_strb;
wire [3:0] ram0_wr_addr;
wire [31:0] ram0_wr_data;

wire ram1_wr_en;
wire [1:0] ram1_wr_strb;
wire [3:0] ram1_wr_addr;
wire [31:0] ram1_wr_data;

wire ram2_wr_en;
wire [1:0] ram2_wr_strb;
wire [3:0] ram2_wr_addr;
wire [31:0] ram2_wr_data;

wire ram3_wr_en;
wire [1:0] ram3_wr_strb;
wire [3:0] ram3_wr_addr;
wire [31:0] ram3_wr_data;

wire ram4_wr_en;
wire [1:0] ram4_wr_strb;
wire [3:0] ram4_wr_addr;
wire [31:0] ram4_wr_data;

wire ram5_wr_en;
wire [1:0] ram5_wr_strb;
wire [3:0] ram5_wr_addr;
wire [31:0] ram5_wr_data;

wire ram6_wr_en;
wire [1:0] ram6_wr_strb;
wire [3:0] ram6_wr_addr;
wire [31:0] ram6_wr_data;

wire ram7_wr_en;
wire [1:0] ram7_wr_strb;
wire [3:0] ram7_wr_addr;
wire [31:0] ram7_wr_data;

wire ram0_rd_en;
wire [3:0] ram0_rd_addr;
wire [15:0] ram0_rd_data;

wire ram1_rd_en;
wire [3:0] ram1_rd_addr;
wire [15:0] ram1_rd_data;

wire ram2_rd_en;
wire [3:0] ram2_rd_addr;
wire [15:0] ram2_rd_data;

wire ram3_rd_en;
wire [3:0] ram3_rd_addr;
wire [15:0] ram3_rd_data;

wire ram4_rd_en;
wire [3:0] ram4_rd_addr;
wire [15:0] ram4_rd_data;

wire ram5_rd_en;
wire [3:0] ram5_rd_addr;
wire [15:0] ram5_rd_data;

wire ram6_rd_en;
wire [3:0] ram6_rd_addr;
wire [15:0] ram6_rd_data;

wire ram7_rd_en;
wire [3:0] ram7_rd_addr;
wire [15:0] ram7_rd_data;

ram_wr_control 
#(
    .bus_data_vld(10'b00_0000_0110),
    .waddr1(4'd0), .wr_strb1(2'b11),
    .waddr2(4'd2), .wr_strb2(2'b01),
    .waddr3(4'd3), .wr_strb3(2'b11),
    .waddr4(4'd5), .wr_strb4(2'b01),
    .waddr5(4'd6), .wr_strb5(2'b11),
    .waddr6(4'd8), .wr_strb6(2'b01)
)ram_wr_control_0
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_sop(wr_sop),
    .wr_eop(wr_eop),
    .wr_vld(wr_vld),
    .wr_data(wr_data),
    
    .ram_wr_en(ram0_wr_en),
    .ram_wr_strb(ram0_wr_strb),
    .ram_wr_addr(ram0_wr_addr),
    .ram_wr_data(ram0_wr_data)
    );

ram_wr_control 
#(
    .bus_data_vld(10'b00_0000_1100),
    .waddr1(4'd1), .wr_strb1(2'b11),
    .waddr2(4'd3), .wr_strb2(2'b01),
    .waddr3(4'd4), .wr_strb3(2'b11),
    .waddr4(4'd6), .wr_strb4(2'b01),
    .waddr5(4'd7), .wr_strb5(2'b11),
    .waddr6(4'd9), .wr_strb6(2'b01)
)ram_wr_control_1
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_sop(wr_sop),
    .wr_eop(wr_eop),
    .wr_vld(wr_vld),
    .wr_data(wr_data),
    
    .ram_wr_en(ram1_wr_en),
    .ram_wr_strb(ram1_wr_strb),
    .ram_wr_addr(ram1_wr_addr),
    .ram_wr_data(ram1_wr_data)
    );

ram_wr_control 
#(
    .bus_data_vld(10'b00_0001_1000),
    .waddr1(4'd2), .wr_strb1(2'b11),
    .waddr2(4'd4), .wr_strb2(2'b01),
    .waddr3(4'd5), .wr_strb3(2'b11),
    .waddr4(4'd7), .wr_strb4(2'b01),
    .waddr5(4'd8), .wr_strb5(2'b11),
    .waddr6(4'd10), .wr_strb6(2'b01)
)ram_wr_control_2
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_sop(wr_sop),
    .wr_eop(wr_eop),
    .wr_vld(wr_vld),
    .wr_data(wr_data),
    
    .ram_wr_en(ram2_wr_en),
    .ram_wr_strb(ram2_wr_strb),
    .ram_wr_addr(ram2_wr_addr),
    .ram_wr_data(ram2_wr_data)
    );
   
ram_wr_control 
#(
    .bus_data_vld(10'b00_0011_0000),
    .waddr1(4'd3), .wr_strb1(2'b11),
    .waddr2(4'd5), .wr_strb2(2'b01),
    .waddr3(4'd6), .wr_strb3(2'b11),
    .waddr4(4'd8), .wr_strb4(2'b01),
    .waddr5(4'd9), .wr_strb5(2'b11),
    .waddr6(4'd11), .wr_strb6(2'b01)
)ram_wr_control_3
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_sop(wr_sop),
    .wr_eop(wr_eop),
    .wr_vld(wr_vld),
    .wr_data(wr_data),
    
    .ram_wr_en(ram3_wr_en),
    .ram_wr_strb(ram3_wr_strb),
    .ram_wr_addr(ram3_wr_addr),
    .ram_wr_data(ram3_wr_data)
    );
 
ram_wr_control 
#(
    .bus_data_vld(10'b00_0110_0000),
    .waddr1(4'd4), .wr_strb1(2'b11),
    .waddr2(4'd6), .wr_strb2(2'b01),
    .waddr3(4'd7), .wr_strb3(2'b11),
    .waddr4(4'd9), .wr_strb4(2'b01),
    .waddr5(4'd10), .wr_strb5(2'b11),
    .waddr6(4'd12), .wr_strb6(2'b01)
)ram_wr_control_4
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_sop(wr_sop),
    .wr_eop(wr_eop),
    .wr_vld(wr_vld),
    .wr_data(wr_data),
    
    .ram_wr_en(ram4_wr_en),
    .ram_wr_strb(ram4_wr_strb),
    .ram_wr_addr(ram4_wr_addr),
    .ram_wr_data(ram4_wr_data)
    );
    
ram_wr_control 
#(
    .bus_data_vld(10'b00_1100_0000),
    .waddr1(4'd5), .wr_strb1(2'b11),
    .waddr2(4'd7), .wr_strb2(2'b01),
    .waddr3(4'd8), .wr_strb3(2'b11),
    .waddr4(4'd10), .wr_strb4(2'b01),
    .waddr5(4'd11), .wr_strb5(2'b11),
    .waddr6(4'd13), .wr_strb6(2'b01)
)ram_wr_control_5
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_sop(wr_sop),
    .wr_eop(wr_eop),
    .wr_vld(wr_vld),
    .wr_data(wr_data),
    
    .ram_wr_en(ram5_wr_en),
    .ram_wr_strb(ram5_wr_strb),
    .ram_wr_addr(ram5_wr_addr),
    .ram_wr_data(ram5_wr_data)
    ); 
   
ram_wr_control 
#(
    .bus_data_vld(10'b01_1000_0000),
    .waddr1(4'd6), .wr_strb1(2'b11),
    .waddr2(4'd8), .wr_strb2(2'b01),
    .waddr3(4'd9), .wr_strb3(2'b11),
    .waddr4(4'd11), .wr_strb4(2'b01),
    .waddr5(4'd12), .wr_strb5(2'b11),
    .waddr6(4'd14), .wr_strb6(2'b01)
)ram_wr_control_6
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_sop(wr_sop),
    .wr_eop(wr_eop),
    .wr_vld(wr_vld),
    .wr_data(wr_data),
    
    .ram_wr_en(ram6_wr_en),
    .ram_wr_strb(ram6_wr_strb),
    .ram_wr_addr(ram6_wr_addr),
    .ram_wr_data(ram6_wr_data)
    );    
   
ram_wr_control 
#(
    .bus_data_vld(10'b11_0000_0000),
    .waddr1(4'd7), .wr_strb1(2'b11),
    .waddr2(4'd9), .wr_strb2(2'b01),
    .waddr3(4'd10), .wr_strb3(2'b11),
    .waddr4(4'd12), .wr_strb4(2'b01),
    .waddr5(4'd13), .wr_strb5(2'b11),
    .waddr6(4'd15), .wr_strb6(2'b01)
)ram_wr_control_7
(
    .clk(clk),
    .rst_n(rst_n),
    .wr_sop(wr_sop),
    .wr_eop(wr_eop),
    .wr_vld(wr_vld),
    .wr_data(wr_data),
    
    .ram_wr_en(ram7_wr_en),
    .ram_wr_strb(ram7_wr_strb),
    .ram_wr_addr(ram7_wr_addr),
    .ram_wr_data(ram7_wr_data)
    );
    
dual_port_ram dual_port_ram_0(
    .clk(clk),
    .rst_n(rst_n),

    .wr_en(ram0_wr_en),
    .wr_strb(ram0_wr_strb),
    .waddr(ram0_wr_addr),
    .wdata(ram0_wr_data),
    
    .rd_en(ram0_rd_en),
    .raddr(ram0_rd_addr),
    .rdata(ram0_rd_data)
    );
    
dual_port_ram dual_port_ram_1(
    .clk(clk),
    .rst_n(rst_n),

    .wr_en(ram1_wr_en),
    .wr_strb(ram1_wr_strb),
    .waddr(ram1_wr_addr),
    .wdata(ram1_wr_data),
    
    .rd_en(ram1_rd_en),
    .raddr(ram1_rd_addr),
    .rdata(ram1_rd_data)
    );

dual_port_ram dual_port_ram_2(
    .clk(clk),
    .rst_n(rst_n),

    .wr_en(ram2_wr_en),
    .wr_strb(ram2_wr_strb),
    .waddr(ram2_wr_addr),
    .wdata(ram2_wr_data),
    
    .rd_en(ram2_rd_en),
    .raddr(ram2_rd_addr),
    .rdata(ram2_rd_data)
    );

dual_port_ram dual_port_ram_3(
    .clk(clk),
    .rst_n(rst_n),

    .wr_en(ram3_wr_en),
    .wr_strb(ram3_wr_strb),
    .waddr(ram3_wr_addr),
    .wdata(ram3_wr_data),
    
    .rd_en(ram3_rd_en),
    .raddr(ram3_rd_addr),
    .rdata(ram3_rd_data)
    );

dual_port_ram dual_port_ram_4(
    .clk(clk),
    .rst_n(rst_n),

    .wr_en(ram4_wr_en),
    .wr_strb(ram4_wr_strb),
    .waddr(ram4_wr_addr),
    .wdata(ram4_wr_data),
    
    .rd_en(ram4_rd_en),
    .raddr(ram4_rd_addr),
    .rdata(ram4_rd_data)
    );

dual_port_ram dual_port_ram_5(
    .clk(clk),
    .rst_n(rst_n),

    .wr_en(ram5_wr_en),
    .wr_strb(ram5_wr_strb),
    .waddr(ram5_wr_addr),
    .wdata(ram5_wr_data),
    
    .rd_en(ram5_rd_en),
    .raddr(ram5_rd_addr),
    .rdata(ram5_rd_data)
    );


dual_port_ram dual_port_ram_6(
    .clk(clk),
    .rst_n(rst_n),

    .wr_en(ram6_wr_en),
    .wr_strb(ram6_wr_strb),
    .waddr(ram6_wr_addr),
    .wdata(ram6_wr_data),
    
    .rd_en(ram6_rd_en),
    .raddr(ram6_rd_addr),
    .rdata(ram6_rd_data)
    );

dual_port_ram dual_port_ram_7(
    .clk(clk),
    .rst_n(rst_n),

    .wr_en(ram7_wr_en),
    .wr_strb(ram7_wr_strb),
    .waddr(ram7_wr_addr),
    .wdata(ram7_wr_data),
    
    .rd_en(ram7_rd_en),
    .raddr(ram7_rd_addr),
    .rdata(ram7_rd_data)
    );

ram_rd_control ram_rd_control_0(
    .clk(clk),
    .rst_n(rst_n),

    .rd_sop(rd_sop),

    .ram_rd_en(ram0_rd_en),
    .ram_raddr(ram0_rd_addr),
    .ram_rdata(ram0_rd_data),

    .pe_data(pe_data_0)
    );

ram_rd_control ram_rd_control_1(
    .clk(clk),
    .rst_n(rst_n),

    .rd_sop(rd_sop),

    .ram_rd_en(ram1_rd_en),
    .ram_raddr(ram1_rd_addr),
    .ram_rdata(ram1_rd_data),

    .pe_data(pe_data_1)
    );

ram_rd_control ram_rd_control_2(
    .clk(clk),
    .rst_n(rst_n),

    .rd_sop(rd_sop),

    .ram_rd_en(ram2_rd_en),
    .ram_raddr(ram2_rd_addr),
    .ram_rdata(ram2_rd_data),

    .pe_data(pe_data_2)
    );
    
ram_rd_control ram_rd_control_3(
    .clk(clk),
    .rst_n(rst_n),

    .rd_sop(rd_sop),

    .ram_rd_en(ram3_rd_en),
    .ram_raddr(ram3_rd_addr),
    .ram_rdata(ram3_rd_data),

    .pe_data(pe_data_3)
    );

ram_rd_control ram_rd_control_4(
    .clk(clk),
    .rst_n(rst_n),

    .rd_sop(rd_sop),

    .ram_rd_en(ram4_rd_en),
    .ram_raddr(ram4_rd_addr),
    .ram_rdata(ram4_rd_data),

    .pe_data(pe_data_4)
    );
    
ram_rd_control ram_rd_control_5(
    .clk(clk),
    .rst_n(rst_n),

    .rd_sop(rd_sop),

    .ram_rd_en(ram5_rd_en),
    .ram_raddr(ram5_rd_addr),
    .ram_rdata(ram5_rd_data),

    .pe_data(pe_data_5)
    );

ram_rd_control ram_rd_control_6(
    .clk(clk),
    .rst_n(rst_n),

    .rd_sop(rd_sop),

    .ram_rd_en(ram6_rd_en),
    .ram_raddr(ram6_rd_addr),
    .ram_rdata(ram6_rd_data),

    .pe_data(pe_data_6)
    );
        
ram_rd_control ram_rd_control_7(
    .clk(clk),
    .rst_n(rst_n),

    .rd_sop(rd_sop),

    .ram_rd_en(ram7_rd_en),
    .ram_raddr(ram7_rd_addr),
    .ram_rdata(ram7_rd_data),

    .pe_data(pe_data_7)
    );
                                
endmodule
