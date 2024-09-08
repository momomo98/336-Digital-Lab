class npu_master_sequencer extends uvm_sequencer #(npu_data_transaction);

	`uvm_component_utils(npu_master_sequencer)
	
	function new(string name = "npu_master_sequencer", uvm_component parent);
		super.new(name, parent);
	endfunction
	
endclass