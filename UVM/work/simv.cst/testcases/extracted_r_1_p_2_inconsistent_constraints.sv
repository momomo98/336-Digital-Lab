class c_1_2;
    rand bit[15:0] wr_data_weight_0_; // rand_mode = ON 

    constraint weight_cons_this    // (constraint_mode = ON) (<npu_transaction.sv>:17)
    {
       (wr_data_weight_0_ inside {[(-256):256]});
    }
endclass

program p_1_2;
    c_1_2 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001z01x011zzx100x00111x10001z0z0zzxzxzxzxxzzxxxzzxzzzzzxxzxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
