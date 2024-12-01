`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
	generator 	gen;
	driver    	driv;
	monitor   	mon;
	scoreboard	scb;
	mailbox 		m1;
	mailbox 		m2;

	virtual intf vif;
	function new(virtual intf vif);
		this.vif = vif;
		m1   = new();
		m2   = new();
		gen  = new(m1);
		driv = new(vif,m1);
		mon  = new(vif,m2);
		scb  = new(m2);
	endfunction
	
	task gener();
		fork 
			$display("============= Generating =============");
			gen.main();
			driv.main();
		join
	endtask
	
	task test();
		fork
			$display("=============== Testing @ %0d ===============", $time);
			mon.main();
			scb.main();
		join
	endtask

	
	task run;
		gener();
		repeat(4) begin
			#2;
			test();
		end
		$finish;
	endtask
	
endclass
