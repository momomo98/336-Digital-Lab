class npu_master_agent extends uvm_agent;
	
	npu_master_driver            d_drv;
	npu_master_sequencer         d_sqr;
	
	`uvm_component_utils(npu_master_agent)
	
	function new(string name = "npu_master_agent", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		d_drv = npu_master_driver::type_id::create("d_drv", this);
		d_sqr = npu_master_sequencer::type_id::create("d_sqr", this);
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		d_drv.seq_item_port.connect(d_sqr.seq_item_export);
	endfunction

endclass
