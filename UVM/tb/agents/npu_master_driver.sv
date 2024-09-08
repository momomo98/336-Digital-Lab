class npu_master_driver extends uvm_driver #(npu_data_transaction);

	virtual npu_interface     npu_vif;

	npu_data_transaction      d_trans;

	`uvm_component_utils(npu_master_driver)
	
	function new(string name  = "npu_master_driver", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual npu_interface)::get(this, "", "npu_vif", npu_vif))
			`uvm_fatal("npu_master_driver","can not get the the virtual interface")
	endfunction

    task pre_configure_phase(uvm_phase phase);
        super.pre_configure_phase(phase);
        npu_vif.wd_cb.wr_sop_weight <= 1'b0;
        npu_vif.wd_cb.wr_eop_weight <= 1'b0;
        npu_vif.wd_cb.wr_vld_weight <= 1'b0;
        npu_vif.wd_cb.wr_data_weight <= 32'd0;

        npu_vif.dd_cb.wr_sop_data <= 1'b0;
        npu_vif.dd_cb.wr_eop_data <= 1'b0;
        npu_vif.dd_cb.wr_vld_data <= 1'b0;
        npu_vif.dd_cb.wr_data_data <= 32'd0;
    endtask

	task run_phase(uvm_phase phase);
		super.run_phase(phase);
		while(1)begin
			seq_item_port.get_next_item(d_trans);
            if(d_trans.wr_type == 1'b0)
                do_data();
            else
                do_weight();
			seq_item_port.item_done();
		end
	endtask

    task do_data();
        int i, j;
        @(npu_vif.dd_cb);
        for(i=0;i<3;i++)begin
            @(npu_vif.dd_cb);
            npu_vif.wr_sop_data <= 1'b1;
            @(npu_vif.dd_cb);
            npu_vif.dd_cb.wr_sop_data <= 1'b0;
            for(j=0;j<10;j++)begin
                npu_vif.dd_cb.wr_vld_data <= 1'b1;
                npu_vif.dd_cb.wr_data_data <= {d_trans.wr_data_data[j*2+1], d_trans.wr_data_data[j*2]};
                @(npu_vif.dd_cb);
            end
            npu_vif.dd_cb.wr_eop_data <= 1'b1;
            npu_vif.dd_cb.wr_vld_data <= 1'b0;
            npu_vif.dd_cb.wr_data_data <= 32'd0;
            @(npu_vif.dd_cb);
            npu_vif.dd_cb.wr_eop_data <= 1'b0;
            @(npu_vif.dd_cb);
            @(npu_vif.dd_cb);
        end
        @(npu_vif.dd_cb);
    endtask

	task do_weight();
        int j;
        @(npu_vif.wd_cb);
        @(npu_vif.wd_cb);
        npu_vif.wd_cb.wr_sop_weight <= 1'b1;
        @(npu_vif.wd_cb);
        npu_vif.wd_cb.wr_sop_weight <= 1'b0;
        for(j=0;j<36;j++)begin
            npu_vif.wd_cb.wr_vld_weight <= 1'b1;
            npu_vif.wd_cb.wr_data_weight <= {d_trans.wr_data_weight[j*2+1], d_trans.wr_data_weight[j*2]};
            @(npu_vif.wd_cb);
        end
        npu_vif.wd_cb.wr_eop_weight <= 1'b1;
        npu_vif.wd_cb.wr_vld_weight <= 1'b0;
        npu_vif.wd_cb.wr_data_weight <= 32'd0;
        @(npu_vif.wd_cb);
        npu_vif.wd_cb.wr_eop_weight <= 1'b0;
        @(npu_vif.wd_cb);
        @(npu_vif.wd_cb);
        @(npu_vif.wd_cb);
    endtask
endclass

