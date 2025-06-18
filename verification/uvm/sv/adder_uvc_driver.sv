`ifndef ADDER_UVC_DRIVER_SV
`define ADDER_UVC_DRIVER_SV

class adder_uvc_driver extends uvm_driver #(adder_uvc_sequence_item);

  `uvm_component_utils(adder_uvc_driver)

  virtual adder_uvc_if vif;
  adder_uvc_config     m_config;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);
  extern task run_phase(uvm_phase phase);
  extern task do_drive();

endclass : adder_uvc_driver


function adder_uvc_driver::new(string name, uvm_component parent);
super.new(name,parent);
endfunction:new

function void adder_uvc_driver::build_phase(uvm_phase phase);
  if (!uvm_config_db#(virtual adder_uvc_if)::get(get_parent(), "", "vif", vif)) begin
    `uvm_fatal(get_name(), "Could not retrieve adder_uvc_if from VIF db")
  end

if (!uvm_config_db#(adder_uvc_config)::get(get_parent(), "", "config", m_config)) begin
    `uvm_fatal(get_name(), "Could not retrieve adder_uvc_config from config db")
  end

endfunction:build_phase

task adder_uvc_driver::run_phase(uvm_phase phase);
forever begin
    //Lo que hace este run, por siempre, agarra el drive, agarra una transaction del sequencer
     seq_item_port.get_next_item(req);
     do_drive();
     seq_item_port.item_done();

end
endtask: run_phase

task adder_uvc_driver::do_drive();

  `uvm_info(get_type_name(), {"\n ------ DRIVER (adder UVC) ------", req.convert2string()}, UVM_DEBUG)

endtask: do_drive



`endif // ADDER_UVC_DRIVER_SV
