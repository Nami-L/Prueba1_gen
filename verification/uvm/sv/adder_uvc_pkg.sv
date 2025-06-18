`ifndef ADDER_UVC_PKG_SV
`define ADDER_UVC_PKG_SV

package adder_uvc_pkg;

  `include "uvm_macros.svh"
  import uvm_pkg::*;

  `include "adder_uvc_sequence_item.sv"  // Este es de mayor jerarquía
  `include "adder_uvc_config.sv"
  `include "adder_uvc_sequencer.sv"
  `include "adder_uvc_driver.sv"
  `include "adder_uvc_monitor.sv"

  `include "adder_uvc_agent.sv"

  // Sequence library
  `include "adder_uvc_sequence_base.sv"

endpackage : adder_uvc_pkg

`endif  // ADDER_UVC_PKG_SV
