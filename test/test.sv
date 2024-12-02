`include "environment.sv"

// Test
class test;
    environment env;
    
    function new(virtual gray_counter_if vif);
        env = new(vif);
    endfunction
    
    task run();
        env.gen.num_transactions = 100;
        env.run();
    endtask
endclass