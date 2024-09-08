module pe_array(
input wire clk,
input wire rst_n,
input wire [15:0] i_pe_array_weight0,
input wire [15:0] i_pe_array_weight1,
input wire [15:0] i_pe_array_weight2,
input wire [15:0] i_pe_array_weight3,
input wire [15:0] i_pe_array_weight4,
input wire [15:0] i_pe_array_weight5,
input wire [15:0] i_pe_array_weight6,
input wire [15:0] i_pe_array_weight7,
input wire [15:0] i_pe_array_map0,
input wire [15:0] i_pe_array_map1,
input wire [15:0] i_pe_array_map2,
input wire [15:0] i_pe_array_map3,
input wire [15:0] i_pe_array_map4,
input wire [15:0] i_pe_array_map5,
input wire [15:0] i_pe_array_map6,
input wire [15:0] i_pe_array_map7,
output wire [15:0] o_pe_array_result0_0,
output wire [15:0] o_pe_array_result0_1,
output wire [15:0] o_pe_array_result0_2,
output wire [15:0] o_pe_array_result0_3,
output wire [15:0] o_pe_array_result0_4,
output wire [15:0] o_pe_array_result0_5,
output wire [15:0] o_pe_array_result0_6,
output wire [15:0] o_pe_array_result0_7,
output wire [15:0] o_pe_array_result1_0,
output wire [15:0] o_pe_array_result1_1,
output wire [15:0] o_pe_array_result1_2,
output wire [15:0] o_pe_array_result1_3,
output wire [15:0] o_pe_array_result1_4,
output wire [15:0] o_pe_array_result1_5,
output wire [15:0] o_pe_array_result1_6,
output wire [15:0] o_pe_array_result1_7,
output wire [15:0] o_pe_array_result2_0,
output wire [15:0] o_pe_array_result2_1,
output wire [15:0] o_pe_array_result2_2,
output wire [15:0] o_pe_array_result2_3,
output wire [15:0] o_pe_array_result2_4,
output wire [15:0] o_pe_array_result2_5,
output wire [15:0] o_pe_array_result2_6,
output wire [15:0] o_pe_array_result2_7,
output wire [15:0] o_pe_array_result3_0,
output wire [15:0] o_pe_array_result3_1,
output wire [15:0] o_pe_array_result3_2,
output wire [15:0] o_pe_array_result3_3,
output wire [15:0] o_pe_array_result3_4,
output wire [15:0] o_pe_array_result3_5,
output wire [15:0] o_pe_array_result3_6,
output wire [15:0] o_pe_array_result3_7,
output wire [15:0] o_pe_array_result4_0,
output wire [15:0] o_pe_array_result4_1,
output wire [15:0] o_pe_array_result4_2,
output wire [15:0] o_pe_array_result4_3,
output wire [15:0] o_pe_array_result4_4,
output wire [15:0] o_pe_array_result4_5,
output wire [15:0] o_pe_array_result4_6,
output wire [15:0] o_pe_array_result4_7,
output wire [15:0] o_pe_array_result5_0,
output wire [15:0] o_pe_array_result5_1,
output wire [15:0] o_pe_array_result5_2,
output wire [15:0] o_pe_array_result5_3,
output wire [15:0] o_pe_array_result5_4,
output wire [15:0] o_pe_array_result5_5,
output wire [15:0] o_pe_array_result5_6,
output wire [15:0] o_pe_array_result5_7,
output wire [15:0] o_pe_array_result6_0,
output wire [15:0] o_pe_array_result6_1,
output wire [15:0] o_pe_array_result6_2,
output wire [15:0] o_pe_array_result6_3,
output wire [15:0] o_pe_array_result6_4,
output wire [15:0] o_pe_array_result6_5,
output wire [15:0] o_pe_array_result6_6,
output wire [15:0] o_pe_array_result6_7,
output wire [15:0] o_pe_array_result7_0,
output wire [15:0] o_pe_array_result7_1,
output wire [15:0] o_pe_array_result7_2,
output wire [15:0] o_pe_array_result7_3,
output wire [15:0] o_pe_array_result7_4,
output wire [15:0] o_pe_array_result7_5,
output wire [15:0] o_pe_array_result7_6,
output wire [15:0] o_pe_array_result7_7,
input wire i_pe_array_clear
);

reg i_clear_0;
reg i_clear_1;
reg i_clear_2;
reg i_clear_3;
reg i_clear_4;
reg i_clear_5;
reg i_clear_6;
reg i_clear_7;

wire i_clear_0_0;
wire [15:0] i_weight_0_0;
wire [15:0] i_map_0_0;
wire [15:0] o_weight_0_0;
wire [15:0] o_map_0_0;
wire [15:0] o_result_0_0;

wire i_clear_0_1;
wire [15:0] i_weight_0_1;
wire [15:0] i_map_0_1;
wire [15:0] o_weight_0_1;
wire [15:0] o_map_0_1;
wire [15:0] o_result_0_1;

wire i_clear_0_2;
wire [15:0] i_weight_0_2;
wire [15:0] i_map_0_2;
wire [15:0] o_weight_0_2;
wire [15:0] o_map_0_2;
wire [15:0] o_result_0_2;

wire i_clear_0_3;
wire [15:0] i_weight_0_3;
wire [15:0] i_map_0_3;
wire [15:0] o_weight_0_3;
wire [15:0] o_map_0_3;
wire [15:0] o_result_0_3;

wire i_clear_0_4;
wire [15:0] i_weight_0_4;
wire [15:0] i_map_0_4;
wire [15:0] o_weight_0_4;
wire [15:0] o_map_0_4;
wire [15:0] o_result_0_4;

wire i_clear_0_5;
wire [15:0] i_weight_0_5;
wire [15:0] i_map_0_5;
wire [15:0] o_weight_0_5;
wire [15:0] o_map_0_5;
wire [15:0] o_result_0_5;

wire i_clear_0_6;
wire [15:0] i_weight_0_6;
wire [15:0] i_map_0_6;
wire [15:0] o_weight_0_6;
wire [15:0] o_map_0_6;
wire [15:0] o_result_0_6;

