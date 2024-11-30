module gray_counter(
	output reg [2:0] gray,
	output reg [2:0] o_o,
	input clk,
	input rst
	);
	always @(posedge clk, posedge rst) begin
		if ( rst == 1 ) begin
			gray = 0;
			o_o = 0;
		end
		else begin
			o_o++;
			gray = {o_o[2], o_o[2] ^ o_o[1], o_o[1] ^ o_o[0]};
		end
	end
endmodule

    // Assign the binary counter to `o_o`
    always @(posedge clk) begin
        o_o <= bun;
    end

    // Gray code conversion
    assign gray = {bun[2], bun[2] ^ bun[1], bun[1] ^ bun[0]};
endmodule
