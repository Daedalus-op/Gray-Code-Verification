`include "ref_transaction.sv"
`include "ref_generator.sv"
`include "ref_driver.sv"
`include "ref_monitor.sv"
`include "ref_scoreboard.sv"

class environment;
  generator 	gen;
  driver    	driv;
  monitor   	mon;
  scoreboard	scb;
  mailbox m1;
  mailbox m2;

  virtual ref_intf vif;
  function new(virtual ref_intf vif);
    this.vif = vif;
    m1   = new();
    m2   = new();
    gen  = new(m1);
    driv = new(vif,m1);
    mon  = new(vif,m2);
    scb  = new(m2);
  endfunction
  
  task test();
    fork 
      gen.main();
      driv.main();
      mon.main();
      scb.main();
    join
  endtask

  
  task run;
    test();
    $finish;
  endtask
  
endclass
