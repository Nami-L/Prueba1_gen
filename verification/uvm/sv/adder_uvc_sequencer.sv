`ifndef ADDER_UVC_SEQUENCER_SV
`define ADDER_UVC_SEQUENCER_SV


class adder_uvc_sequencer extends uvm_sequencer #(adder_uvc_sequence_item);

  `uvm_component_utils(adder_uvc_sequencer)

  adder_uvc_config m_config;

  extern function new(string name, uvm_component parent);

  extern function void build_phase(uvm_phase phase);

endclass : adder_uvc_sequencer

function adder_uvc_sequencer::new(string name, uvm_component parent);
super.new(name,parent);
endfunction:new

function void adder_uvc_sequencer::build_phase(uvm_phase phase);

if(!uvm_config_db#(adder_uvc_config)::get(get_parent(),"","config",m_config))begin
    `uvm_fatal(get_name(), "Could not retrieve adder_uvc_config from config db")

end
endfunction:build_phase



`endif // ADDER_UVC_SEQUENCER_SV
