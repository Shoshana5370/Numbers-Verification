`uvm_analysis_imp_decl(_act_num)
`uvm_analysis_imp_decl(_exp_num)

class num_scoreboard extends uvm_scoreboard;
  
   num_seq_item pkt_act[$];
   num_seq_item pkt_exp[$];  
   uvm_analysis_imp_act_num#(num_seq_item, num_scoreboard) item_actual;  
   uvm_analysis_imp_exp_num#(num_seq_item, num_scoreboard) item_expected;

  `uvm_component_utils(num_scoreboard)
  
   function new (string name="num_scoreboard", uvm_component parent);
      super.new(name, parent);
   endfunction : new
  
   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     item_actual = new("item_actual", this);
     item_expected = new("item_expected", this);

   endfunction: build_phase
  
  virtual function void write_act_num(num_seq_item pkt_act_num);
     pkt_act.push_back(pkt_act_num);
     pkt_act_num.print();
     foreach(pkt_act[i])
          `uvm_info(get_type_name(),$sformatf("pkt_actpkt_act %h",pkt_act[i].data_out),UVM_LOW)
   endfunction : write_act_num
         
       
       virtual function void write_exp_num(num_seq_item pkt_exp_num);
       case (pkt_exp_num.mytype)
        'b00:begin
          pkt_exp_num.data_out <= pkt_exp_num.data_in / 2;
        end
        'b01: begin
          pkt_exp_num.data_out <= pkt_exp_num.data_in + 10;
        end
        'b10: begin
        pkt_exp_num.data_out <= pkt_exp_num.data_in / 5;
        end
        'b11: begin
          pkt_exp_num.data_out <= pkt_exp_num.data_in;
        end
      endcase
      pkt_exp_num.print();
    foreach(pkt_exp[i])
      `uvm_info(get_type_name(),$sformatf("pkt_actpkt_act %h",pkt_exp[i].data_out),UVM_LOW)
   endfunction : write_exp_num
      
   virtual task run_phase(uvm_phase phase);
   endtask : run_phase
 
endclass : num_scoreboard