wire i_clear_0_7;
wire [15:0] i_weight_0_7;
wire [15:0] i_map_0_7;
wire [15:0] o_weight_0_7;
wire [15:0] o_map_0_7;
wire [15:0] o_result_0_7;

wire i_clear_1_0;
wire [15:0] i_weight_1_0;
wire [15:0] i_map_1_0;
wire [15:0] o_weight_1_0;
wire [15:0] o_map_1_0;
wire [15:0] o_result_1_0;

wire i_clear_1_1;
wire [15:0] i_weight_1_1;
wire [15:0] i_map_1_1;
wire [15:0] o_weight_1_1;
wire [15:0] o_map_1_1;
wire [15:0] o_result_1_1;

wire i_clear_1_2;
wire [15:0] i_weight_1_2;
wire [15:0] i_map_1_2;
wire [15:0] o_weight_1_2;
wire [15:0] o_map_1_2;
wire [15:0] o_result_1_2;

wire i_clear_1_3;
wire [15:0] i_weight_1_3;
wire [15:0] i_map_1_3;
wire [15:0] o_weight_1_3;
wire [15:0] o_map_1_3;
wire [15:0] o_result_1_3;

wire i_clear_1_4;
wire [15:0] i_weight_1_4;
wire [15:0] i_map_1_4;
wire [15:0] o_weight_1_4;
wire [15:0] o_map_1_4;
wire [15:0] o_result_1_4;

wire i_clear_1_5;
wire [15:0] i_weight_1_5;
wire [15:0] i_map_1_5;
wire [15:0] o_weight_1_5;
wire [15:0] o_map_1_5;
wire [15:0] o_result_1_5;

wire i_clear_1_6;
wire [15:0] i_weight_1_6;
wire [15:0] i_map_1_6;
wire [15:0] o_weight_1_6;
wire [15:0] o_map_1_6;
wire [15:0] o_result_1_6;

wire i_clear_1_7;
wire [15:0] i_weight_1_7;
wire [15:0] i_map_1_7;
wire [15:0] o_weight_1_7;
wire [15:0] o_map_1_7;
wire [15:0] o_result_1_7;

wire i_clear_2_0;
wire [15:0] i_weight_2_0;
wire [15:0] i_map_2_0;
wire [15:0] o_weight_2_0;
wire [15:0] o_map_2_0;
wire [15:0] o_result_2_0;

wire i_clear_2_1;
wire [15:0] i_weight_2_1;
wire [15:0] i_map_2_1;
wire [15:0] o_weight_2_1;
wire [15:0] o_map_2_1;
wire [15:0] o_result_2_1;

wire i_clear_2_2;
wire [15:0] i_weight_2_2;
wire [15:0] i_map_2_2;
wire [15:0] o_weight_2_2;
wire [15:0] o_map_2_2;
wire [15:0] o_result_2_2;

wire i_clear_2_3;
wire [15:0] i_weight_2_3;
wire [15:0] i_map_2_3;
wire [15:0] o_weight_2_3;
wire [15:0] o_map_2_3;
wire [15:0] o_result_2_3;

wire i_clear_2_4;
wire [15:0] i_weight_2_4;
wire [15:0] i_map_2_4;
wire [15:0] o_weight_2_4;
wire [15:0] o_map_2_4;
wire [15:0] o_result_2_4;

wire i_clear_2_5;
wire [15:0] i_weight_2_5;
wire [15:0] i_map_2_5;
wire [15:0] o_weight_2_5;
wire [15:0] o_map_2_5;
wire [15:0] o_result_2_5;

wire i_clear_2_6;
wire [15:0] i_weight_2_6;
wire [15:0] i_map_2_6;
wire [15:0] o_weight_2_6;
wire [15:0] o_map_2_6;
wire [15:0] o_result_2_6;

wire i_clear_2_7;
wire [15:0] i_weight_2_7;
wire [15:0] i_map_2_7;
wire [15:0] o_weight_2_7;
wire [15:0] o_map_2_7;
wire [15:0] o_result_2_7;

wire i_clear_3_0;
wire [15:0] i_weight_3_0;
wire [15:0] i_map_3_0;
wire [15:0] o_weight_3_0;
wire [15:0] o_map_3_0;
wire [15:0] o_result_3_0;

wire i_clear_3_1;
wire [15:0] i_weight_3_1;
wire [15:0] i_map_3_1;
wire [15:0] o_weight_3_1;
wire [15:0] o_map_3_1;
wire [15:0] o_result_3_1;

wire i_clear_3_2;
wire [15:0] i_weight_3_2;
wire [15:0] i_map_3_2;
wire [15:0] o_weight_3_2;
wire [15:0] o_map_3_2;
wire [15:0] o_result_3_2;

wire i_clear_3_3;
wire [15:0] i_weight_3_3;
wire [15:0] i_map_3_3;
wire [15:0] o_weight_3_3;
wire [15:0] o_map_3_3;
wire [15:0] o_result_3_3;

wire i_clear_3_4;
wire [15:0] i_weight_3_4;
wire [15:0] i_map_3_4;
wire [15:0] o_weight_3_4;
wire [15:0] o_map_3_4;
wire [15:0] o_result_3_4;

wire i_clear_3_5;
wire [15:0] i_weight_3_5;
wire [15:0] i_map_3_5;
wire [15:0] o_weight_3_5;
wire [15:0] o_map_3_5;
wire [15:0] o_result_3_5;

wire i_clear_3_6;
wire [15:0] i_weight_3_6;
wire [15:0] i_map_3_6;
wire [15:0] o_weight_3_6;
wire [15:0] o_map_3_6;
wire [15:0] o_result_3_6;

wire i_clear_3_7;
wire [15:0] i_weight_3_7;
wire [15:0] i_map_3_7;
wire [15:0] o_weight_3_7;
wire [15:0] o_map_3_7;
wire [15:0] o_result_3_7;

wire i_clear_4_0;
wire [15:0] i_weight_4_0;
wire [15:0] i_map_4_0;
wire [15:0] o_weight_4_0;
wire [15:0] o_map_4_0;
wire [15:0] o_result_4_0;

