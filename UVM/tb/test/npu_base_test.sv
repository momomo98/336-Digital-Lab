  class npu_base_test extends uvm_test;

    `uvm_component_utils(npu_base_test)

    npu_env env;

    function new(string name = "npu_base_test", uvm_component parent);
      super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      env = npu_env::type_id::create("env", this);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
      super.end_of_elaboration_phase(phase);
      uvm_root::get().set_report_verbosity_level_hier(UVM_HIGH);
      uvm_root::get().set_report_max_quit_count(1);
      uvm_root::get().set_timeout(10ms);
    endfunction

    task run_phase(uvm_phase phase);
      // NOTE:: raise objection to prevent simulation stopping
      phase.raise_objection(this);
      this.run_top_virtual_sequence();
      // NOTE:: drop objection to request simulation stopping
      phase.drop_objection(this);
    endtask

    virtual task run_top_virtual_sequence();
      // User to implement this task in the child tests
    endtask
  endclass: npu_base_test