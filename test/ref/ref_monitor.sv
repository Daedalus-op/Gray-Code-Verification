class ref_monitor;
  
  virtual ref_intf vif;
  mailbox mon2scb;
  
  function new(virtual ref_intf vif,mailbox mon2scb);
    this.vif     = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  task main;
    repeat(1)
      #3;
      begin
      ref_transaction trans;
      trans = new();
      trans.a       = vif.a;
      trans.b       = vif.b;
      trans.sum     = vif.sum;
      trans.carry   = vif.carry;
      mon2scb.put(trans);
      trans.display("Monitor");
    end
  endtask
  
endclass
