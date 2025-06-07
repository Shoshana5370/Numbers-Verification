class num_seq_item extends uvm_sequence_item;
  rand num_type mytype;
  rand bit [15:0] data_in;
  bit [15:0] data_out;
  
  `uvm_object_utils_begin(num_seq_item)
  `uvm_field_int(mytype,UVM_ALL_ON)
  `uvm_field_int(data_in,UVM_ALL_ON)
  `uvm_field_int(data_out,UVM_ALL_ON)
  `uvm_object_utils_end

  function new(string name="num_seq_item");
    super.new(name);
  endfunction:new
  
  constraint even {mytype==EVEN->data_in%10!=0&&data_in%2==0;
                   solve mytype before data_in;};
  constraint odd {mytype==ODD->data_in%2!=0;
                  solve mytype before data_in; };
  constraint mult10 {mytype==MULT->data_in%10==0;
                     solve mytype before data_in; };
  
endclass 
  
  
  
  
  
  
  
  