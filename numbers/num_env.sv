`include "num_agent.sv"
`include "num_scoreboard.sv"

class num_env extends uvm_env; 
  num_agent num_agnt;
  num_scoreboard num_scb;
  
 `uvm_component_utils(num_env)
  
  function new(string name="num_env", uvm_component parent);
    super.new(name, parent);
    endfunction: new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);   
    
    num_agnt = num_agent::type_id::create("num_agnt", this);
    num_scb = num_scoreboard::type_id::create("num_scb", this);    
  endfunction: build_phase
  
  function void connent_phase(uvm_phase phase);
    num_agnt.monitor.item_actual.connect(num_scb.item_actual);      
  endfunction: connent_phase
  
 endclass: num_env