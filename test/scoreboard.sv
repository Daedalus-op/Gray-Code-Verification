// Scoreboard
class scoreboard;
    mailbox #(transaction) mon2scb;
    mailbox #(transaction) gen2scb;
    int pass_count, fail_count;
    event scb_done;
    
    function new(mailbox #(transaction) mon2scb, mailbox #(transaction) gen2scb);
        this.mon2scb = mon2scb;
        this.gen2scb = gen2scb;
        pass_count = 0;
        fail_count = 0;
    endfunction
    
    task main();
        transaction rcv_trans, exp_trans;
        bit [2:0] expected_gray;
        forever begin
            mon2scb.get(rcv_trans);
            gen2scb.get(exp_trans);
            
            expected_gray = exp_trans.compute_expected_gray();
            
            if(rcv_trans.gray_code === expected_gray) begin
                pass_count++;
                $display("[SCB-PASS] Exp=%b Act=%b", expected_gray, rcv_trans.gray_code);
            end else begin
                fail_count++;
                $error("[SCB-FAIL] Exp=%b Act=%b", expected_gray, rcv_trans.gray_code);
            end
            -> scb_done;
        end
    endtask
    
    function void report();
        $display("\n=== Test Summary ===");
        $display("Total Tests: %0d", pass_count + fail_count);
        $display("Passed: %0d", pass_count);
        $display("Failed: %0d", fail_count);
        $display("Pass Rate: %0.2f%%", (pass_count * 100.0) / (pass_count + fail_count));
        $display("==================\n");
    endfunction
endclass
