`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 22:47:57
// Design Name: 
// Module Name: NPU_tb
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
typedef bit [15:0] uint16;
module NPU_tb();

    reg                                        clk                        ;
    reg                                        rst_n                      ;
    //NPU write port
    reg                                        wr_sop_weight              ;
    reg                                        wr_eop_weight              ;
    reg                                        wr_vld_weight              ;
    reg                       [31:0]           wr_data_weight             ;
    reg                                        wr_sop_data                ;
    reg                                        wr_eop_data                ;
    reg                                        wr_vld_data                ;
    reg                       [31:0]           wr_data_data               ;
    //NPU read port
    wire                                       save_finish                ;
    
    reg                                        rd_sop_0                   ;
    reg                                        rd_sop_1                   ;
    reg                                        rd_sop_2                   ;
    reg                                        rd_sop_3                   ;
    reg                                        rd_sop_4                   ;
    reg                                        rd_sop_5                   ;
    reg                                        rd_sop_6                   ;
    reg                                        rd_sop_7                   ;
    
    wire                                       rd_eop_0                   ;
    wire                                       rd_eop_1                   ;
    wire                                       rd_eop_2                   ;
    wire                                       rd_eop_3                   ;
    wire                                       rd_eop_4                   ;
    wire                                       rd_eop_5                   ;
    wire                                       rd_eop_6                   ;
    wire                                       rd_eop_7                   ;
    
    wire                                       rd_vld_0                   ;
    wire                                       rd_vld_1                   ;
    wire                                       rd_vld_2                   ;
    wire                                       rd_vld_3                   ;
    wire                                       rd_vld_4                   ;
    wire                                       rd_vld_5                   ;
    wire                                       rd_vld_6                   ;
    wire                                       rd_vld_7                   ;
    
    wire                      [15:0]           rd_data_0                  ;
    wire                      [15:0]           rd_data_1                  ;
    wire                      [15:0]           rd_data_2                  ;
    wire                      [15:0]           rd_data_3                  ;
    wire                      [15:0]           rd_data_4                  ;
    wire                      [15:0]           rd_data_5                  ;
    wire                      [15:0]           rd_data_6                  ;
    wire                      [15:0]           rd_data_7                  ;

always #5 clk = ~clk;

uint16 weight_arr[72];

initial begin
    foreach(weight_arr[j])
    begin
        if(j % 9 == 0)
            weight_arr[j] = 256 * (j / 9);
        else
            weight_arr[j] = 0;
    end
    init;
    driver_weight(weight_arr);
    driver_data({0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17});
    #50
    driver_data({0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0});
    #50
    driver_data({0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0});
    wait(save_finish)
    driver_read;
    #5000
    $finish;
end

task init;
begin
    clk = 1'b0;
    rst_n = 1'b0;
    wr_sop_weight = 1'b0;
    wr_eop_weight = 1'b0;
    wr_vld_weight = 1'b0;
    wr_data_weight = 32'd0;
    wr_sop_data = 1'b0;
    wr_eop_data = 1'b0;
    wr_vld_data = 1'b0;
    wr_data_data = 32'd0;
    rd_sop_0 = 1'b0;
    rd_sop_1 = 1'b0;
    rd_sop_2 = 1'b0;
    rd_sop_3 = 1'b0;
    rd_sop_4 = 1'b0;
    rd_sop_5 = 1'b0;
    rd_sop_6 = 1'b0;
    rd_sop_7 = 1'b0;
    repeat(10)begin
        @(posedge clk);
    end
    rst_n <= 1'b1;
end
endtask

task driver_weight(input uint16 arr[72]);
begin
    int i;
    @(posedge clk)
    wr_sop_weight <= 1'b1;
    @(posedge clk)
    wr_sop_weight <= 1'b0;
    for(i=0;i<36;i++)begin
    wr_vld_weight <= 1'b1;
    wr_data_weight <= {arr[i*2+1], arr[i*2]};
    @(posedge clk);
    end
    wr_eop_weight <= 1'b1;
    wr_vld_weight <= 1'b0;
    wr_data_weight <= 32'd0;
    @(posedge clk);
    wr_eop_weight <= 1'b0;
end
endtask

task driver_data(input uint16 arr[20]);
begin
    int i;
    @(posedge clk)
    wr_sop_data <= 1'b1;
    @(posedge clk)
    wr_sop_data <= 1'b0;
    for(i=0;i<10;i++)begin
    wr_vld_data <= 1'b1;
    wr_data_data <= {arr[i*2+1], arr[i*2]};
    @(posedge clk);
    end
    wr_eop_data <= 1'b1;
    wr_vld_data <= 1'b0;
    wr_data_data <= 32'd0;
    @(posedge clk);
    wr_eop_data <= 1'b0;
end
endtask

task driver_read;
begin
    @(posedge clk)
    rd_sop_0 <= 1'b1;
    rd_sop_1 <= 1'b1;
    rd_sop_2 <= 1'b1;
    rd_sop_3 <= 1'b1;
    rd_sop_4 <= 1'b1;
    rd_sop_5 <= 1'b1;
    rd_sop_6 <= 1'b1;
    rd_sop_7 <= 1'b1;
    @(posedge clk)
    rd_sop_0 <= 1'b0;
    rd_sop_1 <= 1'b0;
    rd_sop_2 <= 1'b0;
    rd_sop_3 <= 1'b0;
    rd_sop_4 <= 1'b0;
    rd_sop_5 <= 1'b0;
    rd_sop_6 <= 1'b0;
    rd_sop_7 <= 1'b0;
end
endtask
NPU u_NPU(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    //NPU write port
    .wr_sop_weight                      (wr_sop_weight             ),
    .wr_eop_weight                      (wr_eop_weight             ),
    .wr_vld_weight                      (wr_vld_weight             ),
    .wr_data_weight                     (wr_data_weight            ),
    .wr_sop_data                        (wr_sop_data               ),
    .wr_eop_data                        (wr_eop_data               ),
    .wr_vld_data                        (wr_vld_data               ),
    .wr_data_data                       (wr_data_data              ),
    //NPU read port
    .save_finish                        (save_finish               ),
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
