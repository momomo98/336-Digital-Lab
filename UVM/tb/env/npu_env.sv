class npu_env extends uvm_env;

	npu_master_agent           mst_agt;
	npu_slave_agent            slv_agt;
	npu_virtual_sequencer      npu_vir_sqr;

	npu_cov cgm;
	
	`uvm_component_utils(npu_env)

	function new(string name = "npu_env", uvm_component parent);
		super.new(name, parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		npu_vir_sqr = npu_virtual_sequencer::type_id::create("npu_vir_sqr", this);
		mst_agt = npu_master_agent::type_id::create("mst_agt", this);
		slv_agt = npu_slave_agent::type_id::create("slv_agt", this);
		cgm = npu_cov::type_id::create("cgm", this);;
	endfunction

	function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		npu_vir_sqr.npu_mst_sqr = mst_agt.d_sqr;
	endfunction

endclass

