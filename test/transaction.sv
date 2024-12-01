class transaction;
	rand int reset_duration;	// Duration to release the reset signal

	logic [2:0] out, count;
	logic rst, clk;

	// Constraint to limit reset duration to a reasonable range
	constraint reset_duration_c { reset_duration inside {[2:7]}; }

	// Function to randomize the transaction values
	function void randomize_transaction();
		if (!this.randomize())
			$display("Randomization failed");
	endfunction

	function void display(string name);
		$display("\n %s -------------------",name);
		$display("reset_duration = %0d", reset_duration);
		$display("count = %0d, out = %b", count, out);
		$display("-------------------------");
	endfunction
endclass
