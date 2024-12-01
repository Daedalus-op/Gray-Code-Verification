class monitor;
	
	virtual intf vif;
	mailbox mon_scb;
	
	function new(virtual intf vif,mailbox mon_scb);
		this.vif     = vif;
		this.mon_scb = mon_scb;
	endfunction
	
	task main;
		repeat(1)
			begin
			transaction trans;
			trans 			= new();
			trans.rst		= vif.rst;
			trans.clk		= vif.clk;
			trans.count		= vif.count;
			trans.out		= vif.out;
			mon_scb.put(trans);
			trans.display("Monitor");
		end
	endtask
	
endclass