wire i_clear_4_1;
wire [15:0] i_weight_4_1;
wire [15:0] i_map_4_1;
wire [15:0] o_weight_4_1;
wire [15:0] o_map_4_1;
wire [15:0] o_result_4_1;

wire i_clear_4_2;
wire [15:0] i_weight_4_2;
wire [15:0] i_map_4_2;
wire [15:0] o_weight_4_2;
wire [15:0] o_map_4_2;
wire [15:0] o_result_4_2;

wire i_clear_4_3;
wire [15:0] i_weight_4_3;
wire [15:0] i_map_4_3;
wire [15:0] o_weight_4_3;
wire [15:0] o_map_4_3;
wire [15:0] o_result_4_3;

wire i_clear_4_4;
wire [15:0] i_weight_4_4;
wire [15:0] i_map_4_4;
wire [15:0] o_weight_4_4;
wire [15:0] o_map_4_4;
wire [15:0] o_result_4_4;

wire i_clear_4_5;
wire [15:0] i_weight_4_5;
wire [15:0] i_map_4_5;
wire [15:0] o_weight_4_5;
wire [15:0] o_map_4_5;
wire [15:0] o_result_4_5;

wire i_clear_4_6;
wire [15:0] i_weight_4_6;
wire [15:0] i_map_4_6;
wire [15:0] o_weight_4_6;
wire [15:0] o_map_4_6;
wire [15:0] o_result_4_6;

wire i_clear_4_7;
wire [15:0] i_weight_4_7;
wire [15:0] i_map_4_7;
wire [15:0] o_weight_4_7;
wire [15:0] o_map_4_7;
wire [15:0] o_result_4_7;

wire i_clear_5_0;
wire [15:0] i_weight_5_0;
wire [15:0] i_map_5_0;
wire [15:0] o_weight_5_0;
wire [15:0] o_map_5_0;
wire [15:0] o_result_5_0;

wire i_clear_5_1;
wire [15:0] i_weight_5_1;
wire [15:0] i_map_5_1;
wire [15:0] o_weight_5_1;
wire [15:0] o_map_5_1;
wire [15:0] o_result_5_1;

wire i_clear_5_2;
wire [15:0] i_weight_5_2;
wire [15:0] i_map_5_2;
wire [15:0] o_weight_5_2;
wire [15:0] o_map_5_2;
wire [15:0] o_result_5_2;

wire i_clear_5_3;
wire [15:0] i_weight_5_3;
wire [15:0] i_map_5_3;
wire [15:0] o_weight_5_3;
wire [15:0] o_map_5_3;
wire [15:0] o_result_5_3;

wire i_clear_5_4;
wire [15:0] i_weight_5_4;
wire [15:0] i_map_5_4;
wire [15:0] o_weight_5_4;
wire [15:0] o_map_5_4;
wire [15:0] o_result_5_4;

wire i_clear_5_5;
wire [15:0] i_weight_5_5;
wire [15:0] i_map_5_5;
wire [15:0] o_weight_5_5;
wire [15:0] o_map_5_5;
wire [15:0] o_result_5_5;

wire i_clear_5_6;
wire [15:0] i_weight_5_6;
wire [15:0] i_map_5_6;
wire [15:0] o_weight_5_6;
wire [15:0] o_map_5_6;
wire [15:0] o_result_5_6;

wire i_clear_5_7;
wire [15:0] i_weight_5_7;
wire [15:0] i_map_5_7;
wire [15:0] o_weight_5_7;
wire [15:0] o_map_5_7;
wire [15:0] o_result_5_7;

wire i_clear_6_0;
wire [15:0] i_weight_6_0;
wire [15:0] i_map_6_0;
wire [15:0] o_weight_6_0;
wire [15:0] o_map_6_0;
wire [15:0] o_result_6_0;

wire i_clear_6_1;
wire [15:0] i_weight_6_1;
wire [15:0] i_map_6_1;
wire [15:0] o_weight_6_1;
wire [15:0] o_map_6_1;
wire [15:0] o_result_6_1;

wire i_clear_6_2;
wire [15:0] i_weight_6_2;
wire [15:0] i_map_6_2;
wire [15:0] o_weight_6_2;
wire [15:0] o_map_6_2;
wire [15:0] o_result_6_2;

wire i_clear_6_3;
wire [15:0] i_weight_6_3;
wire [15:0] i_map_6_3;
wire [15:0] o_weight_6_3;
wire [15:0] o_map_6_3;
wire [15:0] o_result_6_3;

wire i_clear_6_4;
wire [15:0] i_weight_6_4;
wire [15:0] i_map_6_4;
wire [15:0] o_weight_6_4;
wire [15:0] o_map_6_4;
wire [15:0] o_result_6_4;

wire i_clear_6_5;
wire [15:0] i_weight_6_5;
wire [15:0] i_map_6_5;
wire [15:0] o_weight_6_5;
wire [15:0] o_map_6_5;
wire [15:0] o_result_6_5;

wire i_clear_6_6;
wire [15:0] i_weight_6_6;
wire [15:0] i_map_6_6;
wire [15:0] o_weight_6_6;
wire [15:0] o_map_6_6;
wire [15:0] o_result_6_6;

wire i_clear_6_7;
wire [15:0] i_weight_6_7;
wire [15:0] i_map_6_7;
wire [15:0] o_weight_6_7;
wire [15:0] o_map_6_7;
wire [15:0] o_result_6_7;

wire i_clear_7_0;
wire [15:0] i_weight_7_0;
wire [15:0] i_map_7_0;
wire [15:0] o_weight_7_0;
wire [15:0] o_map_7_0;
wire [15:0] o_result_7_0;

wire i_clear_7_1;
wire [15:0] i_weight_7_1;
wire [15:0] i_map_7_1;
wire [15:0] o_weight_7_1;
wire [15:0] o_map_7_1;
wire [15:0] o_result_7_1;

wire i_clear_7_2;
wire [15:0] i_weight_7_2;
wire [15:0] i_map_7_2;
wire [15:0] o_weight_7_2;
wire [15:0] o_map_7_2;
wire [15:0] o_result_7_2;

