`ifndef ALIGNER_PACKAGE_SV
`define ALIGNER_PACKAGE_SV

 package aligner_env_pkg;
  `include"uvm_macros.svh"
   import uvm_pkg::*:
   import apb_pkg::*;
   `include"aligner_virtual_sequencer.sv"
   `include"aligner_environment.sv"
 endpackage

`endif //ALIGNER_PACKAGE_SV
