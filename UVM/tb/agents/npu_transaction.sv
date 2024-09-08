class npu_data_transaction extends uvm_sequence_item;

	rand bit [15:0]  wr_data_weight [0:71];
    rand bit [15:0]  wr_data_data [0:71];
    rand bit         wr_type;

	function new(string name = "npu_data_transaction");
		super.new(name);
	endfunction
	
	`uvm_object_utils_begin(npu_data_transaction)
		`uvm_field_sarray_int(wr_data_weight, UVM_ALL_ON)
        `uvm_field_sarray_int(wr_data_data, UVM_ALL_ON)
        `uvm_field_int(wr_type, UVM_ALL_ON)
	`uvm_object_utils_end
	
	constraint weight_cons{
		foreach(wr_data_weight[i])
			shortint'(wr_data_weight[i]) inside{[-256:256]};
	};

	constraint data_cons{
		foreach(wr_data_data[i])
			shortint'(wr_data_data[i]) inside{[-256:256]};
	};
endclass