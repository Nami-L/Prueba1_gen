`ifndef ADDER_UVC_CONFIG_SV
`define ADDER_UVC_CONFIG_SV

class adder_uvc_config extends uvm_object;

  `uvm_object_utils(adder_uvc_config)

  uvm_active_passive_enum is_active   = UVM_ACTIVE;

  extern function new(string name = "");

endclass : adder_uvc_config


function adder_uvc_config::new(string name = "");
  super.new(name);
endfunction : new


`endif // ADDER_UVC_CONFIG_SV
