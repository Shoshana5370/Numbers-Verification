class num_monitor extends uvm_monitor;
   virtual num_if vif;
   uvm_analysis_port #(num_seq_item) item_actual;
   num_seq_item trans_collected;
  `uvm_component_utils(num_monitor)
 
  
  function new (string name="num_monitor", uvm_component parent);
    super.new(name, parent);
    trans_collected=new();
    item_actual = new("item_actual", this);
  endfunction : new  
 
    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
        if(!uvm_config_db#(virtual num_if)::get(this, "", "vif", vif))
         `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
    endfunction: build_phase
  
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      trans_collected=new();
      #2ns;
      trans_collected.data_out=vif.data_out;
      trans_collected.mytype=vif.mytype;
      item_actual.write(trans_collected);
    end
  endtask:run_phase

endclass : num_monitor   