`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "transaction.sv"
// Environment
class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard scb;
    
    mailbox #(transaction) gen2drv;
    mailbox #(transaction) gen2scb;
    mailbox #(transaction) mon2scb;
    
    virtual gray_counter_if vif;
    event test_done;
    
    function new(virtual gray_counter_if vif);
        this.vif = vif;
        gen2drv = new(1);
        gen2scb = new(1);
        mon2scb = new(1);
        
        gen = new(gen2drv, gen2scb);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2scb);
        scb = new(mon2scb, gen2scb);
    endfunction
    
    task pre_test();
        drv.reset_dut(5);
    endtask
    
    task test();
        fork
            gen.main();
            drv.main();
            mon.main();
            scb.main();
        join_any
    endtask
    
    task post_test();
        wait(gen.ended.triggered);
        wait(gen.num_transactions == scb.pass_count + scb.fail_count);
        -> test_done;
    endtask
    
    task run();
        pre_test();
        test();
        post_test();
        scb.report();
    endtask
endclass
