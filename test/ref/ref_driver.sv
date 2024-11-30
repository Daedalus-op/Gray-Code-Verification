class ref_driver;
  
  virtual ref_intf vif;
  
  mailbox gen2driv;
  
  function new(virtual ref_intf vif,mailbox gen2driv); 
    this.vif = vif;
    this.gen2driv = gen2driv;
  endfunction
  
  task main;
    
    repeat(1) 
      begin
        ref_transaction trans;
      
        gen2driv.get(trans);
       
        vif.a     <= trans.a;
        vif.b     <= trans.b;
      
        
        trans.sum     = vif.sum;
        trans.carry   = vif.carry;      
        trans.display("Driver");
        
    end
  endtask
  
endclass
