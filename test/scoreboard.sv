class scoreboard;
	mailbox mon_scb;

	function new(mailbox mon_scb);
		this.mon_scb = mon_scb;
	endfunction

	task main;
		transaction trans;
		repeat(1)
		begin
			mon_scb.get(trans);

			if(trans.out == {trans.count[2], trans.count[2] ^ trans.count[1], trans.count[1] ^ trans.count[0]})
				$display("Result is correct");
			else if (trans.rst == 1 && trans.out == 0)
				$display("Result is correct");
			else
				$error("Wrong result");

			trans.display("Scoreboard");
		end
	endtask
endclass
