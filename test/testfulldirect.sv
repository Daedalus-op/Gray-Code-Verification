`timescale 1ns/1ps

module gray_counter_tb;
    reg clk, rst;
    wire [2:0] o_o, gray;
    
    // Instantiate the gray counter
    gray_counter dut (
        .clk(clk),
        .rst(rst),
        .o_o(o_o),
        .gray(gray)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test stimulus
    initial begin
        // Initialize waveform dump
        $dumpfile("gray_counter_tb.vcd");
        $dumpvars(0, gray_counter_tb);
        
        // Reset test
        rst = 1;
        #20;
        rst = 0;
        
        // Run for 8 clock cycles to observe full counting sequence
        #80;
        
        // Apply reset again
        rst = 1;
        #10;
        rst = 0;
        #30;
        
        $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0t rst=%b binary=%b gray=%b", 
                 $time, rst, o_o, gray);
    end
endmodule
