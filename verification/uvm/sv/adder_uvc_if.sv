`ifndef ADDER_UVC_IF_SV
`define ADDER_UVC_IF_SV

interface adder_uvc_if #(
  parameter Width = 8
)(input logic clk_i);

  logic [Width-1:0] A;
  logic [Width-1:0] B;
  logic [Width-1:0] C;



//valores por defecto
initial begin
A='d0;
B='d0;  

end

clocking cb_drv @(posedge clk_i);
    default input #1ns output #1ns;
    output  A;
    output  B;
    input   C;
  endclocking : cb_drv

  clocking cb_drv_neg @(negedge clk_i);
    default input #1ns output #1ns;
    output  A;
    output  B;
    input   C;
  endclocking : cb_drv_neg


endinterface: adder_uvc_if

`endif // ADDER_UVC_IF_SV
