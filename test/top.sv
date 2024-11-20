`include "interface.sv"
//`include "test.sv"
module tbench_top_gray;

	intf i_intf();

	clock cl(.clk(i_intf.clk));

	test t1(i_intf);

	gray_counter c1 (
		.clk(i_intf.clk),
		.rst(i_intf.rst),
		.out(i_intf.out),
		.count(i_intf.count)
	 );

	initial begin
		$dumpfile("dump.vcd"); $dumpvars;
	end

endmodule

module clock (
	output bit clk
	);
	always clk = ~clk;
	initial #100 $finish();
endmodule
