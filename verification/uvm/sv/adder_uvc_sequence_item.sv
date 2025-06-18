`ifndef ADDER_UVC_SEQUENCE_ITEM_SV
`define ADDER_UVC_SEQUENCE_ITEM_SV

class adder_uvc_sequence_item extends uvm_sequence_item;

  `uvm_object_utils(adder_uvc_sequence_item)

  // Transaction variables
  rand logic [7:0] m_A_trans;
  rand logic [7:0] m_B_trans;

  // Readout variables
  logic      [7:0] m_C_trans;


  extern function new(string name = "");

  extern function void do_copy(uvm_object rhs);
  extern function bit do_compare(uvm_object rhs, uvm_comparer comparer);
  extern function void do_print(uvm_printer printer);
  extern function string convert2string();

endclass : adder_uvc_sequence_item

function adder_uvc_sequence_item::new(string name = "");
  super.new(name);
endfunction : new

function void adder_uvc_sequence_item::do_copy(uvm_object rhs);
  // Cuando creo un objeto es un lugar de memoria y si quiero copiarlo necesito
  //agregar memoria

  //Al momento de mandar la transaction es un objeto necesito la copia de ese objeto
  adder_uvc_sequence_item rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal(get_type_name(), "Cast of rhs object failed")
  super.do_copy(rhs);


endfunction : do_copy

function bit adder_uvc_sequence_item::do_compare(uvm_object rhs, uvm_comparer comparer);

  bit result;
  adder_uvc_sequence_item rhs_;
  if (!$cast(rhs_, rhs)) `uvm_fatal(get_type_name(), "Cast of rhs object failed")

  result = super.do_compare(rhs, comparer);

  return result;


endfunction : do_compare

function void adder_uvc_sequence_item::do_print(uvm_printer printer);
  if (printer.knobs.sprint == 0) `uvm_info(get_type_name(), convert2string(), UVM_MEDIUM)
  else printer.m_string = convert2string();
endfunction : do_print

function string adder_uvc_sequence_item::convert2string();
  string s;
  s = super.convert2string();
  $sformat(s, {s, "\n", "TRANSACTION INFORMATION (adder UVC):"});
  $sformat(s, {s, "\n", "m_A_trans = %5d, m_B_trans = %5d, m_C_trans = %5d\n"}, m_A_trans,
           m_B_trans, m_C_trans);
  return s;
endfunction : convert2string



`endif  // ADDER_UVC_SEQUENCE_ITEM_SV
