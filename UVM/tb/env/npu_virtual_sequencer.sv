class npu_virtual_sequencer extends uvm_sequencer;
	`uvm_component_utils(npu_virtual_sequencer)
	
	npu_master_sequencer npu_mst_sqr;

	function new(string name = "npu_virtual_sequencer", uvm_component parent);
		super.new(name, parent);
	endfunction

endclass
