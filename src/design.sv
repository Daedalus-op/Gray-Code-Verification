`timescale 1ns/1ps
module gray_counter (
    input clk, 
    input rst, 
    output reg [2:0] o_o, // Binary counter output
    output [2:0] gray     // Gray code output
);
    reg [2:0] bun; // Internal binary counter

    // Binary counter logic
    always @(posedge clk) begin
        if (rst)
            bun <= 3'b000; // Reset counter
        else
            bun <= bun + 1; // Increment counter
    end

    // Assign the binary counter to `o_o`
    always @(posedge clk) begin
        o_o <= bun;
    end

    // Gray code conversion
    assign gray = {bun[2], bun[2] ^ bun[1], bun[1] ^ bun[0]};
endmodule