wire i_clear_7_3;
wire [15:0] i_weight_7_3;
wire [15:0] i_map_7_3;
wire [15:0] o_weight_7_3;
wire [15:0] o_map_7_3;
wire [15:0] o_result_7_3;

wire i_clear_7_4;
wire [15:0] i_weight_7_4;
wire [15:0] i_map_7_4;
wire [15:0] o_weight_7_4;
wire [15:0] o_map_7_4;
wire [15:0] o_result_7_4;

wire i_clear_7_5;
wire [15:0] i_weight_7_5;
wire [15:0] i_map_7_5;
wire [15:0] o_weight_7_5;
wire [15:0] o_map_7_5;
wire [15:0] o_result_7_5;

wire i_clear_7_6;
wire [15:0] i_weight_7_6;
wire [15:0] i_map_7_6;
wire [15:0] o_weight_7_6;
wire [15:0] o_map_7_6;
wire [15:0] o_result_7_6;

wire i_clear_7_7;
wire [15:0] i_weight_7_7;
wire [15:0] i_map_7_7;
wire [15:0] o_weight_7_7;
wire [15:0] o_map_7_7;
wire [15:0] o_result_7_7;

always@(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        i_clear_0 <= 1'b0;
        i_clear_1 <= 1'b0;
        i_clear_2 <= 1'b0;
        i_clear_3 <= 1'b0;
        i_clear_4 <= 1'b0;
        i_clear_5 <= 1'b0;
        i_clear_6 <= 1'b0;
        i_clear_7 <= 1'b0;
    end
    else
    begin
        i_clear_0 <= i_pe_array_clear;
        i_clear_1 <= i_clear_0;
        i_clear_2 <= i_clear_1;
        i_clear_3 <= i_clear_2;
        i_clear_4 <= i_clear_3;
        i_clear_5 <= i_clear_4;
        i_clear_6 <= i_clear_5;
        i_clear_7 <= i_clear_6;
    end
end

assign i_weight_0_0 = i_pe_array_weight0;
assign i_map_0_0 = i_pe_array_map0;
assign i_weight_0_1 = i_pe_array_weight1;
assign i_map_0_1 = o_map_0_0;
assign i_weight_0_2 = i_pe_array_weight2;
assign i_map_0_2 = o_map_0_1;
assign i_weight_0_3 = i_pe_array_weight3;
assign i_map_0_3 = o_map_0_2;
assign i_weight_0_4 = i_pe_array_weight4;
assign i_map_0_4 = o_map_0_3;
assign i_weight_0_5 = i_pe_array_weight5;
assign i_map_0_5 = o_map_0_4;
assign i_weight_0_6 = i_pe_array_weight6;
assign i_map_0_6 = o_map_0_5;
assign i_weight_0_7 = i_pe_array_weight7;
assign i_map_0_7 = o_map_0_6;
assign i_map_1_0 = i_pe_array_map1;
assign i_weight_1_0 = o_weight_0_0;
assign i_map_1_1 = o_map_1_0;
assign i_weight_1_1 = o_weight_0_1;
assign i_map_1_2 = o_map_1_1;
assign i_weight_1_2 = o_weight_0_2;
assign i_map_1_3 = o_map_1_2;
assign i_weight_1_3 = o_weight_0_3;
assign i_map_1_4 = o_map_1_3;
assign i_weight_1_4 = o_weight_0_4;
assign i_map_1_5 = o_map_1_4;
assign i_weight_1_5 = o_weight_0_5;
assign i_map_1_6 = o_map_1_5;
assign i_weight_1_6 = o_weight_0_6;
assign i_map_1_7 = o_map_1_6;
assign i_weight_1_7 = o_weight_0_7;
assign i_map_2_0 = i_pe_array_map2;
assign i_weight_2_0 = o_weight_1_0;
assign i_map_2_1 = o_map_2_0;
assign i_weight_2_1 = o_weight_1_1;
assign i_map_2_2 = o_map_2_1;
assign i_weight_2_2 = o_weight_1_2;
assign i_map_2_3 = o_map_2_2;
assign i_weight_2_3 = o_weight_1_3;
assign i_map_2_4 = o_map_2_3;
assign i_weight_2_4 = o_weight_1_4;
assign i_map_2_5 = o_map_2_4;
assign i_weight_2_5 = o_weight_1_5;
assign i_map_2_6 = o_map_2_5;
assign i_weight_2_6 = o_weight_1_6;
assign i_map_2_7 = o_map_2_6;
assign i_weight_2_7 = o_weight_1_7;
assign i_map_3_0 = i_pe_array_map3;
assign i_weight_3_0 = o_weight_2_0;
assign i_map_3_1 = o_map_3_0;
assign i_weight_3_1 = o_weight_2_1;
assign i_map_3_2 = o_map_3_1;
assign i_weight_3_2 = o_weight_2_2;
assign i_map_3_3 = o_map_3_2;
assign i_weight_3_3 = o_weight_2_3;
assign i_map_3_4 = o_map_3_3;
assign i_weight_3_4 = o_weight_2_4;
assign i_map_3_5 = o_map_3_4;
assign i_weight_3_5 = o_weight_2_5;
assign i_map_3_6 = o_map_3_5;
assign i_weight_3_6 = o_weight_2_6;
assign i_map_3_7 = o_map_3_6;
assign i_weight_3_7 = o_weight_2_7;
assign i_map_4_0 = i_pe_array_map4;
assign i_weight_4_0 = o_weight_3_0;
assign i_map_4_1 = o_map_4_0;
assign i_weight_4_1 = o_weight_3_1;
assign i_map_4_2 = o_map_4_1;
assign i_weight_4_2 = o_weight_3_2;
assign i_map_4_3 = o_map_4_2;
assign i_weight_4_3 = o_weight_3_3;
assign i_map_4_4 = o_map_4_3;
assign i_weight_4_4 = o_weight_3_4;
assign i_map_4_5 = o_map_4_4;
assign i_weight_4_5 = o_weight_3_5;
assign i_map_4_6 = o_map_4_5;
assign i_weight_4_6 = o_weight_3_6;
assign i_map_4_7 = o_map_4_6;
assign i_weight_4_7 = o_weight_3_7;
assign i_map_5_0 = i_pe_array_map5;
assign i_weight_5_0 = o_weight_4_0;
assign i_map_5_1 = o_map_5_0;
assign i_weight_5_1 = o_weight_4_1;
assign i_map_5_2 = o_map_5_1;
assign i_weight_5_2 = o_weight_4_2;
assign i_map_5_3 = o_map_5_2;
assign i_weight_5_3 = o_weight_4_3;
assign i_map_5_4 = o_map_5_3;
assign i_weight_5_4 = o_weight_4_4;
assign i_map_5_5 = o_map_5_4;
assign i_weight_5_5 = o_weight_4_5;
assign i_map_5_6 = o_map_5_5;
assign i_weight_5_6 = o_weight_4_6;
assign i_map_5_7 = o_map_5_6;
assign i_weight_5_7 = o_weight_4_7;
assign i_map_6_0 = i_pe_array_map6;
assign i_weight_6_0 = o_weight_5_0;
assign i_map_6_1 = o_map_6_0;
assign i_weight_6_1 = o_weight_5_1;
assign i_map_6_2 = o_map_6_1;
assign i_weight_6_2 = o_weight_5_2;
assign i_map_6_3 = o_map_6_2;
assign i_weight_6_3 = o_weight_5_3;
assign i_map_6_4 = o_map_6_3;
assign i_weight_6_4 = o_weight_5_4;
assign i_map_6_5 = o_map_6_4;
assign i_weight_6_5 = o_weight_5_5;
assign i_map_6_6 = o_map_6_5;
assign i_weight_6_6 = o_weight_5_6;
assign i_map_6_7 = o_map_6_6;
assign i_weight_6_7 = o_weight_5_7;
assign i_map_7_0 = i_pe_array_map7;
assign i_weight_7_0 = o_weight_6_0;
assign i_map_7_1 = o_map_7_0;
assign i_weight_7_1 = o_weight_6_1;
assign i_map_7_2 = o_map_7_1;
assign i_weight_7_2 = o_weight_6_2;
assign i_map_7_3 = o_map_7_2;
assign i_weight_7_3 = o_weight_6_3;
assign i_map_7_4 = o_map_7_3;
assign i_weight_7_4 = o_weight_6_4;
assign i_map_7_5 = o_map_7_4;
assign i_weight_7_5 = o_weight_6_5;
assign i_map_7_6 = o_map_7_5;
assign i_weight_7_6 = o_weight_6_6;
assign i_map_7_7 = o_map_7_6;
assign i_weight_7_7 = o_weight_6_7;
assign o_pe_array_result0_0 = o_result_0_0;
assign o_pe_array_result0_1 = o_result_0_1;
assign o_pe_array_result0_2 = o_result_0_2;
assign o_pe_array_result0_3 = o_result_0_3;
assign o_pe_array_result0_4 = o_result_0_4;
assign o_pe_array_result0_5 = o_result_0_5;
assign o_pe_array_result0_6 = o_result_0_6;
assign o_pe_array_result0_7 = o_result_0_7;
assign o_pe_array_result1_0 = o_result_1_0;
assign o_pe_array_result1_1 = o_result_1_1;
assign o_pe_array_result1_2 = o_result_1_2;
assign o_pe_array_result1_3 = o_result_1_3;
assign o_pe_array_result1_4 = o_result_1_4;
assign o_pe_array_result1_5 = o_result_1_5;
assign o_pe_array_result1_6 = o_result_1_6;
assign o_pe_array_result1_7 = o_result_1_7;
assign o_pe_array_result2_0 = o_result_2_0;
assign o_pe_array_result2_1 = o_result_2_1;
assign o_pe_array_result2_2 = o_result_2_2;
assign o_pe_array_result2_3 = o_result_2_3;
assign o_pe_array_result2_4 = o_result_2_4;
assign o_pe_array_result2_5 = o_result_2_5;
assign o_pe_array_result2_6 = o_result_2_6;
assign o_pe_array_result2_7 = o_result_2_7;
assign o_pe_array_result3_0 = o_result_3_0;
assign o_pe_array_result3_1 = o_result_3_1;
assign o_pe_array_result3_2 = o_result_3_2;
assign o_pe_array_result3_3 = o_result_3_3;
assign o_pe_array_result3_4 = o_result_3_4;
assign o_pe_array_result3_5 = o_result_3_5;
assign o_pe_array_result3_6 = o_result_3_6;
assign o_pe_array_result3_7 = o_result_3_7;
assign o_pe_array_result4_0 = o_result_4_0;
assign o_pe_array_result4_1 = o_result_4_1;
assign o_pe_array_result4_2 = o_result_4_2;
assign o_pe_array_result4_3 = o_result_4_3;
assign o_pe_array_result4_4 = o_result_4_4;
assign o_pe_array_result4_5 = o_result_4_5;
assign o_pe_array_result4_6 = o_result_4_6;
assign o_pe_array_result4_7 = o_result_4_7;
assign o_pe_array_result5_0 = o_result_5_0;
assign o_pe_array_result5_1 = o_result_5_1;
assign o_pe_array_result5_2 = o_result_5_2;
assign o_pe_array_result5_3 = o_result_5_3;
assign o_pe_array_result5_4 = o_result_5_4;
assign o_pe_array_result5_5 = o_result_5_5;
assign o_pe_array_result5_6 = o_result_5_6;
assign o_pe_array_result5_7 = o_result_5_7;
assign o_pe_array_result6_0 = o_result_6_0;
assign o_pe_array_result6_1 = o_result_6_1;
assign o_pe_array_result6_2 = o_result_6_2;
assign o_pe_array_result6_3 = o_result_6_3;
assign o_pe_array_result6_4 = o_result_6_4;
assign o_pe_array_result6_5 = o_result_6_5;
assign o_pe_array_result6_6 = o_result_6_6;
assign o_pe_array_result6_7 = o_result_6_7;
assign o_pe_array_result7_0 = o_result_7_0;
assign o_pe_array_result7_1 = o_result_7_1;
assign o_pe_array_result7_2 = o_result_7_2;
assign o_pe_array_result7_3 = o_result_7_3;
assign o_pe_array_result7_4 = o_result_7_4;
assign o_pe_array_result7_5 = o_result_7_5;
assign o_pe_array_result7_6 = o_result_7_6;
assign o_pe_array_result7_7 = o_result_7_7;
assign i_clear_0_0 = i_clear_0;
assign i_clear_0_1 = i_clear_0;
assign i_clear_0_2 = i_clear_0;
assign i_clear_0_3 = i_clear_0;
assign i_clear_0_4 = i_clear_0;
assign i_clear_0_5 = i_clear_0;
assign i_clear_0_6 = i_clear_0;
assign i_clear_0_7 = i_clear_0;
assign i_clear_1_0 = i_clear_0;
assign i_clear_1_1 = i_clear_1;
assign i_clear_1_2 = i_clear_1;
assign i_clear_1_3 = i_clear_1;
assign i_clear_1_4 = i_clear_1;
assign i_clear_1_5 = i_clear_1;
assign i_clear_1_6 = i_clear_1;
assign i_clear_1_7 = i_clear_1;
assign i_clear_2_0 = i_clear_0;
assign i_clear_2_1 = i_clear_1;
assign i_clear_2_2 = i_clear_2;
assign i_clear_2_3 = i_clear_2;
assign i_clear_2_4 = i_clear_2;
assign i_clear_2_5 = i_clear_2;
assign i_clear_2_6 = i_clear_2;
assign i_clear_2_7 = i_clear_2;
assign i_clear_3_0 = i_clear_0;
assign i_clear_3_1 = i_clear_1;
assign i_clear_3_2 = i_clear_2;
assign i_clear_3_3 = i_clear_3;
assign i_clear_3_4 = i_clear_3;
assign i_clear_3_5 = i_clear_3;
assign i_clear_3_6 = i_clear_3;
assign i_clear_3_7 = i_clear_3;
assign i_clear_4_0 = i_clear_0;
assign i_clear_4_1 = i_clear_1;
assign i_clear_4_2 = i_clear_2;
assign i_clear_4_3 = i_clear_3;
assign i_clear_4_4 = i_clear_4;
assign i_clear_4_5 = i_clear_4;
assign i_clear_4_6 = i_clear_4;
assign i_clear_4_7 = i_clear_4;
assign i_clear_5_0 = i_clear_0;
assign i_clear_5_1 = i_clear_1;
assign i_clear_5_2 = i_clear_2;
assign i_clear_5_3 = i_clear_3;
assign i_clear_5_4 = i_clear_4;
assign i_clear_5_5 = i_clear_5;
assign i_clear_5_6 = i_clear_5;
assign i_clear_5_7 = i_clear_5;
assign i_clear_6_0 = i_clear_0;
assign i_clear_6_1 = i_clear_1;
assign i_clear_6_2 = i_clear_2;
assign i_clear_6_3 = i_clear_3;
assign i_clear_6_4 = i_clear_4;
assign i_clear_6_5 = i_clear_5;
assign i_clear_6_6 = i_clear_6;
assign i_clear_6_7 = i_clear_6;
assign i_clear_7_0 = i_clear_0;
assign i_clear_7_1 = i_clear_1;
assign i_clear_7_2 = i_clear_2;
assign i_clear_7_3 = i_clear_3;
assign i_clear_7_4 = i_clear_4;
assign i_clear_7_5 = i_clear_5;
assign i_clear_7_6 = i_clear_6;
assign i_clear_7_7 = i_clear_7;

pe pe0_0
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_0_0),
.i_weight(i_weight_0_0),
.i_map(i_map_0_0),
.o_weight(o_weight_0_0),
.o_map(o_map_0_0),
.o_result(o_result_0_0)
);

