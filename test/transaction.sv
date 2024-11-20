class m_transaction;
    rand int reset_duration;  // Duration to hold the reset signal, in clock cycles

    // Constraint to limit reset duration to a reasonable range
    constraint reset_duration_c { reset_duration inside {[1:10]}; }

    // Function to randomize the transaction values
    function void randomize_transaction();
        if (!this.randomize()) 
            $display("Randomization failed");
    endfunction
endclass
