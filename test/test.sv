`include "environment.sv"

program test(intf i_intf);
	environment env;

	initial 
	begin
		env = new(i_intf);
		
		i_intf.rst = 0;
		#1
		i_intf.rst = 1;
		#1
		i_intf.rst = 0;
		env.run();
	end

endprogram