pe pe0_1
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_0_1),
.i_weight(i_weight_0_1),
.i_map(i_map_0_1),
.o_weight(o_weight_0_1),
.o_map(o_map_0_1),
.o_result(o_result_0_1)
);

pe pe0_2
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_0_2),
.i_weight(i_weight_0_2),
.i_map(i_map_0_2),
.o_weight(o_weight_0_2),
.o_map(o_map_0_2),
.o_result(o_result_0_2)
);

pe pe0_3
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_0_3),
.i_weight(i_weight_0_3),
.i_map(i_map_0_3),
.o_weight(o_weight_0_3),
.o_map(o_map_0_3),
.o_result(o_result_0_3)
);

pe pe0_4
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_0_4),
.i_weight(i_weight_0_4),
.i_map(i_map_0_4),
.o_weight(o_weight_0_4),
.o_map(o_map_0_4),
.o_result(o_result_0_4)
);

pe pe0_5
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_0_5),
.i_weight(i_weight_0_5),
.i_map(i_map_0_5),
.o_weight(o_weight_0_5),
.o_map(o_map_0_5),
.o_result(o_result_0_5)
);

pe pe0_6
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_0_6),
.i_weight(i_weight_0_6),
.i_map(i_map_0_6),
.o_weight(o_weight_0_6),
.o_map(o_map_0_6),
.o_result(o_result_0_6)
);

