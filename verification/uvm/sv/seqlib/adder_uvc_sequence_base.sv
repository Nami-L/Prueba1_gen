`ifndef ADDER_UVC_SEQUENCE_BASE_SV
`define ADDER_UVC_SEQUENCE_BASE_SV

class adder_uvc_sequence_base extends uvm_sequence #(adder_uvc_sequence_item);
  `uvm_object_utils(adder_uvc_sequence_base)

  rand adder_uvc_sequence_item m_trans;


  extern function new(string name = "");

  extern virtual task body();

endclass: adder_uvc_sequence_base

function adder_uvc_sequence_base::new(string name ="");
super.new(name);
m_trans = adder_uvc_sequence_item::type_id::create("m_trans");
endfunction:new



task adder_uvc_sequence_base::body();
  start_item(m_trans);
  finish_item(m_trans);
endtask : body

`endif  // ADDER_UVC_SEQUENCE_BASE_SV
