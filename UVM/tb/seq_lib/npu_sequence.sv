class npu_sequence extends npu_virtual_seq #(npu_data_transaction);

    `uvm_object_utils(npu_sequence)
    
    function new(string name = "npu_sequence");
        super.new(name);
    endfunction

    task body();
        send_trans();
    endtask

    task send_trans();
        npu_data_transaction tr;
        `uvm_do_on_with(tr, p_sequencer.npu_mst_sqr, {wr_type == 1'b0;});
        `uvm_do_on_with(tr, p_sequencer.npu_mst_sqr, {wr_type == 1'b1;});
        @(negedge p_sequencer.npu_vif.save_finish);
        #200ns;
        `uvm_do_on_with(tr, p_sequencer.npu_mst_sqr, {wr_type == 1'b1;});
        `uvm_do_on_with(tr, p_sequencer.npu_mst_sqr, {wr_type == 1'b0;});
    endtask
endclass

