`include "num_env.sv"
class num_base_test extends uvm_test;

  `uvm_component_utils(num_base_test)
  
  num_env env;

  function new(string name = "num_base_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = num_env::type_id::create("env", this);
  endfunction : build_phase

endclass :num_base_test