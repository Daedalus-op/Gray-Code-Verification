// Monitor
class monitor;
    virtual gray_counter_if.MON vif;
    mailbox #(transaction) mon2scb;
    event mon_done;
    
    function new(virtual gray_counter_if.MON vif, mailbox #(transaction) mon2scb);
        this.vif = vif;
        this.mon2scb = mon2scb;
    endfunction
    
    task main();
        transaction trans;
        forever begin
            trans = new();
            @(vif.mon_cb);
            trans.count = vif.mon_cb.count;
            trans.gray_code = vif.mon_cb.gray;
            trans.rst = vif.mon_cb.rst;
            mon2scb.put(trans);
            trans.display("MON");
            -> mon_done;
        end
    endtask
endclass
