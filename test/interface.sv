interface intf();

	logic rst;
	logic clk;
	logic [2:0] count;
	logic [2:0] out;
	int reset_duration, Tc = 1; // Clock Duration

endinterface
