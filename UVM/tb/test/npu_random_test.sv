class npu_random_test extends npu_base_test;
    `uvm_component_utils(npu_random_test)

    npu_sequence npu_seq;

    function new(string name = "npu_random_test", uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    virtual task run_top_virtual_sequence();
        npu_seq = new();
        #1000ns;
        npu_seq.start(env.npu_vir_sqr);
        #1000ns;
      // User to implement this task in the child tests
    endtask
endclass

