// Driver
class driver;
    virtual gray_counter_if.DRV vif;
    mailbox #(transaction) gen2drv;
    event drv_done;
    
    function new(virtual gray_counter_if.DRV vif, mailbox #(transaction) gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction
    
    task reset_dut(input int duration);
        vif.drv_cb.rst <= 1;
        repeat(duration) @(posedge vif.clk);
        vif.drv_cb.rst <= 0;
    endtask
    
    task main();
        transaction trans;
        forever begin
            gen2drv.get(trans);
            reset_dut(trans.reset_duration);
            trans.display("DRV");
            -> drv_done;
            @(posedge vif.clk);
        end
    endtask
endclass
