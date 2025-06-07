`include "num_seq_item.sv"
`include "num_sequencer.sv"
`include "num_sequence.sv"
`include "num_driver.sv"
`include "num_monitor.sv"
class num_agent extends uvm_agent;
  num_driver    driver;
  num_sequencer sequencer;
  num_monitor   monitor;
  
  `uvm_component_utils(num_agent)
  
  function new (string name="num_agent", uvm_component parent);
    super.new(name, parent);
  endfunction : new

   function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if(get_is_active() == UVM_ACTIVE) begin
      driver = num_driver::type_id::create("driver", this);
      sequencer = num_sequencer::type_id::create("sequencer", this);
    end

    monitor = num_monitor::type_id::create("monitor", this);
  endfunction : build_phase
  
    function void connect_phase(uvm_phase phase);
    if(get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);      
    end
  endfunction : connect_phase
  
endclass : num_agent