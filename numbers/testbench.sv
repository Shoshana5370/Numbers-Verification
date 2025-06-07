typedef enum {EVEN,ODD,MULT,NONE} num_type;
`include "num_if.sv"
`include "num_base_test.sv"
`include "num_test.sv"

module tb_top;

  bit clk;
  bit reset;

  always #5 clk = ~clk;
  initial begin
    reset = 1;
    #5 reset =0;
  end
  num_if intf(clk,reset);
  
  numbers DUT (
    .clk(clk),
    .rst(reset),
    .dtype(intf.mytype),
    .data_in(intf.data_in),
    .data_out(intf.data_out)
   );
 
  initial begin 
    uvm_config_db#(virtual num_if)::set(uvm_root::get(),"*","vif",intf);
  end
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end 
  initial begin 
    run_test();
  end
  
endmodule