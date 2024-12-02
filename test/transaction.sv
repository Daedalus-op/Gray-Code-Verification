// Transaction Class
class transaction;
    rand int reset_duration;
    rand bit reset_type;
    logic [2:0] count, out, gray_code;
    logic rst;
    
    constraint reset_type_dist { reset_type dist {0:=80, 1:=20}; }
    constraint reset_duration_c { 
        reset_duration inside {[1:10]}; 
        if (reset_type == 0) reset_duration inside {[1:3]};
        else reset_duration inside {[4:10]};
    }
    constraint valid_count_c { count inside {[0:7]}; }
    
    function transaction copy();
        copy = new();
        copy.reset_duration = this.reset_duration;
        copy.reset_type = this.reset_type;
        copy.count = this.count;
        copy.out = this.out;
        copy.gray_code = this.gray_code;
        copy.rst = this.rst;
        return copy;
    endfunction

    function bit [2:0] compute_expected_gray();
        return {count[2], count[2] ^ count[1], count[1] ^ count[0]};
    endfunction
    
    function void display(string tag = "TRANS");
        $display("[%0t][%s] rst_type=%0d dur=%0d count=%b gray=%b", 
                 $time, tag, reset_type, reset_duration, count, gray_code);
    endfunction
endclass