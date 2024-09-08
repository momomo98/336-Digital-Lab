class npu_virtual_sequencer extends uvm_sequencer;
	`uvm_component_utils(npu_virtual_sequencer)
	
	npu_master_sequencer npu_mst_sqr;
	virtual npu_interface npu_vif;

	function new(string name = "npu_virtual_sequencer", uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		if(!uvm_config_db#(virtual npu_interface)::get(this, "", "npu_vif", npu_vif))begin
			`uvm_fatal("npu_virtual_sequencer", "cannot get npu_vif")
		end
	endfunction

endclass
