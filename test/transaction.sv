class transaction;
	rand int reset_duration;	// Duration to release the reset signal

	logic [2:0] out, count;
	logic rst, clk;

	// Constraint to limit reset duration to a reasonable range
	constraint reset_duration_c { reset_duration inside {[1:10]}; }

	// Function to randomize the transaction values
	function void randomize_transaction();
		if (!this.randomize())
			$display("Randomization failed");
	endfunction

	function void display(string name);
		$display("-------------------------");
		$display(" %s ",name);
		$display("-------------------------");
		$display("reset_duration = %0d", reset_duration);
		$display("count = %b, out = %b", count, out);
		$display("-------------------------");
	endfunction
endclass
