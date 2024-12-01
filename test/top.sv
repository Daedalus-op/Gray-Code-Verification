`include "interface.sv"
//`include "test.sv"
module tbench_top_gray;

	intf i_intf();

	clock cl(.clk(i_intf.clk), .Tc(i_intf.Tc));

	test t1(i_intf);

	gray_counter c1 (i_intf.out, i_intf.count, i_intf.clk, i_intf.rst);

	initial begin
		$dumpfile("dump.vcd"); $dumpvars;
	end

endmodule

module clock (
	output bit clk,
	input int Tc
	);
	always #(Tc) clk = ~clk;
	initial clk = 0;
endmodule
