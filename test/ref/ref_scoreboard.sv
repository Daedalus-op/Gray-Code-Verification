class ref_scoreboard;
  
  mailbox mon2scb;
  
  
  
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  task main;
    ref_transaction trans;
    repeat(1)
      begin
      mon2scb.get(trans);
        
        if(((trans.a ^ trans.b) == trans.sum)  && ((trans.a & trans.b) == trans.carry))
          $display("Result is as Expected");
        else
          $error("Wrong Result");
           
         trans.display("Scoreboard");
    end
  endtask
  
endclass
