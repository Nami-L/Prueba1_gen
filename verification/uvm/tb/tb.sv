module tb;

  `include "uvm_macros.svh"
  import uvm_pkg::*;
  
  import top_test_pkg::*;

 // Clock signal
  localparam time CLK_PERIOD = 10ns;
  logic clk_i = 0;
  always #(CLK_PERIOD / 2) clk_i = ~clk_i;
  
  // Reset signal
  logic rst_i = 1;
  initial begin
    repeat(2) @(posedge clk_i);
    rst_i = 1;
    @(posedge clk_i);
    rst_i = 0;
  end
  

//Interface

adder_uvc_if adder_vif(clk_i);

adder dut(
 .A(adder),
 .B(adder),
 .C(adder)
);


  initial begin
    $timeformat(-9, 0, " ns", 10);
    uvm_config_db#(virtual adder_uvc_if)::set(null, "uvm_test_top.m_env.m_adder_agent", "vif", adder_vif);
    run_test();
  end

  
endmodule:tb