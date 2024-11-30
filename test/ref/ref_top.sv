`include "ref_interface.sv"
//`include "ref_test.sv"
module ref_top;
  
  ref_intf i_intf();
  
  ref_test t1(i_intf);
  
  half_adder h1 (
    .a(i_intf.a),
    .b(i_intf.b),
    .s(i_intf.sum),
    .c(i_intf.carry)
   );
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
endmodule
