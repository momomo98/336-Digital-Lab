
class npu_cov extends uvm_component;
    `uvm_component_utils(npu_cov)

    virtual pe_interface pe_vif;
    virtual dual_port_ram_mem mem_vif;

    virtual ram_wr_control_data_interface ram0_data_vif;
    virtual ram_wr_control_data_interface ram1_data_vif;
    virtual ram_wr_control_data_interface ram2_data_vif;
    virtual ram_wr_control_data_interface ram3_data_vif;
    virtual ram_wr_control_data_interface ram4_data_vif;
    virtual ram_wr_control_data_interface ram5_data_vif;
    virtual ram_wr_control_data_interface ram6_data_vif;
    virtual ram_wr_control_data_interface ram7_data_vif;

    virtual ram_wr_control_weight_interface ram0_weight_vif;
    virtual ram_wr_control_weight_interface ram1_weight_vif;
    virtual ram_wr_control_weight_interface ram2_weight_vif;
    virtual ram_wr_control_weight_interface ram3_weight_vif;
    virtual ram_wr_control_weight_interface ram4_weight_vif;
    virtual ram_wr_control_weight_interface ram5_weight_vif;
    virtual ram_wr_control_weight_interface ram6_weight_vif;
    virtual ram_wr_control_weight_interface ram7_weight_vif;

    virtual ram_rd_control_interface ram_rd_vif;

    covergroup dual_port_ram_rst_cg with function sample(bit [15:0] arrdata);
        option.name = "dual_port_ram_rst_cg";
        ARR_RST: coverpoint arrdata {
            bins data = {0};
            option.at_least = 16;
        }
    endgroup

    covergroup pe_clear_cg with function sample(bit [15:0] pe_o_result);
        option.name = "pe_clear_cg";
        PE_RESULT: coverpoint pe_o_result {
            bins data = {0};
        }
    endgroup

    covergroup ram0_wr_control_data_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram0_wr_control_data_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd0};
            bins addr1 = {4'd2};
            bins addr2 = {4'd3};
            bins addr3 = {4'd5};
            bins addr4 = {4'd6};
            bins addr5 = {4'd8};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
            bins cross5 = binsof(ADDR.addr5) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig5 = binsof(ADDR.addr5) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram1_wr_control_data_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram1_wr_control_data_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd1};
            bins addr1 = {4'd3};
            bins addr2 = {4'd4};
            bins addr3 = {4'd6};
            bins addr4 = {4'd7};
            bins addr5 = {4'd9};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
            bins cross5 = binsof(ADDR.addr5) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig5 = binsof(ADDR.addr5) && binsof(STRB.strb0);
            
        }
    endgroup

    covergroup ram2_wr_control_data_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram2_wr_control_data_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd2};
            bins addr1 = {4'd4};
            bins addr2 = {4'd5};
            bins addr3 = {4'd7};
            bins addr4 = {4'd8};
            bins addr5 = {4'd10};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
            bins cross5 = binsof(ADDR.addr5) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig5 = binsof(ADDR.addr5) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram3_wr_control_data_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram3_wr_control_data_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd3};
            bins addr1 = {4'd5};
            bins addr2 = {4'd6};
            bins addr3 = {4'd8};
            bins addr4 = {4'd9};
            bins addr5 = {4'd11};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
            bins cross5 = binsof(ADDR.addr5) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig5 = binsof(ADDR.addr5) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram4_wr_control_data_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram4_wr_control_data_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd4};
            bins addr1 = {4'd6};
            bins addr2 = {4'd7};
            bins addr3 = {4'd9};
            bins addr4 = {4'd10};
            bins addr5 = {4'd12};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
            bins cross5 = binsof(ADDR.addr5) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig5 = binsof(ADDR.addr5) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram5_wr_control_data_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram5_wr_control_data_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd5};
            bins addr1 = {4'd7};
            bins addr2 = {4'd8};
            bins addr3 = {4'd10};
            bins addr4 = {4'd11};
            bins addr5 = {4'd13};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
            bins cross5 = binsof(ADDR.addr5) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig5 = binsof(ADDR.addr5) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram6_wr_control_data_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram6_wr_control_data_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd6};
            bins addr1 = {4'd8};
            bins addr2 = {4'd9};
            bins addr3 = {4'd11};
            bins addr4 = {4'd12};
            bins addr5 = {4'd14};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
            bins cross5 = binsof(ADDR.addr5) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig5 = binsof(ADDR.addr5) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram7_wr_control_data_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram7_wr_control_data_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd7};
            bins addr1 = {4'd9};
            bins addr2 = {4'd10};
            bins addr3 = {4'd12};
            bins addr4 = {4'd13};
            bins addr5 = {4'd15};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
            bins cross5 = binsof(ADDR.addr5) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig5 = binsof(ADDR.addr5) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram0_wr_control_weight_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram0_wr_control_weight_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd0};
            bins addr1 = {4'd2};
            bins addr2 = {4'd4};
            bins addr3 = {4'd6};
            bins addr4 = {4'd8};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram1_wr_control_weight_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram1_wr_control_weight_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd1};
            bins addr1 = {4'd2};
            bins addr2 = {4'd4};
            bins addr3 = {4'd6};
            bins addr4 = {4'd8};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b10};
            bins strb1 = {2'b11};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram2_wr_control_weight_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram2_wr_control_weight_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd2};
            bins addr1 = {4'd4};
            bins addr2 = {4'd6};
            bins addr3 = {4'd8};
            bins addr4 = {4'd10};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram3_wr_control_weight_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram3_wr_control_weight_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd3};
            bins addr1 = {4'd4};
            bins addr2 = {4'd6};
            bins addr3 = {4'd8};
            bins addr4 = {4'd10};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b10};
            bins strb1 = {2'b11};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram4_wr_control_weight_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram4_wr_control_weight_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd4};
            bins addr1 = {4'd6};
            bins addr2 = {4'd8};
            bins addr3 = {4'd10};
            bins addr4 = {4'd12};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram5_wr_control_weight_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram5_wr_control_weight_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd5};
            bins addr1 = {4'd6};
            bins addr2 = {4'd8};
            bins addr3 = {4'd10};
            bins addr4 = {4'd12};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b10};
            bins strb1 = {2'b11};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram6_wr_control_weight_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram6_wr_control_weight_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd6};
            bins addr1 = {4'd8};
            bins addr2 = {4'd10};
            bins addr3 = {4'd12};
            bins addr4 = {4'd14};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b11};
            bins strb1 = {2'b01};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram7_wr_control_weight_cg with function sample(bit [1:0] wr_strb, bit [3:0] wr_addr);
        option.name = "ram7_wr_control_weight_cg";
        ADDR: coverpoint wr_addr {
            bins addr0 = {4'd7};
            bins addr1 = {4'd8};
            bins addr2 = {4'd10};
            bins addr3 = {4'd12};
            bins addr4 = {4'd14};
        }
        STRB: coverpoint wr_strb {
            bins strb0 = {2'b10};
            bins strb1 = {2'b11};
        }
        CROS: cross ADDR, STRB {
            bins cross0 = binsof(ADDR.addr0) && binsof(STRB.strb0);
            bins cross1 = binsof(ADDR.addr1) && binsof(STRB.strb1);
            bins cross2 = binsof(ADDR.addr2) && binsof(STRB.strb1);
            bins cross3 = binsof(ADDR.addr3) && binsof(STRB.strb1);
            bins cross4 = binsof(ADDR.addr4) && binsof(STRB.strb1);
            ignore_bins ig0 = binsof(ADDR.addr0) && binsof(STRB.strb1);
            ignore_bins ig1 = binsof(ADDR.addr1) && binsof(STRB.strb0);
            ignore_bins ig2 = binsof(ADDR.addr2) && binsof(STRB.strb0);
            ignore_bins ig3 = binsof(ADDR.addr3) && binsof(STRB.strb0);
            ignore_bins ig4 = binsof(ADDR.addr4) && binsof(STRB.strb0);
        }
    endgroup

    covergroup ram_rd_control_cg with function sample(bit [3:0] rd_addr);
        option.name = "ram_rd_control_cg";
        option.per_instance = 1;
        ADDR: coverpoint rd_addr {
            bins addr[] = {[0:15]};
        }
    endgroup

    function new(string name = "npu_cov", uvm_component parent = null);
        super.new(name, parent);
        // Covergroup instances
        dual_port_ram_rst_cg = new();
        pe_clear_cg = new();
        ram0_wr_control_data_cg = new();
        ram1_wr_control_data_cg = new();
        ram2_wr_control_data_cg = new();
        ram3_wr_control_data_cg = new();
        ram4_wr_control_data_cg = new();
        ram5_wr_control_data_cg = new();
        ram6_wr_control_data_cg = new();
        ram7_wr_control_data_cg = new();
        ram0_wr_control_weight_cg = new();
        ram1_wr_control_weight_cg = new();
        ram2_wr_control_weight_cg = new();
        ram3_wr_control_weight_cg = new();
        ram4_wr_control_weight_cg = new();
        ram5_wr_control_weight_cg = new();
        ram6_wr_control_weight_cg = new();
        ram7_wr_control_weight_cg = new();
        ram_rd_control_cg = new();
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // Interface get
        if(!uvm_config_db #(virtual pe_interface)::get(this, "", "pe_vif", pe_vif)) begin
            `uvm_error("build_phase", "Unable to get pe_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual dual_port_ram_mem)::get(this, "", "mem_vif", mem_vif)) begin
            `uvm_error("build_phase", "Unable to get mem from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_data_interface)::get(this, "", "ram0_data_vif", ram0_data_vif)) begin
            `uvm_error("build_phase", "Unable to get ram0_data_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_data_interface)::get(this, "", "ram1_data_vif", ram1_data_vif)) begin
            `uvm_error("build_phase", "Unable to get ram1_data_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_data_interface)::get(this, "", "ram2_data_vif", ram2_data_vif)) begin
            `uvm_error("build_phase", "Unable to get ram2_data_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_data_interface)::get(this, "", "ram3_data_vif", ram3_data_vif)) begin
            `uvm_error("build_phase", "Unable to get ram3_data_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_data_interface)::get(this, "", "ram4_data_vif", ram4_data_vif)) begin
            `uvm_error("build_phase", "Unable to get ram4_data_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_data_interface)::get(this, "", "ram5_data_vif", ram5_data_vif)) begin
            `uvm_error("build_phase", "Unable to get ram5_data_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_data_interface)::get(this, "", "ram6_data_vif", ram6_data_vif)) begin
            `uvm_error("build_phase", "Unable to get ram6_data_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_data_interface)::get(this, "", "ram7_data_vif", ram7_data_vif)) begin
            `uvm_error("build_phase", "Unable to get ram7_data_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_weight_interface)::get(this, "", "ram0_weight_vif", ram0_weight_vif)) begin
            `uvm_error("build_phase", "Unable to get ram0_weight_vif from uvm_config_db")
        end
    
        if(!uvm_config_db #(virtual ram_wr_control_weight_interface)::get(this, "", "ram1_weight_vif", ram1_weight_vif)) begin
            `uvm_error("build_phase", "Unable to get ram1_weight_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_weight_interface)::get(this, "", "ram2_weight_vif", ram2_weight_vif)) begin
            `uvm_error("build_phase", "Unable to get ram2_weight_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_weight_interface)::get(this, "", "ram3_weight_vif", ram3_weight_vif)) begin
            `uvm_error("build_phase", "Unable to get ram3_weight_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_weight_interface)::get(this, "", "ram4_weight_vif", ram4_weight_vif)) begin
            `uvm_error("build_phase", "Unable to get ram4_weight_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_weight_interface)::get(this, "", "ram5_weight_vif", ram5_weight_vif)) begin
            `uvm_error("build_phase", "Unable to get ram5_weight_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_weight_interface)::get(this, "", "ram6_weight_vif", ram6_weight_vif)) begin
            `uvm_error("build_phase", "Unable to get ram6_weight_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_wr_control_weight_interface)::get(this, "", "ram7_weight_vif", ram7_weight_vif)) begin
            `uvm_error("build_phase", "Unable to get ram7_weight_vif from uvm_config_db")
        end

        if(!uvm_config_db #(virtual ram_rd_control_interface)::get(this, "", "ram_rd_vif", ram_rd_vif)) begin
            `uvm_error("build_phase", "Unable to get ram_rd_vif from uvm_config_db")
        end
     endfunction: build_phase

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            dual_port_ram_mem_do_sample(mem_vif);
            pe_interface_do_sample(pe_vif);
            ram_wr_control_data_interface_do_sample(ram0_data_vif, 0);
            ram_wr_control_data_interface_do_sample(ram1_data_vif, 1);
            ram_wr_control_data_interface_do_sample(ram2_data_vif, 2);
            ram_wr_control_data_interface_do_sample(ram3_data_vif, 3);
            ram_wr_control_data_interface_do_sample(ram4_data_vif, 4);
            ram_wr_control_data_interface_do_sample(ram5_data_vif, 5);
            ram_wr_control_data_interface_do_sample(ram6_data_vif, 6);
            ram_wr_control_data_interface_do_sample(ram7_data_vif, 7);
            ram_wr_control_weight_interface_do_sample(ram0_weight_vif, 0);
            ram_wr_control_weight_interface_do_sample(ram1_weight_vif, 1);
            ram_wr_control_weight_interface_do_sample(ram2_weight_vif, 2);
            ram_wr_control_weight_interface_do_sample(ram3_weight_vif, 3);
            ram_wr_control_weight_interface_do_sample(ram4_weight_vif, 4);
            ram_wr_control_weight_interface_do_sample(ram5_weight_vif, 5);
            ram_wr_control_weight_interface_do_sample(ram6_weight_vif, 6);
            ram_wr_control_weight_interface_do_sample(ram7_weight_vif, 7);
            ram_rd_control_interface_do_sample(ram_rd_vif);
        join_none
    endtask

    virtual task dual_port_ram_mem_do_sample(virtual dual_port_ram_mem vif);
      forever begin
        @(vif.cb_mon);
        foreach(vif.mem[i])begin
            dual_port_ram_rst_cg.sample(vif.cb_mon.mem[i]);
        end
      end
    endtask

    virtual task pe_interface_do_sample(virtual pe_interface vif);
      forever begin
        @(vif.cb_mon);
        wait(vif.cb_mon.i_clear == 1'b1);
        @(vif.cb_mon);
        pe_clear_cg.sample(vif.cb_mon.o_result);
      end
    endtask

    virtual task ram_wr_control_data_interface_do_sample(virtual ram_wr_control_data_interface vif, int ramx);
      forever begin
        @(vif.cb_mon);
        if(vif.cb_mon.ram_wr_en);
        begin
            if(ramx == 0)
                ram0_wr_control_data_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 1)
                ram1_wr_control_data_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 2)
                ram2_wr_control_data_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 3)
                ram3_wr_control_data_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 4)
                ram4_wr_control_data_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 5)
                ram5_wr_control_data_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 6)
                ram6_wr_control_data_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else
                ram7_wr_control_data_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
        end
      end
    endtask

    virtual task ram_wr_control_weight_interface_do_sample(virtual ram_wr_control_weight_interface vif, int ramx);
      forever begin
        @(vif.cb_mon);
        if(vif.cb_mon.ram_wr_en);
        begin
            if(ramx == 0)
                ram0_wr_control_weight_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 1)
                ram1_wr_control_weight_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 2)
                ram2_wr_control_weight_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 3)
                ram3_wr_control_weight_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 4)
                ram4_wr_control_weight_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 5)
                ram5_wr_control_weight_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else if(ramx == 6)
                ram6_wr_control_weight_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
            else
                ram7_wr_control_weight_cg.sample(vif.cb_mon.ram_wr_strb, vif.cb_mon.ram_wr_addr);
        end
      end
    endtask

    virtual task ram_rd_control_interface_do_sample(virtual ram_rd_control_interface vif);
      forever begin
        @(vif.cb_mon);
        if(vif.cb_mon.ram_rd_en);
            ram_rd_control_cg.sample(vif.cb_mon.ram_raddr);
      end
    endtask
endclass
