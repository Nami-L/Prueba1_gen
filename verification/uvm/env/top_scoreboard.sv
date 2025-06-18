`ifndef TOP_SCOREBOARD_SV
`define TOP_SCOREBOARD_SV

class top_scoreboard extends uvm_scoreboard;

  `uvm_component_utils(top_scoreboard)
  `uvm_analysis_imp_decl(_adder)
  uvm_analysis_imp_adder #(adder_uvc_sequence_item, top_scoreboard) adder_imp_export;

  int unsigned m_num_passed;
  int unsigned m_num_failed;
  adder_uvc_sequence_item m_adder_queue[$];


  extern function new(string name, uvm_component parent);
  extern function void build_phase(uvm_phase phase);
  extern function void report_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern function void write_adder(input adder_uvc_sequence_item t);

endclass : top_scoreboard


function top_scoreboard::new(string name, uvm_component parent);
  super.new(name, parent);
  m_num_passed = 0;
  m_num_failed = 0;
endfunction : new

function void top_scoreboard::build_phase(uvm_phase phase);
  adder_imp_export = new("adder_imp_export", this);
endfunction : build_phase

function void top_scoreboard::write_adder(input adder_uvc_sequence_item t);
  adder_uvc_sequence_item received_trans;
  received_trans = adder_uvc_sequence_item::type_id::create("received_trans");
  received_trans.do_copy(t);
  m_adder_queue.push_back(received_trans);
endfunction : write_adder

task top_scoreboard::run_phase(uvm_phase phase);

endtask : run_phase





function void top_scoreboard::report_phase(uvm_phase phase);

  `uvm_info(get_type_name(), $sformatf("PASSED = %3d, FAILED = %3d", m_num_passed, m_num_failed),
            UVM_DEBUG)

endfunction : report_phase

`endif  // TOP_SCOREBOARD_SV
