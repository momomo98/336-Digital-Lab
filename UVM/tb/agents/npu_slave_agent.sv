class npu_slave_agent extends uvm_agent;
	
	npu_slave_monitor            s_mon;
	
	`uvm_component_utils(npu_slave_agent)
	
	function new(string name = "npu_slave_agent", uvm_component parent);
		super.new(name, parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		s_mon = npu_slave_monitor::type_id::create("s_mon", this);
	endfunction

endclass