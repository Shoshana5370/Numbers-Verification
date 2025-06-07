class num_test extends num_base_test; 
 
  `uvm_component_utils(num_test)
   uvm_analysis_port #(num_seq_item) item_expected ;
   num_rand_sequence num_rand_seq;
  
  function new(string name = "num_test",uvm_component parent=null);
    super.new(name,parent);
  endfunction : new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    num_rand_seq = num_rand_sequence::type_id::create("num_rand_seq");
    item_expected = new("item_expected", this);
  endfunction: build_phase
  
  
 
   function void connect_phase(uvm_phase phase);
    item_expected.connect(env.num_scb.item_expected);
  endfunction: connect_phase
  
   task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info(get_type_name(),$sformatf("****test"),UVM_LOW)
     #3ns
     repeat(6)begin
     num_rand_seq.start(env.num_agnt.sequencer);  
     end
     phase.drop_objection(this);
    endtask : run_phase
      
endclass: num_test