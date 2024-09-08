class npu_virtual_seq extends uvm_sequence #(uvm_sequence_item);

	`uvm_object_utils(npu_virtual_seq)
	`uvm_declare_p_sequencer(npu_virtual_sequencer)

	function new(string name = "npu_virtual_seq");
		super.new(name);
	endfunction

	virtual task body();
	endtask

endclass
