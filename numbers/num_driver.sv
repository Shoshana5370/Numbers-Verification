class num_driver extends uvm_driver #(num_seq_item);
  
  `uvm_component_utils(num_driver)
  
  function new (string name="num_driver", uvm_component parent);
    super.new(name, parent);
  endfunction 
  
  virtual num_if vif;
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
     if(!uvm_config_db#(virtual num_if)::get(this, "", "vif", vif))
       `uvm_fatal("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"});
  endfunction: build_phase
  
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done(req);
    end
  endtask : run_phase
  
  virtual task drive();
          @(posedge vif.clk);
         vif.mytype=req.mytype;
         vif.data_in=req.data_in;
  
  
  endtask:drive
  
endclass: num_driver