pe pe0_7
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_0_7),
.i_weight(i_weight_0_7),
.i_map(i_map_0_7),
.o_weight(o_weight_0_7),
.o_map(o_map_0_7),
.o_result(o_result_0_7)
);

pe pe1_0
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_1_0),
.i_weight(i_weight_1_0),
.i_map(i_map_1_0),
.o_weight(o_weight_1_0),
.o_map(o_map_1_0),
.o_result(o_result_1_0)
);

pe pe1_1
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_1_1),
.i_weight(i_weight_1_1),
.i_map(i_map_1_1),
.o_weight(o_weight_1_1),
.o_map(o_map_1_1),
.o_result(o_result_1_1)
);

pe pe1_2
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_1_2),
.i_weight(i_weight_1_2),
.i_map(i_map_1_2),
.o_weight(o_weight_1_2),
.o_map(o_map_1_2),
.o_result(o_result_1_2)
);

pe pe1_3
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_1_3),
.i_weight(i_weight_1_3),
.i_map(i_map_1_3),
.o_weight(o_weight_1_3),
.o_map(o_map_1_3),
.o_result(o_result_1_3)
);

pe pe1_4
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_1_4),
.i_weight(i_weight_1_4),
.i_map(i_map_1_4),
.o_weight(o_weight_1_4),
.o_map(o_map_1_4),
.o_result(o_result_1_4)
);

