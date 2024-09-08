`include "npu_rtl.svh"
`include "npu_interface.sv"
module npu_tb();
    import npu_pkg::*;
    logic clk;
    logic rst_n;

    npu_interface npu_vif(clk, rst_n);

    pe_interface pe_vif(clk, rst_n);
    dual_port_ram_mem mem_vif(rst_n);

    ram_wr_control_data_interface ram0_data_vif(clk, rst_n);
    ram_wr_control_data_interface ram1_data_vif(clk, rst_n);
    ram_wr_control_data_interface ram2_data_vif(clk, rst_n);
    ram_wr_control_data_interface ram3_data_vif(clk, rst_n);
    ram_wr_control_data_interface ram4_data_vif(clk, rst_n);
    ram_wr_control_data_interface ram5_data_vif(clk, rst_n);
    ram_wr_control_data_interface ram6_data_vif(clk, rst_n);
    ram_wr_control_data_interface ram7_data_vif(clk, rst_n);

    ram_wr_control_weight_interface ram0_weight_vif(clk, rst_n);
    ram_wr_control_weight_interface ram1_weight_vif(clk, rst_n);
    ram_wr_control_weight_interface ram2_weight_vif(clk, rst_n);
    ram_wr_control_weight_interface ram3_weight_vif(clk, rst_n);
    ram_wr_control_weight_interface ram4_weight_vif(clk, rst_n);
    ram_wr_control_weight_interface ram5_weight_vif(clk, rst_n);
    ram_wr_control_weight_interface ram6_weight_vif(clk, rst_n);
    ram_wr_control_weight_interface ram7_weight_vif(clk, rst_n);

    ram_rd_control_interface ram_rd_vif(clk, rst_n);

    assign pe_vif.i_clear = u_NPU.pe_array.pe0_0.i_clear;
    assign pe_vif.i_weight = u_NPU.pe_array.pe0_0.i_weight;
    assign pe_vif.i_map = u_NPU.pe_array.pe0_0.i_map;
    assign pe_vif.o_weight = u_NPU.pe_array.pe0_0.o_weight;
    assign pe_vif.o_map = u_NPU.pe_array.pe0_0.o_map;
    assign pe_vif.o_result = u_NPU.pe_array.pe0_0.o_result;

    assign mem_vif.mem = u_NPU.pe_control_data.dual_port_ram_0.mem;

    // u_NPU.pe_control_data.ram_wr_control
    assign ram0_data_vif.wr_sop = u_NPU.pe_control_data.ram_wr_control_0.wr_sop;
    assign ram0_data_vif.wr_eop = u_NPU.pe_control_data.ram_wr_control_0.wr_eop;
    assign ram0_data_vif.wr_vld = u_NPU.pe_control_data.ram_wr_control_0.wr_vld;
    assign ram0_data_vif.wr_data = u_NPU.pe_control_data.ram_wr_control_0.wr_data;
    assign ram0_data_vif.ram_wr_en = u_NPU.pe_control_data.ram_wr_control_0.ram_wr_en;
    assign ram0_data_vif.ram_wr_strb = u_NPU.pe_control_data.ram_wr_control_0.ram_wr_strb;
    assign ram0_data_vif.ram_wr_addr = u_NPU.pe_control_data.ram_wr_control_0.ram_wr_addr;
    assign ram0_data_vif.ram_wr_data = u_NPU.pe_control_data.ram_wr_control_0.ram_wr_data;

    assign ram1_data_vif.wr_sop = u_NPU.pe_control_data.ram_wr_control_1.wr_sop;
    assign ram1_data_vif.wr_eop = u_NPU.pe_control_data.ram_wr_control_1.wr_eop;
    assign ram1_data_vif.wr_vld = u_NPU.pe_control_data.ram_wr_control_1.wr_vld;
    assign ram1_data_vif.wr_data = u_NPU.pe_control_data.ram_wr_control_1.wr_data;
    assign ram1_data_vif.ram_wr_en = u_NPU.pe_control_data.ram_wr_control_1.ram_wr_en;
    assign ram1_data_vif.ram_wr_strb = u_NPU.pe_control_data.ram_wr_control_1.ram_wr_strb;
    assign ram1_data_vif.ram_wr_addr = u_NPU.pe_control_data.ram_wr_control_1.ram_wr_addr;
    assign ram1_data_vif.ram_wr_data = u_NPU.pe_control_data.ram_wr_control_1.ram_wr_data;

    assign ram2_data_vif.wr_sop = u_NPU.pe_control_data.ram_wr_control_2.wr_sop;
    assign ram2_data_vif.wr_eop = u_NPU.pe_control_data.ram_wr_control_2.wr_eop;
    assign ram2_data_vif.wr_vld = u_NPU.pe_control_data.ram_wr_control_2.wr_vld;
    assign ram2_data_vif.wr_data = u_NPU.pe_control_data.ram_wr_control_2.wr_data;
    assign ram2_data_vif.ram_wr_en = u_NPU.pe_control_data.ram_wr_control_2.ram_wr_en;
    assign ram2_data_vif.ram_wr_strb = u_NPU.pe_control_data.ram_wr_control_2.ram_wr_strb;
    assign ram2_data_vif.ram_wr_addr = u_NPU.pe_control_data.ram_wr_control_2.ram_wr_addr;
    assign ram2_data_vif.ram_wr_data = u_NPU.pe_control_data.ram_wr_control_2.ram_wr_data;

    assign ram3_data_vif.wr_sop = u_NPU.pe_control_data.ram_wr_control_3.wr_sop;
    assign ram3_data_vif.wr_eop = u_NPU.pe_control_data.ram_wr_control_3.wr_eop;
    assign ram3_data_vif.wr_vld = u_NPU.pe_control_data.ram_wr_control_3.wr_vld;
    assign ram3_data_vif.wr_data = u_NPU.pe_control_data.ram_wr_control_3.wr_data;
    assign ram3_data_vif.ram_wr_en = u_NPU.pe_control_data.ram_wr_control_3.ram_wr_en;
    assign ram3_data_vif.ram_wr_strb = u_NPU.pe_control_data.ram_wr_control_3.ram_wr_strb;
    assign ram3_data_vif.ram_wr_addr = u_NPU.pe_control_data.ram_wr_control_3.ram_wr_addr;
    assign ram3_data_vif.ram_wr_data = u_NPU.pe_control_data.ram_wr_control_3.ram_wr_data;

    assign ram4_data_vif.wr_sop = u_NPU.pe_control_data.ram_wr_control_4.wr_sop;
    assign ram4_data_vif.wr_eop = u_NPU.pe_control_data.ram_wr_control_4.wr_eop;
    assign ram4_data_vif.wr_vld = u_NPU.pe_control_data.ram_wr_control_4.wr_vld;
    assign ram4_data_vif.wr_data = u_NPU.pe_control_data.ram_wr_control_4.wr_data;
    assign ram4_data_vif.ram_wr_en = u_NPU.pe_control_data.ram_wr_control_4.ram_wr_en;
    assign ram4_data_vif.ram_wr_strb = u_NPU.pe_control_data.ram_wr_control_4.ram_wr_strb;
    assign ram4_data_vif.ram_wr_addr = u_NPU.pe_control_data.ram_wr_control_4.ram_wr_addr;
    assign ram4_data_vif.ram_wr_data = u_NPU.pe_control_data.ram_wr_control_4.ram_wr_data;

    assign ram5_data_vif.wr_sop = u_NPU.pe_control_data.ram_wr_control_5.wr_sop;
    assign ram5_data_vif.wr_eop = u_NPU.pe_control_data.ram_wr_control_5.wr_eop;
    assign ram5_data_vif.wr_vld = u_NPU.pe_control_data.ram_wr_control_5.wr_vld;
    assign ram5_data_vif.wr_data = u_NPU.pe_control_data.ram_wr_control_5.wr_data;
    assign ram5_data_vif.ram_wr_en = u_NPU.pe_control_data.ram_wr_control_5.ram_wr_en;
    assign ram5_data_vif.ram_wr_strb = u_NPU.pe_control_data.ram_wr_control_5.ram_wr_strb;
    assign ram5_data_vif.ram_wr_addr = u_NPU.pe_control_data.ram_wr_control_5.ram_wr_addr;
    assign ram5_data_vif.ram_wr_data = u_NPU.pe_control_data.ram_wr_control_5.ram_wr_data;

    assign ram6_data_vif.wr_sop = u_NPU.pe_control_data.ram_wr_control_6.wr_sop;
    assign ram6_data_vif.wr_eop = u_NPU.pe_control_data.ram_wr_control_6.wr_eop;
    assign ram6_data_vif.wr_vld = u_NPU.pe_control_data.ram_wr_control_6.wr_vld;
    assign ram6_data_vif.wr_data = u_NPU.pe_control_data.ram_wr_control_6.wr_data;
    assign ram6_data_vif.ram_wr_en = u_NPU.pe_control_data.ram_wr_control_6.ram_wr_en;
    assign ram6_data_vif.ram_wr_strb = u_NPU.pe_control_data.ram_wr_control_6.ram_wr_strb;
    assign ram6_data_vif.ram_wr_addr = u_NPU.pe_control_data.ram_wr_control_6.ram_wr_addr;
    assign ram6_data_vif.ram_wr_data = u_NPU.pe_control_data.ram_wr_control_6.ram_wr_data;

    assign ram7_data_vif.wr_sop = u_NPU.pe_control_data.ram_wr_control_7.wr_sop;
    assign ram7_data_vif.wr_eop = u_NPU.pe_control_data.ram_wr_control_7.wr_eop;
    assign ram7_data_vif.wr_vld = u_NPU.pe_control_data.ram_wr_control_7.wr_vld;
    assign ram7_data_vif.wr_data = u_NPU.pe_control_data.ram_wr_control_7.wr_data;
    assign ram7_data_vif.ram_wr_en = u_NPU.pe_control_data.ram_wr_control_7.ram_wr_en;
    assign ram7_data_vif.ram_wr_strb = u_NPU.pe_control_data.ram_wr_control_7.ram_wr_strb;
    assign ram7_data_vif.ram_wr_addr = u_NPU.pe_control_data.ram_wr_control_7.ram_wr_addr;
    assign ram7_data_vif.ram_wr_data = u_NPU.pe_control_data.ram_wr_control_7.ram_wr_data;

    // u_NPU.pe_control_weight.ram_wr_control
    assign ram0_weight_vif.wr_sop = u_NPU.pe_control_weight.ram_wr_control_0.wr_sop;
    assign ram0_weight_vif.wr_eop = u_NPU.pe_control_weight.ram_wr_control_0.wr_eop;
    assign ram0_weight_vif.wr_vld = u_NPU.pe_control_weight.ram_wr_control_0.wr_vld;
    assign ram0_weight_vif.wr_data = u_NPU.pe_control_weight.ram_wr_control_0.wr_data;
    assign ram0_weight_vif.ram_wr_en = u_NPU.pe_control_weight.ram_wr_control_0.ram_wr_en;
    assign ram0_weight_vif.ram_wr_strb = u_NPU.pe_control_weight.ram_wr_control_0.ram_wr_strb;
    assign ram0_weight_vif.ram_wr_addr = u_NPU.pe_control_weight.ram_wr_control_0.ram_wr_addr;
    assign ram0_weight_vif.ram_wr_data = u_NPU.pe_control_weight.ram_wr_control_0.ram_wr_data;

    assign ram1_weight_vif.wr_sop = u_NPU.pe_control_weight.ram_wr_control_1.wr_sop;
    assign ram1_weight_vif.wr_eop = u_NPU.pe_control_weight.ram_wr_control_1.wr_eop;
    assign ram1_weight_vif.wr_vld = u_NPU.pe_control_weight.ram_wr_control_1.wr_vld;
    assign ram1_weight_vif.wr_data = u_NPU.pe_control_weight.ram_wr_control_1.wr_data;
    assign ram1_weight_vif.ram_wr_en = u_NPU.pe_control_weight.ram_wr_control_1.ram_wr_en;
    assign ram1_weight_vif.ram_wr_strb = u_NPU.pe_control_weight.ram_wr_control_1.ram_wr_strb;
    assign ram1_weight_vif.ram_wr_addr = u_NPU.pe_control_weight.ram_wr_control_1.ram_wr_addr;
    assign ram1_weight_vif.ram_wr_data = u_NPU.pe_control_weight.ram_wr_control_1.ram_wr_data;

    assign ram2_weight_vif.wr_sop = u_NPU.pe_control_weight.ram_wr_control_2.wr_sop;
    assign ram2_weight_vif.wr_eop = u_NPU.pe_control_weight.ram_wr_control_2.wr_eop;
    assign ram2_weight_vif.wr_vld = u_NPU.pe_control_weight.ram_wr_control_2.wr_vld;
    assign ram2_weight_vif.wr_data = u_NPU.pe_control_weight.ram_wr_control_2.wr_data;
    assign ram2_weight_vif.ram_wr_en = u_NPU.pe_control_weight.ram_wr_control_2.ram_wr_en;
    assign ram2_weight_vif.ram_wr_strb = u_NPU.pe_control_weight.ram_wr_control_2.ram_wr_strb;
    assign ram2_weight_vif.ram_wr_addr = u_NPU.pe_control_weight.ram_wr_control_2.ram_wr_addr;
    assign ram2_weight_vif.ram_wr_data = u_NPU.pe_control_weight.ram_wr_control_2.ram_wr_data;

    assign ram3_weight_vif.wr_sop = u_NPU.pe_control_weight.ram_wr_control_3.wr_sop;
    assign ram3_weight_vif.wr_eop = u_NPU.pe_control_weight.ram_wr_control_3.wr_eop;
    assign ram3_weight_vif.wr_vld = u_NPU.pe_control_weight.ram_wr_control_3.wr_vld;
    assign ram3_weight_vif.wr_data = u_NPU.pe_control_weight.ram_wr_control_3.wr_data;
    assign ram3_weight_vif.ram_wr_en = u_NPU.pe_control_weight.ram_wr_control_3.ram_wr_en;
    assign ram3_weight_vif.ram_wr_strb = u_NPU.pe_control_weight.ram_wr_control_3.ram_wr_strb;
    assign ram3_weight_vif.ram_wr_addr = u_NPU.pe_control_weight.ram_wr_control_3.ram_wr_addr;
    assign ram3_weight_vif.ram_wr_data = u_NPU.pe_control_weight.ram_wr_control_3.ram_wr_data;

    assign ram4_weight_vif.wr_sop = u_NPU.pe_control_weight.ram_wr_control_4.wr_sop;
    assign ram4_weight_vif.wr_eop = u_NPU.pe_control_weight.ram_wr_control_4.wr_eop;
    assign ram4_weight_vif.wr_vld = u_NPU.pe_control_weight.ram_wr_control_4.wr_vld;
    assign ram4_weight_vif.wr_data = u_NPU.pe_control_weight.ram_wr_control_4.wr_data;
    assign ram4_weight_vif.ram_wr_en = u_NPU.pe_control_weight.ram_wr_control_4.ram_wr_en;
    assign ram4_weight_vif.ram_wr_strb = u_NPU.pe_control_weight.ram_wr_control_4.ram_wr_strb;
    assign ram4_weight_vif.ram_wr_addr = u_NPU.pe_control_weight.ram_wr_control_4.ram_wr_addr;
    assign ram4_weight_vif.ram_wr_data = u_NPU.pe_control_weight.ram_wr_control_4.ram_wr_data;

    assign ram5_weight_vif.wr_sop = u_NPU.pe_control_weight.ram_wr_control_5.wr_sop;
    assign ram5_weight_vif.wr_eop = u_NPU.pe_control_weight.ram_wr_control_5.wr_eop;
    assign ram5_weight_vif.wr_vld = u_NPU.pe_control_weight.ram_wr_control_5.wr_vld;
    assign ram5_weight_vif.wr_data = u_NPU.pe_control_weight.ram_wr_control_5.wr_data;
    assign ram5_weight_vif.ram_wr_en = u_NPU.pe_control_weight.ram_wr_control_5.ram_wr_en;
    assign ram5_weight_vif.ram_wr_strb = u_NPU.pe_control_weight.ram_wr_control_5.ram_wr_strb;
    assign ram5_weight_vif.ram_wr_addr = u_NPU.pe_control_weight.ram_wr_control_5.ram_wr_addr;
    assign ram5_weight_vif.ram_wr_data = u_NPU.pe_control_weight.ram_wr_control_5.ram_wr_data;

    assign ram6_weight_vif.wr_sop = u_NPU.pe_control_weight.ram_wr_control_6.wr_sop;
    assign ram6_weight_vif.wr_eop = u_NPU.pe_control_weight.ram_wr_control_6.wr_eop;
    assign ram6_weight_vif.wr_vld = u_NPU.pe_control_weight.ram_wr_control_6.wr_vld;
    assign ram6_weight_vif.wr_data = u_NPU.pe_control_weight.ram_wr_control_6.wr_data;
    assign ram6_weight_vif.ram_wr_en = u_NPU.pe_control_weight.ram_wr_control_6.ram_wr_en;
    assign ram6_weight_vif.ram_wr_strb = u_NPU.pe_control_weight.ram_wr_control_6.ram_wr_strb;
    assign ram6_weight_vif.ram_wr_addr = u_NPU.pe_control_weight.ram_wr_control_6.ram_wr_addr;
    assign ram6_weight_vif.ram_wr_data = u_NPU.pe_control_weight.ram_wr_control_6.ram_wr_data;

    assign ram7_weight_vif.wr_sop = u_NPU.pe_control_weight.ram_wr_control_7.wr_sop;
    assign ram7_weight_vif.wr_eop = u_NPU.pe_control_weight.ram_wr_control_7.wr_eop;
    assign ram7_weight_vif.wr_vld = u_NPU.pe_control_weight.ram_wr_control_7.wr_vld;
    assign ram7_weight_vif.wr_data = u_NPU.pe_control_weight.ram_wr_control_7.wr_data;
    assign ram7_weight_vif.ram_wr_en = u_NPU.pe_control_weight.ram_wr_control_7.ram_wr_en;
    assign ram7_weight_vif.ram_wr_strb = u_NPU.pe_control_weight.ram_wr_control_7.ram_wr_strb;
    assign ram7_weight_vif.ram_wr_addr = u_NPU.pe_control_weight.ram_wr_control_7.ram_wr_addr;
    assign ram7_weight_vif.ram_wr_data = u_NPU.pe_control_weight.ram_wr_control_7.ram_wr_data;

    assign ram_rd_vif.rd_sop = u_NPU.pe_control_data.ram_rd_control_0.rd_sop;
    assign ram_rd_vif.ram_rd_en = u_NPU.pe_control_data.ram_rd_control_0.ram_rd_en;
    assign ram_rd_vif.ram_raddr = u_NPU.pe_control_data.ram_rd_control_0.ram_raddr;
    assign ram_rd_vif.ram_rdata = u_NPU.pe_control_data.ram_rd_control_0.ram_rdata;
    assign ram_rd_vif.pe_data = u_NPU.pe_control_data.ram_rd_control_0.pe_data;

    always #5 clk = ~clk;

    initial begin
        rst_n = 1'b0;
        clk = 1'b0;
        repeat(5)begin
            @(posedge clk);
        end
        rst_n <= 1'b1;
        repeat(5)begin
            @(posedge clk);
        end
        rst_n = 1'b0;
        repeat(5)begin
            @(posedge clk);
        end
        rst_n <= 1'b1;
    end

    initial begin 
        uvm_config_db#(virtual npu_interface)::set(uvm_root::get(), "uvm_test_top.env.mst_agt.d_drv", "npu_vif", npu_vif);
        
        uvm_config_db#(virtual pe_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "pe_vif", pe_vif);
        uvm_config_db#(virtual dual_port_ram_mem)::set(uvm_root::get(), "uvm_test_top.env.cgm", "mem_vif", mem_vif);

        uvm_config_db#(virtual ram_wr_control_data_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram0_data_vif", ram0_data_vif);
        uvm_config_db#(virtual ram_wr_control_data_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram1_data_vif", ram1_data_vif);
        uvm_config_db#(virtual ram_wr_control_data_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram2_data_vif", ram2_data_vif);
        uvm_config_db#(virtual ram_wr_control_data_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram3_data_vif", ram3_data_vif);
        uvm_config_db#(virtual ram_wr_control_data_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram4_data_vif", ram4_data_vif);
        uvm_config_db#(virtual ram_wr_control_data_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram5_data_vif", ram5_data_vif);
        uvm_config_db#(virtual ram_wr_control_data_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram6_data_vif", ram6_data_vif);
        uvm_config_db#(virtual ram_wr_control_data_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram7_data_vif", ram7_data_vif);

        uvm_config_db#(virtual ram_wr_control_weight_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram0_weight_vif", ram0_weight_vif);
        uvm_config_db#(virtual ram_wr_control_weight_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram1_weight_vif", ram1_weight_vif);
        uvm_config_db#(virtual ram_wr_control_weight_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram2_weight_vif", ram2_weight_vif);
        uvm_config_db#(virtual ram_wr_control_weight_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram3_weight_vif", ram3_weight_vif);
        uvm_config_db#(virtual ram_wr_control_weight_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram4_weight_vif", ram4_weight_vif);
        uvm_config_db#(virtual ram_wr_control_weight_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram5_weight_vif", ram5_weight_vif);
        uvm_config_db#(virtual ram_wr_control_weight_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram6_weight_vif", ram6_weight_vif);
        uvm_config_db#(virtual ram_wr_control_weight_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram7_weight_vif", ram7_weight_vif);

        uvm_config_db#(virtual ram_rd_control_interface)::set(uvm_root::get(), "uvm_test_top.env.cgm", "ram_rd_vif", ram_rd_vif);

        run_test("npu_random_test");
    end

