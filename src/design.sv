module gray_counter (
    input logic clk,
    input logic rstn,
    output logic [3:0] out
);
    logic [3:0] count;

    always_ff @(posedge clk or posedge rstn) begin
        if (rstn) begin
            count <= 4'b0000;
        end else begin
            count <= count + 1;
        end
    end

    // Convert binary count to Gray code
    assign out = {count[3], count[3:1] ^ count[2:0]};
endmodule
