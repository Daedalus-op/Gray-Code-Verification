program tb_gray_counter;
    logic clk;
    logic rstn;
  logic [2:0] gray_out;

    // Instantiate the Gray code counter
    gray_counter uut (
        .clk(clk),
        .rstn(rstn),
        .gray_out(gray_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // Toggle clock every 10 time units
    end

    initial begin
        rstn = 0; // Assert reset
        #15;
        rstn = 1; // Deassert reset
        
        // Monitor output
        $monitor("Time: %0t, Gray Code Output: %b", $time, gray_out);
        
        // Run for some time and then finish simulation
        #200;
        $finish;
    end
endprogram
