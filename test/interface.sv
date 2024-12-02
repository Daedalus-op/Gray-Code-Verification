// Interface with Coverage
interface gray_counter_if(input logic clk);
    logic rst;
    logic [2:0] count;
    logic [2:0] gray;
    
    clocking drv_cb @(posedge clk);
        output rst;
        input count;
        input gray;
    endclocking
    
    clocking mon_cb @(posedge clk);
        input rst;
        input count;
        input gray;
    endclocking
    
    covergroup cg @(posedge clk);
        count_cp: coverpoint count {
            bins counts[] = {[0:7]};
        }
        gray_cp: coverpoint gray {
            bins grays[] = {[0:7]};
        }
        rst_cp: coverpoint rst;
        count_x_gray: cross count_cp, gray_cp;
    endgroup

    cg cg_inst;
    
    initial begin
        cg_inst = new();
    end
    
    modport DRV (clocking drv_cb);
    modport MON (clocking mon_cb);
endinterface
