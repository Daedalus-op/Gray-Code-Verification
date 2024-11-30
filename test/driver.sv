class driver;

	virtual intf vif;
 
	mailbox gen2driv;

	function new(virtual intf vif,mailbox gen2driv); 
		this.vif = vif;
		this.gen2driv = gen2driv;
	endfunction

	task main;
		repeat(1) begin
			transaction trans;
			fork
			begin
				gen2driv.get(trans);

				trans.count	= vif.count;
				trans.out	= vif.out;      
				trans.display("Driver");
			end

			begin
				vif.rst     <= 0;
				#(trans.reset_duration);
				vif.rst     <= 1;
				#1;
				vif.rst     <= 0;
				trans.display("Driver for rst");
			end
			join
		end
	endtask
endclass
