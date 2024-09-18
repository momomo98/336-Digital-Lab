`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 15:36:55
// Design Name: 
// Module Name: pe_result_cache
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


module pe_result_cache(
    input wire clk,
    input wire rst_n,

    input wire save_sop,

    input wire [15:0] result0_0,
    input wire [15:0] result1_0,
    input wire [15:0] result2_0,
    input wire [15:0] result3_0,
    input wire [15:0] result4_0,
    input wire [15:0] result5_0,
    input wire [15:0] result6_0,
    input wire [15:0] result7_0,

    input wire [15:0] result0_1,
    input wire [15:0] result1_1,
    input wire [15:0] result2_1,
    input wire [15:0] result3_1,
    input wire [15:0] result4_1,
    input wire [15:0] result5_1,
    input wire [15:0] result6_1,
    input wire [15:0] result7_1,

    input wire [15:0] result0_2,
    input wire [15:0] result1_2,
    input wire [15:0] result2_2,
    input wire [15:0] result3_2,
    input wire [15:0] result4_2,
    input wire [15:0] result5_2,
    input wire [15:0] result6_2,
    input wire [15:0] result7_2,

    input wire [15:0] result0_3,
    input wire [15:0] result1_3,
    input wire [15:0] result2_3,
    input wire [15:0] result3_3,
    input wire [15:0] result4_3,
    input wire [15:0] result5_3,
    input wire [15:0] result6_3,
    input wire [15:0] result7_3,

    input wire [15:0] result0_4,
    input wire [15:0] result1_4,
    input wire [15:0] result2_4,
    input wire [15:0] result3_4,
    input wire [15:0] result4_4,
    input wire [15:0] result5_4,
    input wire [15:0] result6_4,
    input wire [15:0] result7_4,

    input wire [15:0] result0_5,
    input wire [15:0] result1_5,
    input wire [15:0] result2_5,
    input wire [15:0] result3_5,
    input wire [15:0] result4_5,
    input wire [15:0] result5_5,
    input wire [15:0] result6_5,
    input wire [15:0] result7_5,

    input wire [15:0] result0_6,
    input wire [15:0] result1_6,
    input wire [15:0] result2_6,
    input wire [15:0] result3_6,
    input wire [15:0] result4_6,
    input wire [15:0] result5_6,
    input wire [15:0] result6_6,
    input wire [15:0] result7_6,

    input wire [15:0] result0_7,
    input wire [15:0] result1_7,
    input wire [15:0] result2_7,
    input wire [15:0] result3_7,
    input wire [15:0] result4_7,
    input wire [15:0] result5_7,
    input wire [15:0] result6_7,
    input wire [15:0] result7_7,
    
    input wire top_rd_sop,
    output wire top_rd_eop,
    output wire top_rd_vld,
    output wire [31:0] top_rd_data,
    output wire top_rd_err

    );
    
    wire rd_sop_0;
    wire rd_sop_1;
    wire rd_sop_2;
    wire rd_sop_3;
    wire rd_sop_4;
    wire rd_sop_5;
    wire rd_sop_6;
    wire rd_sop_7;

    wire rd_eop_0;
    wire rd_eop_1;
    wire rd_eop_2;
    wire rd_eop_3;
    wire rd_eop_4;
    wire rd_eop_5;
    wire rd_eop_6;
    wire rd_eop_7;

    wire rd_vld_0;
    wire rd_vld_1;
    wire rd_vld_2;
    wire rd_vld_3;
    wire rd_vld_4;
    wire rd_vld_5;
    wire rd_vld_6;
    wire rd_vld_7;

    wire [15:0] rd_data_0;
    wire [15:0] rd_data_1;
    wire [15:0] rd_data_2;
    wire [15:0] rd_data_3;
    wire [15:0] rd_data_4;
    wire [15:0] rd_data_5;
    wire [15:0] rd_data_6;
    wire [15:0] rd_data_7;
result_ram result_ram0
(
    .clk(clk),
    .rst_n(rst_n),

    .save_sop(save_sop),
    .data0(result0_0),
    .data1(result1_0),
    .data2(result2_0),
    .data3(result3_0),
    .data4(result4_0),
    .data5(result5_0),
    .data6(result6_0),
    .data7(result7_0),
    
    .rd_sop(rd_sop_0),
    .rd_eop(rd_eop_0),
    .rd_vld(rd_vld_0),
    .rd_data(rd_data_0)
    );

result_ram result_ram1
(
    .clk(clk),
    .rst_n(rst_n),

    .save_sop(save_sop),
    .data0(result0_1),
    .data1(result1_1),
    .data2(result2_1),
    .data3(result3_1),
    .data4(result4_1),
    .data5(result5_1),
    .data6(result6_1),
    .data7(result7_1),
    
    .rd_sop(rd_sop_1),
    .rd_eop(rd_eop_1),
    .rd_vld(rd_vld_1),
    .rd_data(rd_data_1)
    );

result_ram result_ram2
(
    .clk(clk),
    .rst_n(rst_n),

    .save_sop(save_sop),
    .data0(result0_2),
    .data1(result1_2),
    .data2(result2_2),
    .data3(result3_2),
    .data4(result4_2),
    .data5(result5_2),
    .data6(result6_2),
    .data7(result7_2),
    
    .rd_sop(rd_sop_2),
    .rd_eop(rd_eop_2),
    .rd_vld(rd_vld_2),
    .rd_data(rd_data_2)
    );

result_ram result_ram3
(
    .clk(clk),
    .rst_n(rst_n),

    .save_sop(save_sop),
    .data0(result0_3),
    .data1(result1_3),
    .data2(result2_3),
    .data3(result3_3),
    .data4(result4_3),
    .data5(result5_3),
    .data6(result6_3),
    .data7(result7_3),
    
    .rd_sop(rd_sop_3),
    .rd_eop(rd_eop_3),
    .rd_vld(rd_vld_3),
    .rd_data(rd_data_3)
    );

result_ram result_ram4
(
    .clk(clk),
    .rst_n(rst_n),

    .save_sop(save_sop),
    .data0(result0_4),
    .data1(result1_4),
    .data2(result2_4),
    .data3(result3_4),
    .data4(result4_4),
    .data5(result5_4),
    .data6(result6_4),
    .data7(result7_4),
    
    .rd_sop(rd_sop_4),
    .rd_eop(rd_eop_4),
    .rd_vld(rd_vld_4),
    .rd_data(rd_data_4)
    );

result_ram result_ram5
(
    .clk(clk),
    .rst_n(rst_n),

    .save_sop(save_sop),
    .data0(result0_5),
    .data1(result1_5),
    .data2(result2_5),
    .data3(result3_5),
    .data4(result4_5),
    .data5(result5_5),
    .data6(result6_5),
    .data7(result7_5),
    
    .rd_sop(rd_sop_5),
    .rd_eop(rd_eop_5),
    .rd_vld(rd_vld_5),
    .rd_data(rd_data_5)
    );

result_ram result_ram6
(
    .clk(clk),
    .rst_n(rst_n),

    .save_sop(save_sop),
    .data0(result0_6),
    .data1(result1_6),
    .data2(result2_6),
    .data3(result3_6),
    .data4(result4_6),
    .data5(result5_6),
    .data6(result6_6),
    .data7(result7_6),
    
    .rd_sop(rd_sop_6),
    .rd_eop(rd_eop_6),
    .rd_vld(rd_vld_6),
    .rd_data(rd_data_6)
    );

result_ram result_ram7
(
    .clk(clk),
    .rst_n(rst_n),

    .save_sop(save_sop),
    .data0(result0_7),
    .data1(result1_7),
    .data2(result2_7),
    .data3(result3_7),
    .data4(result4_7),
    .data5(result5_7),
    .data6(result6_7),
    .data7(result7_7),
    
    .rd_sop(rd_sop_7),
    .rd_eop(rd_eop_7),
    .rd_vld(rd_vld_7),
    .rd_data(rd_data_7)
    );

result_top_control u_result_top_control(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    .rd_sop_0                           (rd_sop_0                  ),
    .rd_eop_0                           (rd_eop_0                  ),
    .rd_vld_0                           (rd_vld_0                  ),
    .rd_data_0                          (rd_data_0                 ),
    .rd_sop_1                           (rd_sop_1                  ),
    .rd_eop_1                           (rd_eop_1                  ),
    .rd_vld_1                           (rd_vld_1                  ),
    .rd_data_1                          (rd_data_1                 ),
    .rd_sop_2                           (rd_sop_2                  ),
    .rd_eop_2                           (rd_eop_2                  ),
    .rd_vld_2                           (rd_vld_2                  ),
    .rd_data_2                          (rd_data_2                 ),
    .rd_sop_3                           (rd_sop_3                  ),
    .rd_eop_3                           (rd_eop_3                  ),
    .rd_vld_3                           (rd_vld_3                  ),
    .rd_data_3                          (rd_data_3                 ),
    .rd_sop_4                           (rd_sop_4                  ),
    .rd_eop_4                           (rd_eop_4                  ),
    .rd_vld_4                           (rd_vld_4                  ),
    .rd_data_4                          (rd_data_4                 ),
    .rd_sop_5                           (rd_sop_5                  ),
    .rd_eop_5                           (rd_eop_5                  ),
    .rd_vld_5                           (rd_vld_5                  ),
    .rd_data_5                          (rd_data_5                 ),
    .rd_sop_6                           (rd_sop_6                  ),
    .rd_eop_6                           (rd_eop_6                  ),
    .rd_vld_6                           (rd_vld_6                  ),
    .rd_data_6                          (rd_data_6                 ),
    .rd_sop_7                           (rd_sop_7                  ),
    .rd_eop_7                           (rd_eop_7                  ),
    .rd_vld_7                           (rd_vld_7                  ),
    .rd_data_7                          (rd_data_7                 ),
    .top_rd_sop                         (top_rd_sop                ),
    .top_rd_eop                         (top_rd_eop                ),
    .top_rd_vld                         (top_rd_vld                ),
    .top_rd_data                        (top_rd_data               ),
    .top_rd_err                         (top_rd_err                )
);

endmodule
