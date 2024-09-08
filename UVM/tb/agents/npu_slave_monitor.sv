class npu_slave_monitor extends uvm_monitor #(npu_data_transaction);

    virtual npu_interface npu_vif;
    `uvm_component_utils(npu_slave_monitor)

    function new(string name = "npu_slave_monitor", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual npu_interface)::get(this, "", "npu_vif", npu_vif))
            `uvm_fatal("npu_slave_monitor", "can not get the virtual interface")
    endfunction

    task pre_configure_phase(uvm_phase phase);
        super.pre_configure_phase(phase);
        npu_vif.rm_cb.rd_sop_0 <= 1'b0;
        npu_vif.rm_cb.rd_sop_1 <= 1'b0;
        npu_vif.rm_cb.rd_sop_2 <= 1'b0;
        npu_vif.rm_cb.rd_sop_3 <= 1'b0;
        npu_vif.rm_cb.rd_sop_4 <= 1'b0;
        npu_vif.rm_cb.rd_sop_5 <= 1'b0;
        npu_vif.rm_cb.rd_sop_6 <= 1'b0;
        npu_vif.rm_cb.rd_sop_7 <= 1'b0;
    endtask

    task run_phase(uvm_phase phase);
        forever begin
            @(npu_vif.rm_cb);
            if(npu_vif.rm_cb.save_finish)
            begin
                read_data();
                wait(!npu_vif.rm_cb.save_finish);
            end
        end
    endtask

    task read_data();
        @(npu_vif.rm_cb);
        npu_vif.rm_cb.rd_sop_0 <= 1'b1;
        npu_vif.rm_cb.rd_sop_1 <= 1'b1;
        npu_vif.rm_cb.rd_sop_2 <= 1'b1;
        npu_vif.rm_cb.rd_sop_3 <= 1'b1;
        npu_vif.rm_cb.rd_sop_4 <= 1'b1;
        npu_vif.rm_cb.rd_sop_5 <= 1'b1;
        npu_vif.rm_cb.rd_sop_6 <= 1'b1;
        npu_vif.rm_cb.rd_sop_7 <= 1'b1;
        @(npu_vif.rm_cb);
        npu_vif.rm_cb.rd_sop_0 <= 1'b0;
        npu_vif.rm_cb.rd_sop_1 <= 1'b0;
        npu_vif.rm_cb.rd_sop_2 <= 1'b0;
        npu_vif.rm_cb.rd_sop_3 <= 1'b0;
        npu_vif.rm_cb.rd_sop_4 <= 1'b0;
        npu_vif.rm_cb.rd_sop_5 <= 1'b0;
        npu_vif.rm_cb.rd_sop_6 <= 1'b0;
        npu_vif.rm_cb.rd_sop_7 <= 1'b0;
    endtask

endclass