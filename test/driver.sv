class driver;

	virtual intf vif;
 
	mailbox gen2driv;

	function new(virtual intf vif,mailbox gen2driv); 
		this.vif = vif;
		this.gen2driv = gen2driv;
	endfunction

	task main;

	repeat(1) 
	begin
		transaction trans;

		gen2driv.get(trans);

		vif.clk     <= trans.clk;
		vif.rst     <= trans.rst;

		trans.count	= vif.count;
		trans.out	= vif.out;      
		trans.display("Driver");

		//#(trans.reset_duration);
		//vif.rst     <= trans.rst;

	end
	endtask

endclass
