// Generator
class generator;
    mailbox #(transaction) gen2drv;
    mailbox #(transaction) gen2scb;
    event ended;
    int num_transactions;
    bit [31:0] seed;
    
    function new(mailbox #(transaction) gen2drv, mailbox #(transaction) gen2scb);
        this.gen2drv = gen2drv;
        this.gen2scb = gen2scb;
        seed = $urandom;
    endfunction
    
    task main();
        transaction trans;
        repeat(num_transactions) begin
            trans = new();
            if(!trans.randomize() with {seed == this.seed;}) $fatal("Randomization failed");
            gen2drv.put(trans.copy());
            gen2scb.put(trans.copy());
            trans.display("GEN");
            #5;
        end
        -> ended;
    endtask
endclass
