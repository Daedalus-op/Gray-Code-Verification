`include "interface.sv"
`include "test.sv"
// Top
module tb_top;
    bit clk;
    
    always #5 clk = ~clk;
    
    gray_counter_if vif(clk);
    
    gray_counter dut (
        .clk(clk),
        .rst(vif.rst),
        .o_o(vif.count),
        .gray(vif.gray)
    );
    
    initial begin
        test t1;
        $timeformat(-9, 2, " ns");
        t1 = new(vif);
        t1.run();
        #100 $finish;
    end
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule