module gray_counter (
	output logic [3:0] out,
	output logic [3:0] count,
	input logic clk,
	input logic rst
);
	logic [3:0] cnt;

	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			cnt <= 4'b0000;
		end else begin
			cnt <= cnt + 1;
		end
	end

	// Convert binary count to Gray code
	assign out = {cnt[3], cnt[3:1] ^ cnt[2:0]};
	assign count = cnt;
endmodule
