class driver;

	virtual intf vif;
 
	mailbox gen2driv;

	function new(virtual intf vif,mailbox gen2driv); 
		this.vif = vif;
		this.gen2driv = gen2driv;
	endfunction

	task reset;
		transaction trans;
		vif.rst     <= 0;
		#(vif.reset_duration * 2 * vif.Tc);
		vif.rst     <= 1;
		#(2 * vif.Tc);
		vif.rst     <= 0;
		$display("============= Driver for rst @ %0d ===============", $time);
	endtask

	task main;
		repeat(1) begin
			transaction trans;
			gen2driv.get(trans);

			trans.count	= vif.count;
			trans.out	= vif.out;      
			vif.reset_duration = trans.reset_duration;
			trans.display("Driver");
		end
	endtask
endclass
