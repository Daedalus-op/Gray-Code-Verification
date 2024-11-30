`timescale 1ns/1ps
module gray_counter(input clk, input rst, output reg [2:0] o_o, output [2:0] gray);
    reg [2:0] count;
    always @(posedge clk)
    	bin_counter <= reset ? 3'b000 : bin_counter + 1;
    	assign o_bin = bin_counter;
    	assign o_gray_code = {bin_counter[2], bin_counter[2] ^ bin_counter[1], count[1] ^ count[0]};
endmodule

