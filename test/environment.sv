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
			$display("============= Generating @ %0d =============", $time);
			fork
				gen.main();
				driv.main();
			join
	endtask
	
	task test();
			$display("=============== Testing @ %0d ===============", $time);
			fork
				mon.main();
				scb.main();
			join
	endtask

	
	task run;
		driv.reset;
		gener();
		fork
			repeat(7) begin
				test();
				#(2* vif.Tc);
			end
			driv.reset;
		join
	endtask
	
endclass
