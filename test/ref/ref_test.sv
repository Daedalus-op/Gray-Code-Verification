`include "ref_environment.sv"

program ref_test(ref_intf i_intf);
  environment env;
  
  initial 
    begin
     env = new(i_intf);
     env.run();
    end

endprogram
