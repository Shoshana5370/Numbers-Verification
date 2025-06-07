class num_rand_sequence extends uvm_sequence #(num_seq_item); 
  `uvm_object_utils(num_rand_sequence)
   uvm_analysis_port #(num_seq_item) item_expected;
  
  function new(string name = "num_rand_sequence");
    super.new(name);

  endfunction
    virtual task body();
  `uvm_do(req)
    endtask
endclass

class num_odd_sequence extends uvm_sequence #(num_seq_item);  
  `uvm_object_utils(num_odd_sequence)
  function new(string name = "num_odd_sequence");
    super.new(name);
  endfunction
  virtual task body();
    `uvm_do_with(req,{req.mytype==1;})
  endtask
endclass

class num_even_sequence extends uvm_sequence #(num_seq_item);  
  `uvm_object_utils(num_even_sequence)
  function new(string name = "num_even_sequence");
    super.new(name);
  endfunction
  virtual task body();
    `uvm_do_with(req,{req.mytype==1;})
  endtask
endclass