NPU u_NPU(
    .clk                                (clk                       ),
    .rst_n                              (rst_n                     ),
    //NPU write port
    .wr_sop_weight                      (npu_vif.wr_sop_weight     ),
    .wr_eop_weight                      (npu_vif.wr_eop_weight     ),
    .wr_vld_weight                      (npu_vif.wr_vld_weight     ),
    .wr_data_weight                     (npu_vif.wr_data_weight    ),
    .wr_sop_data                        (npu_vif.wr_sop_data       ),
    .wr_eop_data                        (npu_vif.wr_eop_data       ),
    .wr_vld_data                        (npu_vif.wr_vld_data       ),
    .wr_data_data                       (npu_vif.wr_data_data      ),
    //NPU read port
    .save_finish                        (npu_vif.save_finish       ),
    .rd_sop_0                           (npu_vif.rd_sop_0          ),
    .rd_sop_1                           (npu_vif.rd_sop_1          ),
    .rd_sop_2                           (npu_vif.rd_sop_2          ),
    .rd_sop_3                           (npu_vif.rd_sop_3          ),
    .rd_sop_4                           (npu_vif.rd_sop_4          ),
    .rd_sop_5                           (npu_vif.rd_sop_5          ),
    .rd_sop_6                           (npu_vif.rd_sop_6          ),
    .rd_sop_7                           (npu_vif.rd_sop_7          ),
    .rd_eop_0                           (npu_vif.rd_eop_0          ),
    .rd_eop_1                           (npu_vif.rd_eop_1          ),
    .rd_eop_2                           (npu_vif.rd_eop_2          ),
    .rd_eop_3                           (npu_vif.rd_eop_3          ),
    .rd_eop_4                           (npu_vif.rd_eop_4          ),
    .rd_eop_5                           (npu_vif.rd_eop_5          ),
    .rd_eop_6                           (npu_vif.rd_eop_6          ),
    .rd_eop_7                           (npu_vif.rd_eop_7          ),
    .rd_vld_0                           (npu_vif.rd_vld_0          ),
    .rd_vld_1                           (npu_vif.rd_vld_1          ),
    .rd_vld_2                           (npu_vif.rd_vld_2          ),
    .rd_vld_3                           (npu_vif.rd_vld_3          ),
    .rd_vld_4                           (npu_vif.rd_vld_4          ),
    .rd_vld_5                           (npu_vif.rd_vld_5          ),
    .rd_vld_6                           (npu_vif.rd_vld_6          ),
    .rd_vld_7                           (npu_vif.rd_vld_7          ),
    .rd_data_0                          (npu_vif.rd_data_0         ),
    .rd_data_1                          (npu_vif.rd_data_1         ),
    .rd_data_2                          (npu_vif.rd_data_2         ),
    .rd_data_3                          (npu_vif.rd_data_3         ),
    .rd_data_4                          (npu_vif.rd_data_4         ),
    .rd_data_5                          (npu_vif.rd_data_5         ),
    .rd_data_6                          (npu_vif.rd_data_6         ),
    .rd_data_7                          (npu_vif.rd_data_7         ) 
);

endmodule


