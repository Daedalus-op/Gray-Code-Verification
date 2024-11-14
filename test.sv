module tb_gray_counter;
    logic clk;
    logic rstn;
    logic [3:0] out;

    // Instantiate the gray counter
    gray_counter uut (
        .clk(clk),
        .rstn(rstn),
        .out(out)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 50 MHz clock
    end

    // Test sequence
    initial begin
        // Initialize reset
        rstn = 0; 
        #15; // Wait for a few clock cycles
        rstn = 1; // Release reset

        // Monitor output changes
        $monitor("Time=%0t | rstn=%b | Gray Code Output=0x%0h", $time, rstn, out);

        // Run for several cycles to observe Gray code counting
        repeat(16) @(posedge clk); // Run for 16 clock cycles

        $finish; // End simulation
    end
endmodule
