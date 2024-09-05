`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 22:03:35
// Design Name: 
// Module Name: NPU
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


module NPU(
    input wire clk,
    input wire rst_n,
    //NPU write port
    input wire wr_sop_weight,
    input wire wr_eop_weight,
    input wire wr_vld_weight,
    input wire [31:0] wr_data_weight,
    
    input wire wr_sop_data,
    input wire wr_eop_data,
    input wire wr_vld_data,
    input wire [31:0] wr_data_data,
    //NPU read port
    output wire save_finish,
    
    input wire rd_sop_0,
    input wire rd_sop_1,
    input wire rd_sop_2,
    input wire rd_sop_3,
    input wire rd_sop_4,
    input wire rd_sop_5,
    input wire rd_sop_6,
    input wire rd_sop_7,

    output wire rd_eop_0,
    output wire rd_eop_1,
    output wire rd_eop_2,
    output wire rd_eop_3,
    output wire rd_eop_4,
    output wire rd_eop_5,
    output wire rd_eop_6,
    output wire rd_eop_7,

    output wire rd_vld_0,
    output wire rd_vld_1,
    output wire rd_vld_2,
    output wire rd_vld_3,
    output wire rd_vld_4,
    output wire rd_vld_5,
    output wire rd_vld_6,
    output wire rd_vld_7,

    output wire [15:0] rd_data_0,
    output wire [15:0] rd_data_1,
    output wire [15:0] rd_data_2,
    output wire [15:0] rd_data_3,
    output wire [15:0] rd_data_4,
    output wire [15:0] rd_data_5,
    output wire [15:0] rd_data_6,
    output wire [15:0] rd_data_7
);

    wire                                       pe_rd_sop_0                ;
    wire                                       pe_rd_sop_1                ;
    wire                                       clear                      ;
    wire                                       save_sop                   ;
    
    wire                                       i_pe_array_weight_vld0     ;
    wire                                       i_pe_array_weight_vld1     ;
    wire                                       i_pe_array_weight_vld2     ;
    wire                                       i_pe_array_weight_vld3     ;
    wire                                       i_pe_array_weight_vld4     ;
    wire                                       i_pe_array_weight_vld5     ;
    wire                                       i_pe_array_weight_vld6     ;
    wire                                       i_pe_array_weight_vld7     ;
    wire                      [15:0]           i_pe_array_weight0         ;
    wire                      [15:0]           i_pe_array_weight1         ;
    wire                      [15:0]           i_pe_array_weight2         ;
    wire                      [15:0]           i_pe_array_weight3         ;
    wire                      [15:0]           i_pe_array_weight4         ;
    wire                      [15:0]           i_pe_array_weight5         ;
    wire                      [15:0]           i_pe_array_weight6         ;
    wire                      [15:0]           i_pe_array_weight7         ;
    wire                                       i_pe_array_map_vld0        ;
    wire                                       i_pe_array_map_vld1        ;
    wire                                       i_pe_array_map_vld2        ;
    wire                                       i_pe_array_map_vld3        ;
    wire                                       i_pe_array_map_vld4        ;
    wire                                       i_pe_array_map_vld5        ;
    wire                                       i_pe_array_map_vld6        ;
    wire                                       i_pe_array_map_vld7        ;
    wire                      [15:0]           i_pe_array_map0            ;
    wire                      [15:0]           i_pe_array_map1            ;
    wire                      [15:0]           i_pe_array_map2            ;
    wire                      [15:0]           i_pe_array_map3            ;
    wire                      [15:0]           i_pe_array_map4            ;
    wire                      [15:0]           i_pe_array_map5            ;
    wire                      [15:0]           i_pe_array_map6            ;
    wire                      [15:0]           i_pe_array_map7            ;
    wire                      [15:0]           o_pe_array_result0_0       ;
    wire                      [15:0]           o_pe_array_result0_1       ;
    wire                      [15:0]           o_pe_array_result0_2       ;
    wire                      [15:0]           o_pe_array_result0_3       ;
    wire                      [15:0]           o_pe_array_result0_4       ;
    wire                      [15:0]           o_pe_array_result0_5       ;
    wire                      [15:0]           o_pe_array_result0_6       ;
    wire                      [15:0]           o_pe_array_result0_7       ;
    wire                      [15:0]           o_pe_array_result1_0       ;
    wire                      [15:0]           o_pe_array_result1_1       ;
    wire                      [15:0]           o_pe_array_result1_2       ;
    wire                      [15:0]           o_pe_array_result1_3       ;
    wire                      [15:0]           o_pe_array_result1_4       ;
    wire                      [15:0]           o_pe_array_result1_5       ;
    wire                      [15:0]           o_pe_array_result1_6       ;
    wire                      [15:0]           o_pe_array_result1_7       ;
    wire                      [15:0]           o_pe_array_result2_0       ;
    wire                      [15:0]           o_pe_array_result2_1       ;
    wire                      [15:0]           o_pe_array_result2_2       ;
    wire                      [15:0]           o_pe_array_result2_3       ;
    wire                      [15:0]           o_pe_array_result2_4       ;
    wire                      [15:0]           o_pe_array_result2_5       ;
    wire                      [15:0]           o_pe_array_result2_6       ;
    wire                      [15:0]           o_pe_array_result2_7       ;
    wire                      [15:0]           o_pe_array_result3_0       ;
    wire                      [15:0]           o_pe_array_result3_1       ;
    wire                      [15:0]           o_pe_array_result3_2       ;
    wire                      [15:0]           o_pe_array_result3_3       ;
    wire                      [15:0]           o_pe_array_result3_4       ;
    wire                      [15:0]           o_pe_array_result3_5       ;
    wire                      [15:0]           o_pe_array_result3_6       ;
    wire                      [15:0]           o_pe_array_result3_7       ;
    wire                      [15:0]           o_pe_array_result4_0       ;
    wire                      [15:0]           o_pe_array_result4_1       ;
    wire                      [15:0]           o_pe_array_result4_2       ;
    wire                      [15:0]           o_pe_array_result4_3       ;
    wire                      [15:0]           o_pe_array_result4_4       ;
    wire                      [15:0]           o_pe_array_result4_5       ;
    wire                      [15:0]           o_pe_array_result4_6       ;
    wire                      [15:0]           o_pe_array_result4_7       ;
    wire                      [15:0]           o_pe_array_result5_0       ;
    wire                      [15:0]           o_pe_array_result5_1       ;
    wire                      [15:0]           o_pe_array_result5_2       ;
    wire                      [15:0]           o_pe_array_result5_3       ;
    wire                      [15:0]           o_pe_array_result5_4       ;
    wire                      [15:0]           o_pe_array_result5_5       ;
    wire                      [15:0]           o_pe_array_result5_6       ;
    wire                      [15:0]           o_pe_array_result5_7       ;
    wire                      [15:0]           o_pe_array_result6_0       ;
    wire                      [15:0]           o_pe_array_result6_1       ;
    wire                      [15:0]           o_pe_array_result6_2       ;
    wire                      [15:0]           o_pe_array_result6_3       ;
    wire                      [15:0]           o_pe_array_result6_4       ;
    wire                      [15:0]           o_pe_array_result6_5       ;
    wire                      [15:0]           o_pe_array_result6_6       ;
    wire                      [15:0]           o_pe_array_result6_7       ;
    wire                      [15:0]           o_pe_array_result7_0       ;
    wire                      [15:0]           o_pe_array_result7_1       ;
    wire                      [15:0]           o_pe_array_result7_2       ;
    wire                      [15:0]           o_pe_array_result7_3       ;
    wire                      [15:0]           o_pe_array_result7_4       ;
    wire                      [15:0]           o_pe_array_result7_5       ;
    wire                      [15:0]           o_pe_array_result7_6       ;
    wire                      [15:0]           o_pe_array_result7_7       ;
    wire                                       i_pe_array_clear           ;
    
assign i_pe_array_clear = clear;

npu_controller npu_controller(
    .clk(clk),
    .rst_n(rst_n),
    //AXI2NPU_interface
    .wr_eop_data(wr_eop_data),
    .wr_eop_weight(wr_eop_weight),
    //pe_array
    .clear(clear),
    //pe_control
    .rd_sop_0(pe_rd_sop_0),
    .rd_sop_1(pe_rd_sop_1),
    //pe_result_cache
    .rd_eop({rd_eop_7,rd_eop_6,rd_eop_5,rd_eop_4,rd_eop_3,rd_eop_2,rd_eop_1,rd_eop_0}),
    .save_finish(save_finish),
    .save_sop(save_sop)
    );   
    
    
pe_control_data pe_control_data(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    .wr_sop                             (wr_sop_data                    ),
    .wr_eop                             (wr_eop_data                    ),
    .wr_vld                             (wr_vld_data                    ),
    .wr_data                            (wr_data_data                   ),
    .rd_sop                             (pe_rd_sop_0                    ),
    
    //pe_data
    .pe_data_0                          (i_pe_array_map0                 ),
    .pe_data_1                          (i_pe_array_map1                 ),
    .pe_data_2                          (i_pe_array_map2                 ),
    .pe_data_3                          (i_pe_array_map3                 ),
    .pe_data_4                          (i_pe_array_map4                 ),
    .pe_data_5                          (i_pe_array_map5                 ),
    .pe_data_6                          (i_pe_array_map6                 ),
    .pe_data_7                          (i_pe_array_map7                 )
);

pe_control_weight pe_control_weight(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    .wr_sop                             (wr_sop_weight                    ),
    .wr_eop                             (wr_eop_weight                    ),
    .wr_vld                             (wr_vld_weight                    ),
    .wr_data                            (wr_data_weight                   ),
    .rd_sop                             (pe_rd_sop_1                    ),
    
    //pe_data
    .pe_data_0                          (i_pe_array_weight0                 ),
    .pe_data_1                          (i_pe_array_weight1                 ),
    .pe_data_2                          (i_pe_array_weight2                 ),
    .pe_data_3                          (i_pe_array_weight3                 ),
    .pe_data_4                          (i_pe_array_weight4                 ),
    .pe_data_5                          (i_pe_array_weight5                 ),
    .pe_data_6                          (i_pe_array_weight6                 ),
    .pe_data_7                          (i_pe_array_weight7                 )
);

pe_array pe_array(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    .i_pe_array_weight0                 (i_pe_array_weight0        ),
    .i_pe_array_weight1                 (i_pe_array_weight1        ),
    .i_pe_array_weight2                 (i_pe_array_weight2        ),
    .i_pe_array_weight3                 (i_pe_array_weight3        ),
    .i_pe_array_weight4                 (i_pe_array_weight4        ),
    .i_pe_array_weight5                 (i_pe_array_weight5        ),
    .i_pe_array_weight6                 (i_pe_array_weight6        ),
    .i_pe_array_weight7                 (i_pe_array_weight7        ),
    .i_pe_array_map0                    (i_pe_array_map0           ),
    .i_pe_array_map1                    (i_pe_array_map1           ),
    .i_pe_array_map2                    (i_pe_array_map2           ),
    .i_pe_array_map3                    (i_pe_array_map3           ),
    .i_pe_array_map4                    (i_pe_array_map4           ),
    .i_pe_array_map5                    (i_pe_array_map5           ),
    .i_pe_array_map6                    (i_pe_array_map6           ),
    .i_pe_array_map7                    (i_pe_array_map7           ),
    .o_pe_array_result0_0               (o_pe_array_result0_0      ),
    .o_pe_array_result0_1               (o_pe_array_result0_1      ),
    .o_pe_array_result0_2               (o_pe_array_result0_2      ),
    .o_pe_array_result0_3               (o_pe_array_result0_3      ),
    .o_pe_array_result0_4               (o_pe_array_result0_4      ),
    .o_pe_array_result0_5               (o_pe_array_result0_5      ),
    .o_pe_array_result0_6               (o_pe_array_result0_6      ),
    .o_pe_array_result0_7               (o_pe_array_result0_7      ),
    .o_pe_array_result1_0               (o_pe_array_result1_0      ),
    .o_pe_array_result1_1               (o_pe_array_result1_1      ),
    .o_pe_array_result1_2               (o_pe_array_result1_2      ),
    .o_pe_array_result1_3               (o_pe_array_result1_3      ),
    .o_pe_array_result1_4               (o_pe_array_result1_4      ),
    .o_pe_array_result1_5               (o_pe_array_result1_5      ),
    .o_pe_array_result1_6               (o_pe_array_result1_6      ),
    .o_pe_array_result1_7               (o_pe_array_result1_7      ),
    .o_pe_array_result2_0               (o_pe_array_result2_0      ),
    .o_pe_array_result2_1               (o_pe_array_result2_1      ),
    .o_pe_array_result2_2               (o_pe_array_result2_2      ),
    .o_pe_array_result2_3               (o_pe_array_result2_3      ),
    .o_pe_array_result2_4               (o_pe_array_result2_4      ),
    .o_pe_array_result2_5               (o_pe_array_result2_5      ),
    .o_pe_array_result2_6               (o_pe_array_result2_6      ),
    .o_pe_array_result2_7               (o_pe_array_result2_7      ),
    .o_pe_array_result3_0               (o_pe_array_result3_0      ),
    .o_pe_array_result3_1               (o_pe_array_result3_1      ),
    .o_pe_array_result3_2               (o_pe_array_result3_2      ),
    .o_pe_array_result3_3               (o_pe_array_result3_3      ),
    .o_pe_array_result3_4               (o_pe_array_result3_4      ),
    .o_pe_array_result3_5               (o_pe_array_result3_5      ),
    .o_pe_array_result3_6               (o_pe_array_result3_6      ),
    .o_pe_array_result3_7               (o_pe_array_result3_7      ),
    .o_pe_array_result4_0               (o_pe_array_result4_0      ),
    .o_pe_array_result4_1               (o_pe_array_result4_1      ),
    .o_pe_array_result4_2               (o_pe_array_result4_2      ),
    .o_pe_array_result4_3               (o_pe_array_result4_3      ),
    .o_pe_array_result4_4               (o_pe_array_result4_4      ),
    .o_pe_array_result4_5               (o_pe_array_result4_5      ),
    .o_pe_array_result4_6               (o_pe_array_result4_6      ),
    .o_pe_array_result4_7               (o_pe_array_result4_7      ),
    .o_pe_array_result5_0               (o_pe_array_result5_0      ),
    .o_pe_array_result5_1               (o_pe_array_result5_1      ),
    .o_pe_array_result5_2               (o_pe_array_result5_2      ),
    .o_pe_array_result5_3               (o_pe_array_result5_3      ),
    .o_pe_array_result5_4               (o_pe_array_result5_4      ),
    .o_pe_array_result5_5               (o_pe_array_result5_5      ),
    .o_pe_array_result5_6               (o_pe_array_result5_6      ),
    .o_pe_array_result5_7               (o_pe_array_result5_7      ),
    .o_pe_array_result6_0               (o_pe_array_result6_0      ),
    .o_pe_array_result6_1               (o_pe_array_result6_1      ),
    .o_pe_array_result6_2               (o_pe_array_result6_2      ),
    .o_pe_array_result6_3               (o_pe_array_result6_3      ),
    .o_pe_array_result6_4               (o_pe_array_result6_4      ),
    .o_pe_array_result6_5               (o_pe_array_result6_5      ),
    .o_pe_array_result6_6               (o_pe_array_result6_6      ),
    .o_pe_array_result6_7               (o_pe_array_result6_7      ),
    .o_pe_array_result7_0               (o_pe_array_result7_0      ),
    .o_pe_array_result7_1               (o_pe_array_result7_1      ),
    .o_pe_array_result7_2               (o_pe_array_result7_2      ),
    .o_pe_array_result7_3               (o_pe_array_result7_3      ),
    .o_pe_array_result7_4               (o_pe_array_result7_4      ),
    .o_pe_array_result7_5               (o_pe_array_result7_5      ),
    .o_pe_array_result7_6               (o_pe_array_result7_6      ),
    .o_pe_array_result7_7               (o_pe_array_result7_7      ),
    .i_pe_array_clear                   (i_pe_array_clear          )
);

pe_result_cache pe_result_cache(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    .save_sop                           (save_sop                          ),
    .result0_0                          (o_pe_array_result0_0                 ),
    .result1_0                          (o_pe_array_result1_0                 ),
    .result2_0                          (o_pe_array_result2_0                 ),
    .result3_0                          (o_pe_array_result3_0                 ),
    .result4_0                          (o_pe_array_result4_0                 ),
    .result5_0                          (o_pe_array_result5_0                 ),
    .result6_0                          (o_pe_array_result6_0                 ),
    .result7_0                          (o_pe_array_result7_0                 ),
    .result0_1                          (o_pe_array_result0_1                 ),
    .result1_1                          (o_pe_array_result1_1                 ),
    .result2_1                          (o_pe_array_result2_1                 ),
    .result3_1                          (o_pe_array_result3_1                 ),
    .result4_1                          (o_pe_array_result4_1                 ),
    .result5_1                          (o_pe_array_result5_1                 ),
    .result6_1                          (o_pe_array_result6_1                 ),
    .result7_1                          (o_pe_array_result7_1                 ),
    .result0_2                          (o_pe_array_result0_2                 ),
    .result1_2                          (o_pe_array_result1_2                 ),
    .result2_2                          (o_pe_array_result2_2                 ),
    .result3_2                          (o_pe_array_result3_2                 ),
    .result4_2                          (o_pe_array_result4_2                 ),
    .result5_2                          (o_pe_array_result5_2                 ),
    .result6_2                          (o_pe_array_result6_2                 ),
    .result7_2                          (o_pe_array_result7_2                 ),
    .result0_3                          (o_pe_array_result0_3                 ),
    .result1_3                          (o_pe_array_result1_3                 ),
    .result2_3                          (o_pe_array_result2_3                 ),
    .result3_3                          (o_pe_array_result3_3                 ),
    .result4_3                          (o_pe_array_result4_3                 ),
    .result5_3                          (o_pe_array_result5_3                 ),
    .result6_3                          (o_pe_array_result6_3                 ),
    .result7_3                          (o_pe_array_result7_3                 ),
    .result0_4                          (o_pe_array_result0_4                 ),
    .result1_4                          (o_pe_array_result1_4                 ),
    .result2_4                          (o_pe_array_result2_4                 ),
    .result3_4                          (o_pe_array_result3_4                 ),
    .result4_4                          (o_pe_array_result4_4                 ),
    .result5_4                          (o_pe_array_result5_4                 ),
    .result6_4                          (o_pe_array_result6_4                 ),
    .result7_4                          (o_pe_array_result7_4                 ),
    .result0_5                          (o_pe_array_result0_5                 ),
    .result1_5                          (o_pe_array_result1_5                 ),
    .result2_5                          (o_pe_array_result2_5                 ),
    .result3_5                          (o_pe_array_result3_5                 ),
    .result4_5                          (o_pe_array_result4_5                 ),
    .result5_5                          (o_pe_array_result5_5                 ),
    .result6_5                          (o_pe_array_result6_5                 ),
    .result7_5                          (o_pe_array_result7_5                 ),
    .result0_6                          (o_pe_array_result0_6                 ),
    .result1_6                          (o_pe_array_result1_6                 ),
    .result2_6                          (o_pe_array_result2_6                 ),
    .result3_6                          (o_pe_array_result3_6                 ),
    .result4_6                          (o_pe_array_result4_6                 ),
    .result5_6                          (o_pe_array_result5_6                 ),
    .result6_6                          (o_pe_array_result6_6                 ),
    .result7_6                          (o_pe_array_result7_6                 ),
    .result0_7                          (o_pe_array_result0_7                 ),
    .result1_7                          (o_pe_array_result1_7                 ),
    .result2_7                          (o_pe_array_result2_7                 ),
    .result3_7                          (o_pe_array_result3_7                 ),
    .result4_7                          (o_pe_array_result4_7                 ),
    .result5_7                          (o_pe_array_result5_7                 ),
    .result6_7                          (o_pe_array_result6_7                 ),
    .result7_7                          (o_pe_array_result7_7                 ),
    .rd_sop_0                           (rd_sop_0                  ),
    .rd_sop_1                           (rd_sop_1                  ),
    .rd_sop_2                           (rd_sop_2                  ),
    .rd_sop_3                           (rd_sop_3                  ),
    .rd_sop_4                           (rd_sop_4                  ),
    .rd_sop_5                           (rd_sop_5                  ),
    .rd_sop_6                           (rd_sop_6                  ),
    .rd_sop_7                           (rd_sop_7                  ),
    .rd_eop_0                           (rd_eop_0                  ),
    .rd_eop_1                           (rd_eop_1                  ),
    .rd_eop_2                           (rd_eop_2                  ),
    .rd_eop_3                           (rd_eop_3                  ),
    .rd_eop_4                           (rd_eop_4                  ),
    .rd_eop_5                           (rd_eop_5                  ),
    .rd_eop_6                           (rd_eop_6                  ),
    .rd_eop_7                           (rd_eop_7                  ),
    .rd_vld_0                           (rd_vld_0                  ),
    .rd_vld_1                           (rd_vld_1                  ),
    .rd_vld_2                           (rd_vld_2                  ),
    .rd_vld_3                           (rd_vld_3                  ),
    .rd_vld_4                           (rd_vld_4                  ),
    .rd_vld_5                           (rd_vld_5                  ),
    .rd_vld_6                           (rd_vld_6                  ),
    .rd_vld_7                           (rd_vld_7                  ),
    .rd_data_0                          (rd_data_0                 ),
    .rd_data_1                          (rd_data_1                 ),
    .rd_data_2                          (rd_data_2                 ),
    .rd_data_3                          (rd_data_3                 ),
    .rd_data_4                          (rd_data_4                 ),
    .rd_data_5                          (rd_data_5                 ),
    .rd_data_6                          (rd_data_6                 ),
    .rd_data_7                          (rd_data_7                 )
);
endmodule