pe pe1_5
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_1_5),
.i_weight(i_weight_1_5),
.i_map(i_map_1_5),
.o_weight(o_weight_1_5),
.o_map(o_map_1_5),
.o_result(o_result_1_5)
);

pe pe1_6
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_1_6),
.i_weight(i_weight_1_6),
.i_map(i_map_1_6),
.o_weight(o_weight_1_6),
.o_map(o_map_1_6),
.o_result(o_result_1_6)
);

pe pe1_7
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_1_7),
.i_weight(i_weight_1_7),
.i_map(i_map_1_7),
.o_weight(o_weight_1_7),
.o_map(o_map_1_7),
.o_result(o_result_1_7)
);

pe pe2_0
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_2_0),
.i_weight(i_weight_2_0),
.i_map(i_map_2_0),
.o_weight(o_weight_2_0),
.o_map(o_map_2_0),
.o_result(o_result_2_0)
);

pe pe2_1
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_2_1),
.i_weight(i_weight_2_1),
.i_map(i_map_2_1),
.o_weight(o_weight_2_1),
.o_map(o_map_2_1),
.o_result(o_result_2_1)
);

pe pe2_2
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_2_2),
.i_weight(i_weight_2_2),
.i_map(i_map_2_2),
.o_weight(o_weight_2_2),
.o_map(o_map_2_2),
.o_result(o_result_2_2)
);

pe pe2_3
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_2_3),
.i_weight(i_weight_2_3),
.i_map(i_map_2_3),
.o_weight(o_weight_2_3),
.o_map(o_map_2_3),
.o_result(o_result_2_3)
);

pe pe2_4
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_2_4),
.i_weight(i_weight_2_4),
.i_map(i_map_2_4),
.o_weight(o_weight_2_4),
.o_map(o_map_2_4),
.o_result(o_result_2_4)
);

pe pe2_5
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_2_5),
.i_weight(i_weight_2_5),
.i_map(i_map_2_5),
.o_weight(o_weight_2_5),
.o_map(o_map_2_5),
.o_result(o_result_2_5)
);

pe pe2_6
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_2_6),
.i_weight(i_weight_2_6),
.i_map(i_map_2_6),
.o_weight(o_weight_2_6),
.o_map(o_map_2_6),
.o_result(o_result_2_6)
);

pe pe2_7
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_2_7),
.i_weight(i_weight_2_7),
.i_map(i_map_2_7),
.o_weight(o_weight_2_7),
.o_map(o_map_2_7),
.o_result(o_result_2_7)
);

pe pe3_0
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_3_0),
.i_weight(i_weight_3_0),
.i_map(i_map_3_0),
.o_weight(o_weight_3_0),
.o_map(o_map_3_0),
.o_result(o_result_3_0)
);

pe pe3_1
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_3_1),
.i_weight(i_weight_3_1),
.i_map(i_map_3_1),
.o_weight(o_weight_3_1),
.o_map(o_map_3_1),
.o_result(o_result_3_1)
);

pe pe3_2
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_3_2),
.i_weight(i_weight_3_2),
.i_map(i_map_3_2),
.o_weight(o_weight_3_2),
.o_map(o_map_3_2),
.o_result(o_result_3_2)
);

pe pe3_3
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_3_3),
.i_weight(i_weight_3_3),
.i_map(i_map_3_3),
.o_weight(o_weight_3_3),
.o_map(o_map_3_3),
.o_result(o_result_3_3)
);

pe pe3_4
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_3_4),
.i_weight(i_weight_3_4),
.i_map(i_map_3_4),
.o_weight(o_weight_3_4),
.o_map(o_map_3_4),
.o_result(o_result_3_4)
);

pe pe3_5
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_3_5),
.i_weight(i_weight_3_5),
.i_map(i_map_3_5),
.o_weight(o_weight_3_5),
.o_map(o_map_3_5),
.o_result(o_result_3_5)
);

pe pe3_6
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_3_6),
.i_weight(i_weight_3_6),
.i_map(i_map_3_6),
.o_weight(o_weight_3_6),
.o_map(o_map_3_6),
.o_result(o_result_3_6)
);

pe pe3_7
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_3_7),
.i_weight(i_weight_3_7),
.i_map(i_map_3_7),
.o_weight(o_weight_3_7),
.o_map(o_map_3_7),
.o_result(o_result_3_7)
);

pe pe4_0
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_4_0),
.i_weight(i_weight_4_0),
.i_map(i_map_4_0),
.o_weight(o_weight_4_0),
.o_map(o_map_4_0),
.o_result(o_result_4_0)
);

pe pe4_1
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_4_1),
.i_weight(i_weight_4_1),
.i_map(i_map_4_1),
.o_weight(o_weight_4_1),
.o_map(o_map_4_1),
.o_result(o_result_4_1)
);

pe pe4_2
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_4_2),
.i_weight(i_weight_4_2),
.i_map(i_map_4_2),
.o_weight(o_weight_4_2),
.o_map(o_map_4_2),
.o_result(o_result_4_2)
);

pe pe4_3
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_4_3),
.i_weight(i_weight_4_3),
.i_map(i_map_4_3),
.o_weight(o_weight_4_3),
.o_map(o_map_4_3),
.o_result(o_result_4_3)
);

pe pe4_4
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_4_4),
.i_weight(i_weight_4_4),
.i_map(i_map_4_4),
.o_weight(o_weight_4_4),
.o_map(o_map_4_4),
.o_result(o_result_4_4)
);

pe pe4_5
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_4_5),
.i_weight(i_weight_4_5),
.i_map(i_map_4_5),
.o_weight(o_weight_4_5),
.o_map(o_map_4_5),
.o_result(o_result_4_5)
);

pe pe4_6
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_4_6),
.i_weight(i_weight_4_6),
.i_map(i_map_4_6),
.o_weight(o_weight_4_6),
.o_map(o_map_4_6),
.o_result(o_result_4_6)
);

pe pe4_7
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_4_7),
.i_weight(i_weight_4_7),
.i_map(i_map_4_7),
.o_weight(o_weight_4_7),
.o_map(o_map_4_7),
.o_result(o_result_4_7)
);

pe pe5_0
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_5_0),
.i_weight(i_weight_5_0),
.i_map(i_map_5_0),
.o_weight(o_weight_5_0),
.o_map(o_map_5_0),
.o_result(o_result_5_0)
);

pe pe5_1
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_5_1),
.i_weight(i_weight_5_1),
.i_map(i_map_5_1),
.o_weight(o_weight_5_1),
.o_map(o_map_5_1),
.o_result(o_result_5_1)
);

pe pe5_2
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_5_2),
.i_weight(i_weight_5_2),
.i_map(i_map_5_2),
.o_weight(o_weight_5_2),
.o_map(o_map_5_2),
.o_result(o_result_5_2)
);

pe pe5_3
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_5_3),
.i_weight(i_weight_5_3),
.i_map(i_map_5_3),
.o_weight(o_weight_5_3),
.o_map(o_map_5_3),
.o_result(o_result_5_3)
);

pe pe5_4
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_5_4),
.i_weight(i_weight_5_4),
.i_map(i_map_5_4),
.o_weight(o_weight_5_4),
.o_map(o_map_5_4),
.o_result(o_result_5_4)
);

pe pe5_5
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_5_5),
.i_weight(i_weight_5_5),
.i_map(i_map_5_5),
.o_weight(o_weight_5_5),
.o_map(o_map_5_5),
.o_result(o_result_5_5)
);

pe pe5_6
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_5_6),
.i_weight(i_weight_5_6),
.i_map(i_map_5_6),
.o_weight(o_weight_5_6),
.o_map(o_map_5_6),
.o_result(o_result_5_6)
);

pe pe5_7
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_5_7),
.i_weight(i_weight_5_7),
.i_map(i_map_5_7),
.o_weight(o_weight_5_7),
.o_map(o_map_5_7),
.o_result(o_result_5_7)
);

pe pe6_0
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_6_0),
.i_weight(i_weight_6_0),
.i_map(i_map_6_0),
.o_weight(o_weight_6_0),
.o_map(o_map_6_0),
.o_result(o_result_6_0)
);

pe pe6_1
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_6_1),
.i_weight(i_weight_6_1),
.i_map(i_map_6_1),
.o_weight(o_weight_6_1),
.o_map(o_map_6_1),
.o_result(o_result_6_1)
);

pe pe6_2
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_6_2),
.i_weight(i_weight_6_2),
.i_map(i_map_6_2),
.o_weight(o_weight_6_2),
.o_map(o_map_6_2),
.o_result(o_result_6_2)
);

pe pe6_3
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_6_3),
.i_weight(i_weight_6_3),
.i_map(i_map_6_3),
.o_weight(o_weight_6_3),
.o_map(o_map_6_3),
.o_result(o_result_6_3)
);

pe pe6_4
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_6_4),
.i_weight(i_weight_6_4),
.i_map(i_map_6_4),
.o_weight(o_weight_6_4),
.o_map(o_map_6_4),
.o_result(o_result_6_4)
);

pe pe6_5
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_6_5),
.i_weight(i_weight_6_5),
.i_map(i_map_6_5),
.o_weight(o_weight_6_5),
.o_map(o_map_6_5),
.o_result(o_result_6_5)
);

pe pe6_6
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_6_6),
.i_weight(i_weight_6_6),
.i_map(i_map_6_6),
.o_weight(o_weight_6_6),
.o_map(o_map_6_6),
.o_result(o_result_6_6)
);

pe pe6_7
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_6_7),
.i_weight(i_weight_6_7),
.i_map(i_map_6_7),
.o_weight(o_weight_6_7),
.o_map(o_map_6_7),
.o_result(o_result_6_7)
);

pe pe7_0
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_7_0),
.i_weight(i_weight_7_0),
.i_map(i_map_7_0),
.o_weight(o_weight_7_0),
.o_map(o_map_7_0),
.o_result(o_result_7_0)
);

pe pe7_1
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_7_1),
.i_weight(i_weight_7_1),
.i_map(i_map_7_1),
.o_weight(o_weight_7_1),
.o_map(o_map_7_1),
.o_result(o_result_7_1)
);

pe pe7_2
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_7_2),
.i_weight(i_weight_7_2),
.i_map(i_map_7_2),
.o_weight(o_weight_7_2),
.o_map(o_map_7_2),
.o_result(o_result_7_2)
);

pe pe7_3
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_7_3),
.i_weight(i_weight_7_3),
.i_map(i_map_7_3),
.o_weight(o_weight_7_3),
.o_map(o_map_7_3),
.o_result(o_result_7_3)
);

pe pe7_4
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_7_4),
.i_weight(i_weight_7_4),
.i_map(i_map_7_4),
.o_weight(o_weight_7_4),
.o_map(o_map_7_4),
.o_result(o_result_7_4)
);

pe pe7_5
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_7_5),
.i_weight(i_weight_7_5),
.i_map(i_map_7_5),
.o_weight(o_weight_7_5),
.o_map(o_map_7_5),
.o_result(o_result_7_5)
);

pe pe7_6
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_7_6),
.i_weight(i_weight_7_6),
.i_map(i_map_7_6),
.o_weight(o_weight_7_6),
.o_map(o_map_7_6),
.o_result(o_result_7_6)
);

pe pe7_7
(
.clk(clk),
.rst_n(rst_n),
.i_clear(i_clear_7_7),
.i_weight(i_weight_7_7),
.i_map(i_map_7_7),
.o_weight(o_weight_7_7),
.o_map(o_map_7_7),
.o_result(o_result_7_7)
);

endmodule